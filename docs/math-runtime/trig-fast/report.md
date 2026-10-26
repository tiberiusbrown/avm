# Fast trig reduction and validation profiles

2026-10-26. Measured from the actual working tree based on `fe0c0c1d46811a8c9378ccb557dd55ec3bff760b`, before replacing the reducer. All changes remain uncommitted. Callers use O2 and runtime math uses O3 with contraction disabled, in the existing RelWithDebInfo/MSVC/Ninja build. Cycle counts are ATmega32U4 interpreter cycles, not host timings.

Gameplay sine uses **66.3% fewer cycles**; the large-angle sine workload uses **73.0% fewer**. The complete warm fast workflow takes **12.99 s**, versus **330.66 s** for full validation. All 856 AVM fixtures and all native/high-precision acceptance checks pass.

## Selected implementation

- Inline the compact ordinary reducer in sinf/cosf/tanf/sincosf; share the cold integer window helper. Keep the same public math ABI and FPOLY coefficients. The internal result is one float plus low quotient bits. sincosf performs one reduction and shares x*x.
- Up to **100,000 radians**, use `uint32_t doubled=(uint32_t)(fabsf(x)*0x1.45f306p0f); n=(doubled+1)>>1`. The quotient estimate has exactly one floating multiply, one unsigned conversion, and integer add/shift. There is no floorf or floating +0.5. Finite/nonnegative/range checks precede the conversion.
- Reconstruct `(a-fn*0x1.92p0f)-fn*0x1.fb5444p-12f`. At the selected cutoff, n<=63662 and 201*n<2^24, so the high product is exact. More generally that proof stops at n=83468; the 2^17 candidate is safe for the high product, while 200,000 is not. Correct an estimate outside the rounded pi/4 interval by updating both remainder and quadrant.
- A bit/exponent cancellation guard protects the reciprocal used by tangent. Small quotients through 128 use a cold three-part split, including exact high products; other cancellations enter the window helper. Magnitude reduction restores sign/quadrant afterward. Signed zeros, infinities and NaNs retain explicit behavior.
- Above the cutoff, use an exponent-indexed 2/pi coefficient window with 24 product guard bits. Normally retain 32 fractional bits. Recompute a local 48-bit window near cancellation or when omitted bits could cross the nearest-quadrant boundary. Every product is native 8-by-8 with bounded 16-bit carry sums; no general 32/64-bit multiply, wide-shift helper, full 280-bit product or double-float compensation survives in production.
- The coefficient table is 128 records of 10 bytes. Source requests one program-memory copy; current codegen splits it into field reads. The arithmetic is reentrant and the table is immutable.

## Accuracy contract and results

Sine/cosine, including the paired API, retain absolute error <=1e-5 for |x|<=2^20. The ordinary gameplay target therefore covers |x|<=10,000. Larger finite binary32 inputs are approximate; sampled large angles use the same acceptance budget, without an exhaustive all-finite quadrant guarantee. Near-half-integer and cancellation ambiguity is detected before accepting the short window. Sine/cosine stay bounded within their error budget; NaN/infinity results and tested tangent pole signs retain their expected classification/sign.

**Tangent pole relaxation:** all finite results, including pole neighbors, now use `abs(error) <= 1e-4 + 1e-4*abs(reference)`. The previous four-ULP pole requirement is removed explicitly. Zero signs, NaNs/infinities and marked exact identities remain exact checks. The large relative-looking error near |tan|~1 is covered by the absolute term; this is a hybrid rule, not a universal 1e-4 relative promise.

The full native corpus checks 26,165,845 inputs each for sine/cosine and 26,174,227 for tangent. Maximum sine/cosine absolute errors were 1.796e-6 at `c7ab64b6` and 1.798e-6 at `c78d8094`. Native tangent pole cases reached 512 ULP under the new hybrid policy; all passed. The 100-digit mpmath corpus below also models the actual extended FPOLY arithmetic in its production host shim.

| Function | High-precision cases | Worst absolute error | Input bits | Failures |
|---|---:|---:|---|---:|
| sinf | 39,398 | 1.79592422e-06 | `c7ab64b6` | 0 |
| cosf | 39,391 | 1.79785676e-06 | `c78d8094` | 0 |
| tanf | 39,461 | 8.98011186 | `c096cbdf` | 0 |
| sincos_sinf | 39,117 | 1.79592422e-06 | `c7ab64b6` | 0 |
| sincos_cosf | 39,110 | 1.79785676e-06 | `c78d8094` | 0 |

Absolute tangent error grows near poles: its 8.9801 worst absolute error is a 2.13e-5 relative error in the high-precision pole region, using 21.3% of the hybrid budget. Away from poles, the worst case used 68.5% of the budget.

