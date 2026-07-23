param(
    [Parameter(Mandatory = $true)]
    [ValidateSet(0, 1)]
    [int]$CostPerUse,

    [Parameter(Mandatory = $true)]
    [ValidateSet(8, 12)]
    [int]$ScalarRegisters,

    [Parameter(Mandatory = $true)]
    [ValidateSet("false", "true")]
    [string]$AverageRegisterCosts,

    [ValidateSet("false", "true")]
    [string]$TailDuplication = "false",

    [string]$OutputName = ""
)

$ErrorActionPreference = "Stop"

$repo = (Resolve-Path (Join-Path $PSScriptRoot "..\..\..")).Path
$build = Join-Path $repo "build"
$cache = Join-Path $build "CMakeCache.txt"
$llvmSource = Join-Path $repo "deps\llvm-project"
$registerInfo = Join-Path $llvmSource "llvm\lib\Target\AVM\AVMRegisterInfo.td"
$configName = if ($OutputName) {
    $OutputName
} else {
    "cost$CostPerUse-regs$ScalarRegisters-avg$AverageRegisterCosts"
}
$configDir = Join-Path $PSScriptRoot $configName

if (Test-Path -LiteralPath $configDir) {
    throw "Refusing to overwrite existing configuration directory: $configDir"
}

$registerText = Get-Content -Raw -LiteralPath $registerInfo
$hasCostPerUse = $registerText -match "let CostPerUse = \[1\]"
if (($CostPerUse -eq 1) -ne $hasCostPerUse) {
    throw "AVMRegisterInfo.td does not match requested CostPerUse=$CostPerUse"
}

function Get-CacheValue([string]$Name) {
    $match = Select-String -LiteralPath $cache -Pattern "^${Name}:[^=]+="
    if (-not $match) {
        throw "Missing $Name in $cache"
    }
    return ($match.Line -split "=", 2)[1]
}

if ((Get-CacheValue "CMAKE_BUILD_TYPE") -ne "RelWithDebInfo") {
    throw "The main build is not configured as RelWithDebInfo"
}
if ((Get-CacheValue "CMAKE_GENERATOR") -ne "Ninja") {
    throw "The experiment expects the existing Ninja generator"
}

