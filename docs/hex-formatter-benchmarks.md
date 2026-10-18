# Hexadecimal float formatter size and performance comparison

Baseline: commit `ec9e9b9`, including the accepted CSET optimization. The candidate replaces six repeated hexadecimal fraction digit extraction blocks with a loop that emits two digits per byte. Integer `%x`/`%X` formatting and decimal float formatting are unchanged.

Measurements use the repository's Ardens AVR emulator with unmerged native instructions, the same guest binaries, and a 16 MHz CPU. Baseline firmware and timing outputs are retained under ignored `build/hex-baseline/`. Positive cycle/percentage differences mean slower execution.

## Size

| Metric | Before | After | Difference |
| --- | ---: | ---: | ---: |
| Default firmware bytes | 29,056 | 29,008 | -48 (-0.1652%) |
| Free bytes below 29,696-byte ceiling | 640 | 688 | +48 |
| Hexadecimal fraction generator bytes | 98 | 52 | -46 |

SSD1306, SSD1309, MINI, and FXC images are 29,008 bytes. SH1106 is 29,036 bytes, leaving 660 bytes free and saving the same 48 bytes.

The remaining two bytes of firmware savings come from removing the final alignment NOP. SRAM workspace and native stack requirements are unchanged. Together with CSET, these two optimizations save **464 bytes** from the previous 29,472-byte firmware.

## Timing

The three-byte loop performs five more native cycles than the unrolled generator, independent of the significand and letter case. This adds **0.3125 microseconds** to each finite `%a`/`%A` conversion at 16 MHz. Zero still generates six fraction digits before trimming, so it has the same five-cycle increase. NaN and infinity bypass digit generation.

The native generator's measured range changes from **118–142 to 123–147 cycles**, including its RET and excluding a caller's RCALL. For identical inputs, every delta is exactly five cycles. The bounds differ with the number and case of alphabetic digits; the endpoint increases are 4.2373% and 3.5211%, respectively.

Only these 17 of the 1,018 instruction/SYS benchmark cases change. All are `SYS debug_printfv_P` cases with one finite hexadecimal float conversion and q3 padding set to `0xa5`:

| Case | Before cycles | After cycles | Delta cycles | Delta % |
| --- | ---: | ---: | ---: | ---: |
| `%a`, positive zero | 1,353 | 1,358 | +5 | +0.3695% |
| `%a`, negative zero | 1,387 | 1,392 | +5 | +0.3605% |
| `%a`, 1.5 exact trimmed | 1,462 | 1,467 | +5 | +0.3420% |
| `%A`, 0.1 uppercase exact | 1,471 | 1,476 | +5 | +0.3399% |
| `%.6a`, 0.1 full binary32 fraction | 1,610 | 1,615 | +5 | +0.3106% |
| `%a`, minimum normal | 1,411 | 1,416 | +5 | +0.3544% |
| `%a`, minimum subnormal | 1,629 | 1,634 | +5 | +0.3069% |
| `%a`, largest subnormal normalized | 1,536 | 1,541 | +5 | +0.3255% |
| `%.0a`, largest subnormal rounds into normal range | 1,952 | 1,957 | +5 | +0.2561% |
| `%.0a`, maximum finite rounds to exponent +128 | 1,938 | 1,943 | +5 | +0.2580% |
| `%.1a`, maximum finite rounded with explicit fraction | 1,978 | 1,983 | +5 | +0.2528% |
| `%+018.3a`, positive zero padding after prefix | 2,150 | 2,155 | +5 | +0.2326% |
| `%-18.2A`, negative uppercase left alignment | 2,127 | 2,132 | +5 | +0.2351% |
| `%#.0a`, forced radix point | 1,934 | 1,939 | +5 | +0.2585% |
| `%.8a`, precision beyond exact fraction | 1,609 | 1,614 | +5 | +0.3108% |
| `%.*a`, dynamic precision 3 | 1,769 | 1,774 | +5 | +0.2826% |
| Mixed `%f %e %g %a`, packed float arguments | 6,880 | 6,885 | +5 | +0.0727% |

The remaining **1,001 instruction/SYS cases**, all **78 C benchmarks**, and all **five C++ benchmarks** are unchanged: **0 cycles (0%)** each. The C suite total stays **137,652,401 cycles**; the C++ total stays **4,673,663 cycles**. The fixed compiled benchmark suites do not exercise this hexadecimal float formatter path.

## Validation

The new native regression check passes against both baseline and candidate firmware for **7,192 combinations** of byte patterns, deterministic random significands, uppercase/lowercase output, and native T state. It compares all six digits with an independent C++ hexadecimal formatter and checks workspace guards, unchanged source significands, preserved formatter registers/pointers, T preservation, and balanced native stack state.

Existing float formatting fixtures cover normalization, subnormals, signed zeros, rounding ties and carries, precision 0 through beyond six, width, padding, alternate form, case, and mixed argument lists.

The complete `avm_bench_run` target passes: all **471 AVM fixtures**, **12 Python audio compiler tests**, **152 PUSH/POP cases**, **1,133 stack-bound cases**, the native CSET/formatter/audio checks, and **88 display preservation/sequencing cases per controller**. All firmware variants and both example packages are rebuilt. SHA256 checks confirm all 87 saved benchmark images remain byte-identical; final timing files match the isolated candidate run.

Startup and audio initialization remain 235,687 and 1,837 cycles respectively. The Timer3 ISR remains 178–185 cycles, atomic chord commit remains 120 cycles, and the libm/formatter stress test with sample interrupts still reaches 41 bytes of native stack.