| Huge-input region (abs(x)>2^20) | Cases | Worst absolute error | Input bits | Failures |
|---|---:|---:|---|---:|
| sinf | 6,161 | 1.15017022e-06 | `e05f6daf` | 0 |
| cosf | 6,153 | 1.13929291e-06 | `ee673b0f` | 0 |
| tanf | 6,156 | 0.00297873227 | `e45498f2` | 0 |

Dense reduction validation checks both 32- and 48-bit column products against independent uint64 limb arithmetic for every normalized mantissa, cycling all exponent windows. It also performs **18,450,260** signed reduction quality checks against host double sin/cos, including every exponent, small/subnormal boundaries, quotient edges, poles and cutoff neighbors. Worst reconstruction error was **1.09722e-6 at 47bd0e90**. There were **0 nearest-quadrant differences above the cutoff**. Sixteen ordinary interval-seam choices differed from the independent nearest quadrant; their equivalent adjacent representations still met the reconstruction error bound. These are disclosed rather than hidden by an exact-quadrant claim.

Permanent 100-digit fixtures include every discovered worst input, both signs, pi/4 and pi/2 neighborhoods, cutoff neighbors, and small/large cancellation. Full mode retains the dense sqrt/log/atan/power/reduction loops; only quick mode stratifies them. fmod, rounding, signs and classifications were not relaxed.

## Identical-workload cycles

Each row is 32 calls, including unchanged argument loads, caller/loop overhead and accumulation. The runner subtracts the same 35-cycle adjacent-break baseline. These workloads were added and measured before production changes; historical checked-in cycles_c.txt values were not used.

| Function / input domain | Before | After | Cycles saved |
|---|---:|---:|---:|
| sin / direct | 113,547 | 79,167 | 30.3% |
| sin / game | 843,135 | 283,919 | 66.3% |
| sin / poles | 292,298 | 226,459 | 22.5% |
| sin / edge | 2,208,590 | 584,851 | 73.5% |
| sin / large | 2,381,492 | 642,956 | 73.0% |
| cos / direct | 115,830 | 83,907 | 27.6% |
| cos / game | 845,263 | 302,723 | 64.2% |
| cos / poles | 293,576 | 244,668 | 16.7% |
| cos / edge | 2,208,731 | 598,151 | 72.9% |
| cos / large | 2,381,388 | 657,224 | 72.4% |
| tan / direct | 101,166 | 98,502 | 2.6% |
| tan / game | 886,495 | 314,383 | 64.5% |
| tan / poles | 362,329 | 277,593 | 23.4% |
| tan / edge | 2,247,728 | 611,302 | 72.8% |
| tan / large | 2,421,053 | 665,538 | 72.5% |
| sincos / direct | 167,615 | 148,658 | 11.3% |
| sincos / game | 908,892 | 353,115 | 61.1% |
| sincos / poles | 382,984 | 315,336 | 17.7% |
| sincos / edge | 2,268,339 | 649,025 | 71.4% |
| sincos / large | 2,442,317 | 705,130 | 71.1% |

`direct` is |x|<=pi/4, including signed zero/subnormals; `game` includes both signs of 1, 2, 2*pi, 10, 100, 1,000 and 10,000. `poles` includes pi/2 and 2*pi neighbors and the pi/4 dispatch seam. `edge` spans 201 through 2^20, both 2^17 neighbors, and 100,000. `large` spans exponents 16,32,48,64,80,96,127 and both signs. Exact fixture values live in bench/c/math_trig_workload.h.

### Reduced-path and arithmetic decomposition

Reducer rows call the internal reducer directly, with the same inputs/accumulation. The baseline old objects were retained in ignored build/math-before and relinked only into test images to measure the former two-float ABI. They are not retained as a production implementation.

| Internal reducer / domain | Before | After | Cycles saved |
|---|---:|---:|---:|
| direct | 88,267 | 64,843 | 26.5% |
| game | 752,921 | 232,197 | 69.2% |
| poles | 231,189 | 205,101 | 11.3% |
| edge | 2,112,156 | 523,106 | 75.2% |
| large | 2,285,419 | 583,789 | 74.5% |

| Focused microbenchmark, 32 iterations | Cycles |
|---|---:|
| One-multiply quotient, uint32 | 39,251 |
| One-multiply quotient, uint16 (inputs <=30,000) | 35,813 |
| Multiply + float bias + uint32 conversion | 44,435 |
| Split remainder reconstruction | 78,328 |
| Remainder/quadrant correction, including out-of-interval inputs | 56,912 |
| Shared square + sine/cosine FPOLY pair | 111,015 |