$compiler = Get-CacheValue "CMAKE_CXX_COMPILER"
$vsRoot = ($compiler -split "/VC/Tools/MSVC/", 2)[0]
$vcvars = Join-Path ($vsRoot -replace "/", "\") "VC\Auxiliary\Build\vcvars64.bat"
if (-not (Test-Path -LiteralPath $vcvars)) {
    throw "Matching MSVC developer environment not found: $vcvars"
}

$average = $AverageRegisterCosts.ToLowerInvariant()
$tailDup = $TailDuplication.ToLowerInvariant()
$experimentOptions =
    "-O2;-mllvm;-avm-tail-duplication=$tailDup" +
    ";-mllvm;-avm-tti-scalar-registers=$ScalarRegisters" +
    ";-mllvm;-avm-tti-average-register-costs=$average"

$devEnvironmentCommand = "`"$vcvars`" >nul && set"
$devEnvironment = & cmd.exe /d /s /c $devEnvironmentCommand
if ($LASTEXITCODE -ne 0) {
    throw "Failed to initialize the matching MSVC developer environment"
}
$developerPath = $null
foreach ($line in $devEnvironment) {
    if ($line -match "^([^=]+)=(.*)$") {
        if ($Matches[1] -ceq "PATH") {
            $developerPath = $Matches[2]
            continue
        }
        if ($Matches[1] -ieq "Path") {
            continue
        }
        [Environment]::SetEnvironmentVariable(
            $Matches[1], $Matches[2], "Process")
    }
}
if (-not $developerPath) {
    throw "MSVC developer environment did not provide PATH"
}
[Environment]::SetEnvironmentVariable("Path", $developerPath, "Process")
$activeCompiler = (Get-Command cl.exe -ErrorAction Stop).Source
if ([IO.Path]::GetFullPath($activeCompiler) -ne
    [IO.Path]::GetFullPath($compiler)) {
    throw "Developer environment compiler mismatch: $activeCompiler"
}

& cmake -S $repo -B $build "-DAVM_OPT_LEVEL=$experimentOptions"
if ($LASTEXITCODE -ne 0) {
    throw "CMake reconfiguration failed"
}

function Invoke-DeveloperBuild([string]$Target) {
    & cmake --build $build --parallel --target $Target
    if ($LASTEXITCODE -ne 0) {
        throw "CMake build failed for target $Target"
    }
}

Invoke-DeveloperBuild "avm_sysroot"
Invoke-DeveloperBuild "avm_bench"

New-Item -ItemType Directory -Path $configDir | Out-Null
$cyclesFile = Join-Path $configDir "cycles.txt"
& (Join-Path $build "avm_bench.exe") --c-only --c-output $cyclesFile
if ($LASTEXITCODE -ne 0) {
    throw "C benchmark run failed"
}

$assemblyDir = Join-Path $configDir "assembly"
Copy-Item -Recurse -LiteralPath (Join-Path $repo "bench\c\asm") `
    -Destination $assemblyDir

$elfDir = Join-Path $configDir "elf"
New-Item -ItemType Directory -Path $elfDir | Out-Null
Get-ChildItem -LiteralPath (Join-Path $build "bench\c") -Filter "*.elf" |
    ForEach-Object {
        Copy-Item -LiteralPath $_.FullName -Destination $elfDir
    }

$cycleMap = @{}
Get-Content -LiteralPath $cyclesFile | ForEach-Object {
    if ($_ -match "^\s*(\d+)\s+([A-Za-z0-9_]+)\.c$") {
        $cycleMap[$Matches[2]] = [long]$Matches[1]
    }
}

$readobj = Join-Path $build "llvm-build\bin\llvm-readobj.exe"
$metrics = foreach ($assemblyFile in
    (Get-ChildItem -LiteralPath $assemblyDir -Filter "*.asm" |
        Sort-Object BaseName)) {
    $benchmark = $assemblyFile.BaseName
    $lines = Get-Content -LiteralPath $assemblyFile.FullName
    $inFunction = $false
    $functionSize = 0
    $stackFrameSize = 0
    $sawFrameAdjustment = $false
    $stackAccesses = 0
    $compactAddSub = 0
    $fullAddSub = 0
    $compactXor = 0
    $fullXor = 0
    $compactMov = 0
    $fullMov = 0
    $shortBranches = 0
    $longBranches = 0
    $crcTableSize = 0
    $functionLines = New-Object System.Collections.Generic.List[string]

    foreach ($line in $lines) {
        if ($line -match "^[0-9a-fA-F]{8}\s+g\s+F\s+\.text\s+([0-9a-fA-F]{8})\s+avm_test_main$") {
            $functionSize = [Convert]::ToInt32($Matches[1], 16)
        }
        if ($line -match "^[0-9a-fA-F]{8}\s+l\s+O\s+\.data\s+([0-9a-fA-F]{8})\s+\.L\.crctable$") {
            $crcTableSize = [Convert]::ToInt32($Matches[1], 16)
        }

        if ($line -eq "<avm_test_main>:") {
            $inFunction = $true
            $functionLines.Add($line)
            continue
        }
        if ($inFunction -and $line -match "^<[^>]+>:$") {
            $inFunction = $false
        }
        if (-not $inFunction) {
            continue
        }
        $functionLines.Add($line)

        if ($line -notmatch "^\s*((?:[0-9a-fA-F]{2}\s+)+)([a-z][a-z0-9_.]*)\b") {
            continue
        }
        $rawBytes = [regex]::Matches($Matches[1], "[0-9a-fA-F]{2}") |
            ForEach-Object { [Convert]::ToInt32($_.Value, 16) }
        $byteCount = @($rawBytes).Count
        $mnemonic = $Matches[2]

        if ($mnemonic -match "^(ldsp|stsp)") {
            ++$stackAccesses
        }
        if ($mnemonic -match "^(add|sub)$") {
            if ($byteCount -eq 1) { ++$compactAddSub } else { ++$fullAddSub }
        }
        if ($mnemonic -eq "xor") {
            if ($byteCount -eq 1) { ++$compactXor } else { ++$fullXor }
        }
        if ($mnemonic -eq "mov") {
            if ($byteCount -eq 1) { ++$compactMov } else { ++$fullMov }
        }
        if ($mnemonic -match "^(br[a-z0-9]*8|jmp8)$") {
            ++$shortBranches
        }
        if ($mnemonic -match "^(br[a-z0-9]*16|jmp16)$") {
            ++$longBranches
        }
        if (-not $sawFrameAdjustment -and $mnemonic -eq "adjsp" -and
            $byteCount -ge 2) {
            $immediate = $rawBytes[$byteCount - 1]
            if ($immediate -ge 128) {
                $stackFrameSize = 256 - $immediate
                $sawFrameAdjustment = $true
            }
        }
    }

    if ($benchmark -eq "crc16") {
        $functionLines | Set-Content -LiteralPath (
            Join-Path $configDir "crc16_avm_test_main.asm")
    }

    $sectionOutput = & $readobj --sections (
        Join-Path $elfDir "$benchmark.elf")
    $currentSection = ""
    $sectionSizes = @{}
    foreach ($line in $sectionOutput) {
        if ($line -match "^\s*Name: (\.[^ ]+)") {
            $currentSection = $Matches[1]
        } elseif ($currentSection -and $line -match "^\s*Size: (\d+)") {
            $sectionSizes[$currentSection] = [int]$Matches[1]
            $currentSection = ""
        }
    }
    $textSize = 0
    $dataSize = 0
    $bssSize = 0
    if ($sectionSizes.ContainsKey(".text")) {
        $textSize = $sectionSizes[".text"]
    }
    if ($sectionSizes.ContainsKey(".data")) {
        $dataSize = $sectionSizes[".data"]
    }
    if ($sectionSizes.ContainsKey(".bss")) {
        $bssSize = $sectionSizes[".bss"]
    }

    [pscustomobject]@{
        configuration = $configName
        cost_per_use = $CostPerUse
        scalar_registers = $ScalarRegisters
        average_register_costs = $average
        tail_duplication = $tailDup
        benchmark = $benchmark
        cycles = $cycleMap[$benchmark]
        text_size = $textSize
        data_size = $dataSize
        bss_size = $bssSize
        function_size = $functionSize
        stack_frame_size = $stackFrameSize
        ldsp_stsp_count = $stackAccesses
        compact_add_sub_count = $compactAddSub
        full_add_sub_count = $fullAddSub
        compact_xor_count = $compactXor
        full_xor_count = $fullXor
        compact_mov_count = $compactMov
        full_mov_count = $fullMov
        short_branch_count = $shortBranches
        long_branch_count = $longBranches
        crc_table_exists = ($crcTableSize -ne 0)
        crc_table_size = $crcTableSize
    }
}

$metricsFile = Join-Path $configDir "metrics.csv"
$metrics | Export-Csv -NoTypeInformation -LiteralPath $metricsFile

$mirDir = Join-Path $configDir "mir"
New-Item -ItemType Directory -Path $mirDir | Out-Null
$clang = Join-Path $build "llvm-build\bin\clang.exe"
$commonCompileOptions = @(
    "--target=avm-unknown-arduboyfx",
    "-ffreestanding",
    "-fomit-frame-pointer",
    "-fno-stack-protector",
    "-fno-unwind-tables",
    "-fno-asynchronous-unwind-tables",
    "-ffunction-sections",
    "-fdata-sections",
    "-O2",
    "-Wall",
    "-Wextra",
    "-Werror",
    "-std=c11",
    "-isystem",
    (Join-Path $build "avm-sysroot\include"),
    "-mllvm",
    "-avm-tail-duplication=false",
    "-mllvm",
    "-avm-tti-scalar-registers=$ScalarRegisters",
    "-mllvm",
    "-avm-tti-average-register-costs=$average"
)

$raRows = foreach ($benchmark in @("bubble4", "float", "struct_copy")) {
    $source = Join-Path $repo "bench\c\$benchmark.c"
    $preGreedy = Join-Path $mirDir "$benchmark-pre-greedy.mir"
    $postGreedy = Join-Path $mirDir "$benchmark-post-greedy.mir"
    $postRewrite = Join-Path $mirDir "$benchmark-post-virtregrewriter.mir"

    & $clang @commonCompileOptions -mllvm -stop-before=greedy `
        -c $source -o $preGreedy
    if ($LASTEXITCODE -ne 0) { throw "pre-greedy MIR failed for $benchmark" }
    & $clang @commonCompileOptions -mllvm -stop-after=greedy `
        -c $source -o $postGreedy
    if ($LASTEXITCODE -ne 0) { throw "post-greedy MIR failed for $benchmark" }
    & $clang @commonCompileOptions -mllvm -stop-after=virtregrewriter `
        -c $source -o $postRewrite
    if ($LASTEXITCODE -ne 0) {
        throw "post-virtregrewriter MIR failed for $benchmark"
    }

    $postGreedyText = Get-Content -Raw -LiteralPath $postGreedy
    $spillStores = [regex]::Matches(
        $postGreedyText, "STACK_STORE(?:8|16|32)_PSEUDO %stack\.").Count
    $spillLoads = [regex]::Matches(
        $postGreedyText, "STACK_LOAD(?:8|16|32)_PSEUDO %stack\.").Count
    $spillSlots = [regex]::Matches(
        $postGreedyText, "type: spill-slot").Count

    $benchmarkMetrics = $metrics |
        Where-Object { $_.benchmark -eq $benchmark }
    [pscustomobject]@{
        configuration = $configName
        benchmark = $benchmark
        pre_greedy_stack_ops = (
            [regex]::Matches(
                (Get-Content -Raw -LiteralPath $preGreedy),
                "STACK_(?:LOAD|STORE)(?:8|16|32)_PSEUDO %stack\.").Count)
        post_greedy_spill_loads = $spillLoads
        post_greedy_spill_stores = $spillStores
        post_greedy_spill_slots = $spillSlots
        final_ldsp_stsp_count = $benchmarkMetrics.ldsp_stsp_count
        final_stack_frame_size = $benchmarkMetrics.stack_frame_size
        final_function_size = $benchmarkMetrics.function_size
        final_short_branches = $benchmarkMetrics.short_branch_count
        final_long_branches = $benchmarkMetrics.long_branch_count
    }
}
$raRows | Export-Csv -NoTypeInformation -LiteralPath (
    Join-Path $configDir "ra_metrics.csv")

@(
    "configuration=$configName",
    "cost_per_use=$CostPerUse",
    "scalar_registers=$ScalarRegisters",
    "average_register_costs=$average",
    "tail_duplication=$tailDup",
    "avm_opt_level=$experimentOptions",
    "llvm_head=$(& git -C $llvmSource rev-parse HEAD)"
) | Set-Content -LiteralPath (Join-Path $configDir "configuration.txt")

Write-Output "Completed $configName"
Get-Content -LiteralPath $metricsFile |
    Select-String -Pattern '"(bubble1|bubble2|bubble4|constant_arith|crc16|float|loop_control|multiply|progmem_widen_ldp32_bytes|record_scan|reverse_walk|shifts|sieve|small_memops|state_machine|string_scan|struct_copy)"'