Microbenchmarks include their own loads/loop/sink; they are not additive instruction-only estimates. Wrapper/direct rows above measure the polynomial with real dispatch. Final disassembly confirms FTOU32, U32TOF, the one quotient FMUL and integer shift, shared sincos square, and the odd-quadrant tangent reciprocal.

## Candidate decisions

Numerical cutoff tests used approximately 700,000 deterministic bit patterns, exponent-stratified samples, pi/2 cancellations and quotient half-integer neighbors, with 100-digit references for worst inputs. Error in the raw split grows from ~3.2e-8 at 201 to ~1.1e-6 at 100,000 and ~2.2e-6 at 2^17; at 200,000 it reaches 0.0078 because the high product is no longer exact. The rounded quotient estimate alone was never treated as a quadrant proof. See cutoffs.json.

Actual interpreter measurements for each cutoff used identical callers:

| Fast cutoff | sine/game | sine/edge | sine/large |
|---|---:|---:|---:|
| 201 | 421,495 | 736,048 | 775,001 |
| 1,024 | 370,699 | 698,095 | 775,001 |
| 10,000 | 320,515 | 661,009 | 776,057 |
| 30,000 | 320,515 | 622,784 | 776,057 |
| 50,000 | 320,515 | 637,616 | 776,057 |
| 100,000 | 320,515 | 614,525 | 674,522 |
| 131,072 | 319,855 | 638,464 | 673,466 |

The 100,000 cutoff minimizes the sum of those three workloads among the tested safe candidates; 2^17 adds cancellation work at its edge. These cutoff rows precede inlining and the final ambiguity guard, so compare within this table.

- The uint16 estimate wins in isolation (35,813 vs 39,251 cycles), but the tested <=50,000/uint32 hybrid loses on gameplay (325,651 vs 319,855 cycles) because of selection/spills. Keep one uint32 path.
- A naive split 24x32/64 arithmetic fallback compiled into __avm_mulsi3/__avm_muldi3; its sine/large workload took 2,006,680 cycles. Native-byte columns reduced that to 777,338 with an always-48-bit result. The 32-bit window plus cancellation extension reduced it to 673,466 before inlining. The extension is necessary to keep useful tangent quality near tiny remainders; no permanent experiment selector or precision mode remains.
- Shared reduction at cutoff 100,000 gave 320,515 sine/game cycles; inlining gave 283,919. The cold window helper remains shared. A proposed integer-threshold correction was also measured and rejected: spills made sine/game 345,883 rather than 319,855 at the compared 2^17 setting.
- Reusing a reset, decoded emulator sequentially reduced the 36-workload sweep from 1.94 s to 1.39 s despite the extra final guard. The final 39-workload sweep takes 1.43 s (0.62 s setup/loading, 0.81 s emulation). Cycles match isolated one-image runs. There is no shared-state parallel execution.

## Code, table and stack resources

Object text sizes below are actual unrelaxed symbol sizes; linked images also include startup/caller code and 256-byte packaging. The former 2/pi digits were instruction immediates; the new table is separate program data.

| Symbol | Before text bytes | After text bytes |
|---|---:|---:|
| __ieee754_rem_pio2f | 691 | 446 |
| __kernel_rem_pio2f | 3,232 | 1,819 |
| sinf | 338 | 613 |
| cosf | 334 | 642 |
| tanf | 209 | 600 |
| sincosf | 205 | 647 |

| Resource | Before | After |
|---|---:|---:|
| Separate 2/pi coefficient table | 0 B | 1,280 B |
| Linked sine text + reducer + table, excluding caller/startup (unrelaxed) | 4,261 B | 3,712 B |
| All four trig wrappers + shared reducer + table (unrelaxed) | 5,009 B | 5,601 B |
| Measured peak guest stack, including benchmark caller | 135 B | 133 B |
| Measured peak native stack growth within math interval | 16 B | 16 B |
| Interpreter HEX data bytes | 27,176 B | 27,176 B |

Inlining saves time but duplicates small-path text when all four APIs are linked. The standalone __ieee754_rem_pio2f entry is used by internal probes; production wrappers inline its same header body and do not link that entry. No old reducer is linked. Interpreter SHA-256 is unchanged: `4a849b7a07998622d00df2f8a4da91c34a43f501a2261d4c34331b9a01b601d6`. Stack measurement is a separate instruction-stepped pass, requested only by --stack-output; the guest limit remains 256 bytes. These are sampled benchmark peaks, not a claim about unrelated application stacks.

## Fast/full workflow measurements and reproduction

Run from the matching configured compiler developer environment; retain the existing CMake generator/compiler and RelWithDebInfo. Python needs mpmath. No target below invokes a build backend directly.

```sh
python tests/math/run_profile.py --profile fast
python tests/math/run_profile.py --profile full
python tests/math/run_profile.py --profile math-full
python tests/math/run_profile.py --profile bench

cmake --build build --config RelWithDebInfo --target avm_tests avm_math_fast_images avm_bench avm_trig_bench_images --parallel 8
build/avm_tests --filter 'math_(sinf|cosf|tanf|sincos)' --opt O0,O2
build/avm_tests --filter 'math_' --opt O0,O2 --list
build/avm_bench --c-only --filter '^math_trig_' --c-output build/trig-cycles.txt
build/avm_bench --c-only --filter '^math_trig_' --c-output build/trig-cycles-stack.txt --stack-output build/trig-stack.tsv

python tests/math/accuracy_reference.py --profile fast --samples 64 --rounds 0 --functions sinf cosf tanf --output build/trig-quick.json
python tests/math/generate_reduction_table.py --check
python tests/math/reducer_cutoffs.py --output build/cutoffs.json
python tests/math/capture_trig_resources.py --output build/trig-resources.json
```

| Workflow | Measured end-to-end wall time | Coverage |
|---|---:|---|
| First fast run, including configure/selected rebuild | 82.89 s | 84 AVM images, native quick checks, 100-digit quick corpus, FPOLY/SPI checks |
| Warm incremental fast run | 12.99 s | Same checks, including incremental build |
| Full validation | 330.66 s | 856 AVM cases, six optimization levels, full dense native and 100-digit adaptive searches, all existing hardware suites |
| Focused benchmark workflow | 2.28 s | Build plus 39 cycle benchmarks; no stack stepping |
| Explicit stack/cycle sweep | 4.48 s | Same 39 workloads plus separate per-instruction stack pass |

The full timing is the first complete validation run after the production changes.
Subsequent additions to the worst-case fixtures, both-width product checks, and
CLI/cache regression harness were validated separately; the expanded fixtures
passed all six levels and the final fast workflow passed again. The full timing
includes the initial image rebuild, while the fast timing is explicitly warm.

Fast-image dependencies contain exactly 84 math binaries, all at O0/O2. They do not depend on avm_test_images or exhaustive/native-run targets and do not build unrelated audio/display/timer fixtures. Full-image dependencies retain all 856 cases; math-only full retains 252 images across six levels. Native quick checks keep exceptions/identities, all exponent boundaries, subnormal samples, table interpolation neighbors and adversarial fixtures; exhaustive loops are available without --quick. Full native power alone retains 213,895,588 cases.

Full validation also passed 3,373 FPOLY cases with 195 audio interrupts/SPI continuation checks, 152 PUSH16/POP16 cases, 1,133 stack-bound cases, three display controllers, audio/Timer1 coverage and all Timer0 platform variants. CLI regression coverage checks invalid/empty filters, optimization levels, image-free listing, missing unselected images, safe partial output and sequential-vs-isolated emulator cycles.

Runners now build independently of the image matrix. Existing avm_tests_run and avm_bench_run retain full build/run behavior; CI already uses avm_tests_run and remains intact. No-filter executable runs still select everything. --opt affects compiled tests only; assembly runs once. Partial benchmarks default to separate *.selected.txt files unless an output is explicitly provided; committed long-run reports and cycles_c.txt are not overwritten by a quick run.

## Remaining bottlenecks

1. **Fallback columns and spills.** The native-byte product still has coefficient loads, carry arithmetic and stack traffic. It is much smaller than the former all-column product, but expensive relative to a game-path reduction. Reducing table/index traffic could help large-angle-heavy programs; it is a lower priority for gameplay.
2. **Three ordinary-path float multiplies and conversions.** One estimates the quotient; two reconstruct the remainder. The measured uint16 hybrid and integer-threshold alternative did not help. Further small-path guest changes should be benchmarked carefully because register spills can dominate nominal instruction savings.
3. **FPOLY and tangent division.** The selected approximations remain intact. sincos shares x*x and reduction, but still evaluates two polynomials. Odd-quadrant tangent needs its -1/tan(r) reciprocal. New native instructions and global fast-math were deliberately outside this task.
4. **Duplicated inline text.** Inlining is worthwhile for speed and remains within measured guest-stack bounds; further duplication of the cold path is unlikely to help.

Raw evidence: before/after-cycles.txt, before-reducer-cycles.txt, before/after-stack.tsv, before/after-resources.json, cutoffs.json, experiments.json, accuracy-full.json and validation.json in this directory. Generated production and benchmark disassemblies are retained in runtime/asm/lib/math and bench/c/asm. Historical phase 1-4 reports remain untouched.
