# AVM physical-copy benchmark comparison

Configuration: existing Ninja/MSVC build, RelWithDebInfo, AVM -O2. Both phases ran the complete `avm_bench_run` CMake target with the same sources, interpreter and inputs. Code size is the linked ELF `.text` section; packaged image size is also checked. Deltas are after minus before.

372 C/C++ benchmarks and 876 instruction measurements. Individual regressions: 0 C/C++, 0 instruction.

| Metric | Before | After | Saved | Improvement |
|---|---:|---:|---:|---:|
| Text bytes | 270,613 | 270,245 | 368 | 0.1360% |
| Interpreter cycles | 554,049,605 | 549,871,260 | 4,178,345 | 0.7541% |
| Packaged image bytes | 2,234,880 | 2,234,624 | 256 | 0.0115% |

## Validation and scope

- LLVM AVM code-generation tests: 139/139 passed, including 30 physical-copy MIR cases.
- LLVM AVM MC tests: 215/215 passed.
- Clang AVM C/C++ code-generation tests: 44/44 passed.
- AVM execution tests: 1,438/1,438 passed before and after.
- Both complete benchmark runs used `cmake --build build --config RelWithDebInfo --parallel 8 --target avm_bench_run`, the existing Ninja generator and matching MSVC environment, and AVM `-O2` benchmark compilation.
- Every one of the 372 C/C++ rows was checked independently for non-increasing `.text` bytes, interpreter cycles, and packaged image bytes. All 876 instruction timings were checked independently, and their complete fixture ELF is byte-identical.
- Aggregate totals above sum the 372 separately linked C/C++ benchmark images, including each image's runtime code. The instruction fixture and its timings are unchanged.
- The implementation is localized to `AVMLatePeephole.cpp`; register allocation, instruction selection, runtime headers, benchmark inputs, and AVM execution checks are unchanged. Generated benchmark disassemblies are retained.
- No special inline-assembly handling is included. The MIR example removes the MOV. The actual `sinf` retains its MOV because of its existing inline-assembly barrier, as agreed for this task.

C/C++ data is also available in [CSV form](physical-copy-forwarding.csv). Instruction measurements are in [instruction CSV form](physical-copy-forwarding-instructions.csv).

## Every C/C++ benchmark

| Benchmark | Text before | Text after | Delta | Cycles before | Cycles after | Delta | Image before | Image after | Delta |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| aggregate_args.c | 490 | 486 | -4 | 1161329 | 1149329 | -12000 | 5376 | 5376 | 0 |
| aggregate_return.c | 463 | 463 | 0 | 1062270 | 1062270 | 0 | 5120 | 5120 | 0 |
| aliasing.c | 332 | 332 | 0 | 2094135 | 2094135 | 0 | 5120 | 5120 | 0 |
| bit_count.c | 502 | 502 | 0 | 1849275 | 1849275 | 0 | 5120 | 5120 | 0 |
| bitfields.c | 1141 | 1141 | 0 | 1694705 | 1694705 | 0 | 5888 | 5888 | 0 |
| boolean_select.c | 300 | 300 | 0 | 769245 | 769245 | 0 | 5120 | 5120 | 0 |
| bounded_multiply.c | 284 | 284 | 0 | 285203 | 285203 | 0 | 5120 | 5120 | 0 |
| bounded_shifts.c | 633 | 625 | -8 | 54961 | 53649 | -1312 | 5376 | 5376 | 0 |
| bubble1.c | 306 | 306 | 0 | 1316321 | 1316321 | 0 | 5120 | 5120 | 0 |
| bubble2.c | 302 | 302 | 0 | 1163105 | 1163105 | 0 | 5120 | 5120 | 0 |
| bubble4.c | 320 | 320 | 0 | 1785131 | 1785131 | 0 | 5120 | 5120 | 0 |
| byte_comparisons.c | 1033 | 1033 | 0 | 1108632 | 1108632 | 0 | 5888 | 5888 | 0 |
| byte_load_liveout.c | 406 | 406 | 0 | 723722 | 723722 | 0 | 5120 | 5120 | 0 |
| byte_phi_stream.c | 364 | 364 | 0 | 9460839 | 9460839 | 0 | 5120 | 5120 | 0 |
| call_args.c | 355 | 355 | 0 | 238967 | 238967 | 0 | 5120 | 5120 | 0 |
| conditional_fdiv_likely.c | 435 | 435 | 0 | 621908 | 621908 | 0 | 5376 | 5376 | 0 |
| conditional_fdiv_mixed.c | 449 | 449 | 0 | 563635 | 563635 | 0 | 5376 | 5376 | 0 |
| conditional_fdiv_skipped.c | 427 | 427 | 0 | 510232 | 510232 | 0 | 5376 | 5376 | 0 |
| conditional_fdiv_taken.c | 435 | 435 | 0 | 621908 | 621908 | 0 | 5376 | 5376 | 0 |
| conditional_fdiv_unlikely.c | 424 | 424 | 0 | 475928 | 475928 | 0 | 5376 | 5376 | 0 |
| constant_arith.c | 404 | 404 | 0 | 7304404 | 7304404 | 0 | 5376 | 5376 | 0 |
| constant_init.c | 278 | 278 | 0 | 294026 | 294026 | 0 | 5120 | 5120 | 0 |
| count_leading_zeros.c | 489 | 489 | 0 | 723076 | 723076 | 0 | 5120 | 5120 | 0 |
| count_trailing_zeros.c | 478 | 478 | 0 | 581536 | 581536 | 0 | 5120 | 5120 | 0 |
| crc16.c | 287 | 287 | 0 | 525762 | 525762 | 0 | 5632 | 5632 | 0 |
| ctype_isalnum.c | 443 | 443 | 0 | 2029207 | 2029207 | 0 | 5120 | 5120 | 0 |
| ctype_isalpha.c | 436 | 436 | 0 | 1766039 | 1766039 | 0 | 5120 | 5120 | 0 |
| ctype_isblank.c | 436 | 436 | 0 | 1778375 | 1778375 | 0 | 5120 | 5120 | 0 |
| ctype_iscntrl.c | 436 | 436 | 0 | 1778375 | 1778375 | 0 | 5120 | 5120 | 0 |
| ctype_isdigit.c | 433 | 433 | 0 | 1659127 | 1659127 | 0 | 5120 | 5120 | 0 |
| ctype_isgraph.c | 433 | 433 | 0 | 1659127 | 1659127 | 0 | 5120 | 5120 | 0 |
| ctype_islower.c | 433 | 433 | 0 | 1659127 | 1659127 | 0 | 5120 | 5120 | 0 |
| ctype_isprint.c | 433 | 433 | 0 | 1659127 | 1659127 | 0 | 5120 | 5120 | 0 |
| ctype_ispunct.c | 452 | 452 | 0 | 1995687 | 1995687 | 0 | 5120 | 5120 | 0 |
| ctype_isspace.c | 438 | 438 | 0 | 1850335 | 1850335 | 0 | 5120 | 5120 | 0 |
| ctype_isupper.c | 433 | 433 | 0 | 1659127 | 1659127 | 0 | 5120 | 5120 | 0 |
| ctype_isxdigit.c | 443 | 443 | 0 | 2029207 | 2029207 | 0 | 5120 | 5120 | 0 |
| ctype_tolower.c | 406 | 406 | 0 | 1663031 | 1663031 | 0 | 5120 | 5120 | 0 |
| ctype_toupper.c | 406 | 406 | 0 | 1663031 | 1663031 | 0 | 5120 | 5120 | 0 |
| div_pow2.c | 840 | 840 | 0 | 1577424 | 1577424 | 0 | 5632 | 5632 | 0 |
| divmod.c | 963 | 963 | 0 | 759366 | 759366 | 0 | 5632 | 5632 | 0 |
| draw_text.c | 226 | 226 | 0 | 18870 | 18870 | 0 | 6144 | 6144 | 0 |
| draw_text_P.c | 232 | 232 | 0 | 20978 | 20978 | 0 | 5888 | 5888 | 0 |
| dynamic_stack.c | 322 | 322 | 0 | 736876 | 736876 | 0 | 5120 | 5120 | 0 |
| fibonacci.c | 261 | 261 | 0 | 236880 | 236880 | 0 | 5120 | 5120 | 0 |
| fir8.c | 567 | 567 | 0 | 2943436 | 2943436 | 0 | 5376 | 5376 | 0 |
| fixed_point.c | 477 | 476 | -1 | 6801804 | 6766988 | -34816 | 5376 | 5376 | 0 |
| float.c | 470 | 470 | 0 | 946391 | 946391 | 0 | 5120 | 5120 | 0 |
| float_comparisons.c | 447 | 447 | 0 | 827553 | 827553 | 0 | 5120 | 5120 | 0 |
| float_conversions.c | 726 | 726 | 0 | 616391 | 616391 | 0 | 5376 | 5376 | 0 |
| indirect_call.c | 292 | 292 | 0 | 84966 | 84966 | 0 | 5120 | 5120 | 0 |
| loop_control.c | 280 | 280 | 0 | 11045125 | 11045125 | 0 | 5120 | 5120 | 0 |
| loop_shapes.c | 382 | 382 | 0 | 3412152 | 3412152 | 0 | 5120 | 5120 | 0 |
| math_acos.c | 479 | 479 | 0 | 161766 | 161766 | 0 | 5376 | 5376 | 0 |
| math_acosh.c | 653 | 653 | 0 | 210708 | 210708 | 0 | 5376 | 5376 | 0 |
| math_asin.c | 459 | 459 | 0 | 158536 | 158536 | 0 | 5376 | 5376 | 0 |
| math_asin_general.c | 459 | 459 | 0 | 163880 | 163880 | 0 | 5376 | 5376 | 0 |
| math_asinh.c | 632 | 632 | 0 | 205148 | 205148 | 0 | 5376 | 5376 | 0 |
| math_atan.c | 649 | 649 | 0 | 145955 | 145955 | 0 | 5376 | 5376 | 0 |
| math_atan2.c | 870 | 870 | 0 | 253291 | 253291 | 0 | 5632 | 5632 | 0 |
| math_atan2_ratios.c | 837 | 837 | 0 | 224506 | 224506 | 0 | 5888 | 5888 | 0 |
| math_atan_general.c | 646 | 646 | 0 | 147218 | 147218 | 0 | 5376 | 5376 | 0 |
| math_atanh.c | 729 | 729 | 0 | 213360 | 213360 | 0 | 5632 | 5632 | 0 |
| math_cbrt.c | 487 | 487 | 0 | 220280 | 220280 | 0 | 5376 | 5376 | 0 |
| math_ceil.c | 322 | 322 | 0 | 37807 | 37807 | 0 | 5120 | 5120 | 0 |
| math_classify.c | 427 | 426 | -1 | 135799 | 134711 | -1088 | 5120 | 5120 | 0 |
| math_cos.c | 362 | 362 | 0 | 120516 | 120516 | 0 | 5120 | 5120 | 0 |
| math_cos_small.c | 362 | 362 | 0 | 106495 | 106495 | 0 | 5120 | 5120 | 0 |
| math_cosh.c | 675 | 675 | 0 | 180812 | 180812 | 0 | 5376 | 5376 | 0 |
| math_exp.c | 578 | 578 | 0 | 211808 | 211808 | 0 | 5376 | 5376 | 0 |
| math_exp2.c | 464 | 464 | 0 | 164404 | 164404 | 0 | 5376 | 5376 | 0 |
| math_exp_primary.c | 578 | 578 | 0 | 179718 | 179718 | 0 | 5376 | 5376 | 0 |
| math_exp_scaled.c | 538 | 538 | 0 | 184450 | 184450 | 0 | 5376 | 5376 | 0 |
| math_expm1.c | 900 | 900 | 0 | 153102 | 153102 | 0 | 5632 | 5632 | 0 |
| math_expm1_general.c | 900 | 900 | 0 | 150148 | 150148 | 0 | 5632 | 5632 | 0 |
| math_fdim.c | 428 | 428 | 0 | 68531 | 68531 | 0 | 5120 | 5120 | 0 |
| math_floor.c | 322 | 322 | 0 | 37886 | 37886 | 0 | 5120 | 5120 | 0 |
| math_fmaxmag.c | 453 | 453 | 0 | 106497 | 106497 | 0 | 5376 | 5376 | 0 |
| math_fminmag.c | 455 | 455 | 0 | 107585 | 107585 | 0 | 5376 | 5376 | 0 |
| math_fmod.c | 472 | 472 | 0 | 85299 | 85299 | 0 | 5120 | 5120 | 0 |
| math_fmod_subnormal.c | 521 | 521 | 0 | 69526 | 69526 | 0 | 5632 | 5632 | 0 |
| math_frexp.c | 521 | 521 | 0 | 99204 | 99204 | 0 | 5376 | 5376 | 0 |
| math_hypot.c | 1449 | 1443 | -6 | 149211 | 149211 | 0 | 6144 | 6144 | 0 |
| math_hypot_boundary.c | 1412 | 1406 | -6 | 716107 | 712299 | -3808 | 6144 | 6144 | 0 |
| math_hypot_scaled.c | 1416 | 1410 | -6 | 167257 | 167257 | 0 | 6400 | 6400 | 0 |
| math_ilogb.c | 456 | 456 | 0 | 57072 | 57072 | 0 | 5376 | 5376 | 0 |
| math_ldexp.c | 477 | 477 | 0 | 102049 | 102049 | 0 | 5376 | 5376 | 0 |
| math_llrint.c | 631 | 631 | 0 | 119655 | 119655 | 0 | 5376 | 5376 | 0 |
| math_llround.c | 577 | 577 | 0 | 87243 | 87243 | 0 | 5376 | 5376 | 0 |
| math_log.c | 549 | 549 | 0 | 222853 | 222853 | 0 | 5376 | 5376 | 0 |
| math_log10.c | 549 | 549 | 0 | 222872 | 222872 | 0 | 5376 | 5376 | 0 |
| math_log10_near_one.c | 509 | 509 | 0 | 194567 | 194567 | 0 | 5376 | 5376 | 0 |
| math_log10_scaled.c | 507 | 507 | 0 | 183907 | 183907 | 0 | 5376 | 5376 | 0 |
| math_log1p.c | 567 | 567 | 0 | 159294 | 159294 | 0 | 5376 | 5376 | 0 |
| math_log1p_general.c | 567 | 567 | 0 | 161612 | 161612 | 0 | 5376 | 5376 | 0 |
| math_log2.c | 538 | 538 | 0 | 213214 | 213214 | 0 | 5376 | 5376 | 0 |
| math_log2_near_one.c | 499 | 499 | 0 | 184924 | 184924 | 0 | 5120 | 5120 | 0 |
| math_log2_scaled.c | 497 | 497 | 0 | 174265 | 174265 | 0 | 5120 | 5120 | 0 |
| math_log_near_one.c | 509 | 509 | 0 | 194598 | 194598 | 0 | 5376 | 5376 | 0 |
| math_log_scaled.c | 507 | 507 | 0 | 183890 | 183890 | 0 | 5376 | 5376 | 0 |
| math_logb.c | 466 | 466 | 0 | 80436 | 80436 | 0 | 5376 | 5376 | 0 |
| math_lrint.c | 371 | 371 | 0 | 96172 | 96172 | 0 | 5120 | 5120 | 0 |
| math_lround.c | 312 | 312 | 0 | 62608 | 62608 | 0 | 5120 | 5120 | 0 |
| math_modf.c | 465 | 465 | 0 | 106689 | 106689 | 0 | 5376 | 5376 | 0 |
| math_nan.c | 256 | 256 | 0 | 23380 | 23380 | 0 | 5120 | 5120 | 0 |
| math_nearbyint.c | 327 | 327 | 0 | 80244 | 80244 | 0 | 5120 | 5120 | 0 |
| math_nextafter.c | 424 | 424 | 0 | 131261 | 131261 | 0 | 5120 | 5120 | 0 |
| math_pow.c | 4158 | 4153 | -5 | 499484 | 499484 | 0 | 8960 | 8960 | 0 |
| math_pow_bounded.c | 4125 | 4120 | -5 | 491671 | 491569 | -102 | 9216 | 9216 | 0 |
| math_pow_crossover.c | 4208 | 4203 | -5 | 425914 | 425914 | 0 | 9216 | 9216 | 0 |
| math_pow_extreme.c | 4121 | 4116 | -5 | 501039 | 500971 | -68 | 9216 | 9216 | 0 |
| math_pow_integer.c | 4125 | 4120 | -5 | 469591 | 469370 | -221 | 9216 | 9216 | 0 |
| math_pow_near_one.c | 4206 | 4201 | -5 | 438061 | 438061 | 0 | 9216 | 9216 | 0 |
| math_remainder.c | 461 | 461 | 0 | 172633 | 172633 | 0 | 5376 | 5376 | 0 |
| math_remquo.c | 621 | 621 | 0 | 249405 | 249405 | 0 | 5376 | 5376 | 0 |
| math_rint.c | 327 | 327 | 0 | 80244 | 80244 | 0 | 5120 | 5120 | 0 |
| math_round.c | 322 | 322 | 0 | 36483 | 36483 | 0 | 5120 | 5120 | 0 |
| math_sin.c | 358 | 358 | 0 | 117605 | 117605 | 0 | 5120 | 5120 | 0 |
| math_sin_small.c | 358 | 358 | 0 | 103063 | 103063 | 0 | 5120 | 5120 | 0 |
| math_sincos.c | 727 | 727 | 0 | 179395 | 179395 | 0 | 5632 | 5632 | 0 |
| math_sinh.c | 713 | 712 | -1 | 193472 | 192800 | -672 | 5632 | 5632 | 0 |
| math_sqrt.c | 346 | 346 | 0 | 52936 | 52936 | 0 | 5120 | 5120 | 0 |
| math_sqrt_mantissas.c | 637 | 637 | 0 | 52836 | 52836 | 0 | 5376 | 5376 | 0 |
| math_sqrt_random.c | 506 | 502 | -4 | 422679 | 422679 | 0 | 6144 | 5888 | -256 |
| math_sqrt_special.c | 359 | 359 | 0 | 48789 | 48789 | 0 | 5376 | 5376 | 0 |
| math_tan.c | 362 | 362 | 0 | 139025 | 139025 | 0 | 5120 | 5120 | 0 |
| math_tan_quadrant_direct.c | 652 | 652 | 0 | 116384 | 116384 | 0 | 5376 | 5376 | 0 |
| math_tan_quadrant_even.c | 659 | 659 | 0 | 119684 | 119684 | 0 | 5376 | 5376 | 0 |
| math_tan_quadrant_odd.c | 667 | 667 | 0 | 131619 | 131619 | 0 | 5376 | 5376 | 0 |
| math_tan_reduced.c | 362 | 362 | 0 | 120845 | 120845 | 0 | 5120 | 5120 | 0 |
| math_tan_small.c | 362 | 362 | 0 | 123479 | 123479 | 0 | 5120 | 5120 | 0 |
| math_tanh.c | 652 | 652 | 0 | 207504 | 207504 | 0 | 5376 | 5376 | 0 |
| math_trig_correction.c | 630 | 630 | 0 | 50572 | 50572 | 0 | 5376 | 5376 | 0 |
| math_trig_cos_direct.c | 362 | 362 | 0 | 101741 | 101741 | 0 | 5120 | 5120 | 0 |
| math_trig_cos_edge.c | 362 | 362 | 0 | 113121 | 113121 | 0 | 5120 | 5120 | 0 |
| math_trig_cos_game.c | 362 | 362 | 0 | 107937 | 107937 | 0 | 5120 | 5120 | 0 |
| math_trig_cos_large.c | 362 | 362 | 0 | 135361 | 135361 | 0 | 5120 | 5120 | 0 |
| math_trig_cos_poles.c | 362 | 362 | 0 | 107375 | 107375 | 0 | 5120 | 5120 | 0 |
| math_trig_polynomials.c | 619 | 619 | 0 | 115931 | 115931 | 0 | 5376 | 5376 | 0 |
| math_trig_probe_correct_correction.c | 368 | 368 | 0 | 62554 | 62554 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_cos_boundary.c | 375 | 375 | 0 | 109609 | 109609 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_cos_cancel.c | 375 | 375 | 0 | 112796 | 112796 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_cos_cutoff.c | 375 | 375 | 0 | 120173 | 120173 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_cos_direct.c | 375 | 375 | 0 | 103927 | 103927 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_cos_even.c | 375 | 375 | 0 | 112759 | 112759 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_cos_extended.c | 375 | 375 | 0 | 131323 | 131323 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_cos_first.c | 375 | 375 | 0 | 106252 | 106252 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_cos_larger.c | 375 | 375 | 0 | 113853 | 113853 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_cos_modest.c | 375 | 375 | 0 | 109850 | 109850 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_cos_normal.c | 375 | 375 | 0 | 146790 | 146790 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_cos_odd.c | 375 | 375 | 0 | 107414 | 107414 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_detect_cancel.c | 334 | 334 | 0 | 63646 | 63646 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_detectbaseline_cancel.c | 315 | 313 | -2 | 39799 | 39762 | -37 | 5120 | 5120 | 0 |
| math_trig_probe_identity_boundary.c | 297 | 297 | 0 | 41760 | 41760 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_identity_cancel.c | 297 | 297 | 0 | 41770 | 41770 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_identity_cutoff.c | 297 | 297 | 0 | 41832 | 41832 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_identity_direct.c | 297 | 297 | 0 | 41948 | 41948 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_identity_even.c | 297 | 297 | 0 | 41586 | 41586 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_identity_extended.c | 297 | 297 | 0 | 41760 | 41760 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_identity_first.c | 297 | 297 | 0 | 41586 | 41586 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_identity_larger.c | 297 | 297 | 0 | 41920 | 41920 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_identity_modest.c | 297 | 297 | 0 | 41586 | 41586 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_identity_normal.c | 297 | 297 | 0 | 41760 | 41760 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_identity_odd.c | 297 | 297 | 0 | 41586 | 41586 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_inline_boundary.c | 2686 | 2679 | -7 | 199193 | 199193 | 0 | 13824 | 13824 | 0 |
| math_trig_probe_inline_cancel.c | 2686 | 2679 | -7 | 199657 | 199657 | 0 | 13824 | 13824 | 0 |
| math_trig_probe_inline_cutoff.c | 2686 | 2679 | -7 | 405657 | 405113 | -544 | 13824 | 13824 | 0 |
| math_trig_probe_inline_direct.c | 2686 | 2679 | -7 | 47609 | 47609 | 0 | 13824 | 13824 | 0 |
| math_trig_probe_inline_even.c | 2686 | 2679 | -7 | 199441 | 199441 | 0 | 13824 | 13824 | 0 |
| math_trig_probe_inline_extended.c | 2686 | 2679 | -7 | 1170785 | 1167297 | -3488 | 13824 | 13824 | 0 |
| math_trig_probe_inline_first.c | 2686 | 2679 | -7 | 125161 | 125161 | 0 | 13824 | 13824 | 0 |
| math_trig_probe_inline_larger.c | 2686 | 2679 | -7 | 214025 | 213889 | -136 | 13824 | 13824 | 0 |
| math_trig_probe_inline_modest.c | 2686 | 2679 | -7 | 199353 | 199353 | 0 | 13824 | 13824 | 0 |
| math_trig_probe_inline_normal.c | 2686 | 2679 | -7 | 554049 | 553505 | -544 | 13824 | 13824 | 0 |
| math_trig_probe_inline_odd.c | 2686 | 2679 | -7 | 199625 | 199625 | 0 | 13824 | 13824 | 0 |
| math_trig_probe_loop_boundary.c | 284 | 284 | 0 | 29664 | 29664 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_loop_cancel.c | 284 | 284 | 0 | 29674 | 29674 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_loop_cutoff.c | 284 | 284 | 0 | 29736 | 29736 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_loop_direct.c | 284 | 284 | 0 | 29852 | 29852 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_loop_even.c | 284 | 284 | 0 | 29490 | 29490 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_loop_extended.c | 284 | 284 | 0 | 29664 | 29664 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_loop_first.c | 284 | 284 | 0 | 29490 | 29490 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_loop_larger.c | 284 | 284 | 0 | 29824 | 29824 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_loop_modest.c | 284 | 284 | 0 | 29490 | 29490 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_loop_normal.c | 284 | 284 | 0 | 29664 | 29664 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_loop_odd.c | 284 | 284 | 0 | 29490 | 29490 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_outline_boundary.c | 2662 | 2655 | -7 | 229794 | 229794 | 0 | 13824 | 13824 | 0 |
| math_trig_probe_outline_cancel.c | 2662 | 2655 | -7 | 230258 | 230258 | 0 | 13824 | 13824 | 0 |
| math_trig_probe_outline_cutoff.c | 2662 | 2655 | -7 | 411618 | 411074 | -544 | 13824 | 13824 | 0 |
| math_trig_probe_outline_direct.c | 2662 | 2655 | -7 | 65250 | 65250 | 0 | 13824 | 13824 | 0 |
| math_trig_probe_outline_even.c | 2662 | 2655 | -7 | 230042 | 230042 | 0 | 13824 | 13824 | 0 |
| math_trig_probe_outline_extended.c | 2662 | 2655 | -7 | 1181322 | 1177834 | -3488 | 13824 | 13824 | 0 |
| math_trig_probe_outline_first.c | 2662 | 2655 | -7 | 135090 | 135090 | 0 | 13824 | 13824 | 0 |
| math_trig_probe_outline_larger.c | 2662 | 2655 | -7 | 237322 | 237186 | -136 | 13824 | 13824 | 0 |
| math_trig_probe_outline_modest.c | 2662 | 2655 | -7 | 229954 | 229954 | 0 | 13824 | 13824 | 0 |
| math_trig_probe_outline_normal.c | 2662 | 2655 | -7 | 564586 | 564042 | -544 | 13824 | 13824 | 0 |
| math_trig_probe_outline_odd.c | 2662 | 2655 | -7 | 230226 | 230226 | 0 | 13824 | 13824 | 0 |
| math_trig_probe_quotient_modest.c | 316 | 316 | 0 | 55714 | 55714 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_reconstruct_modest.c | 351 | 351 | 0 | 91745 | 91745 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_refine_cancel.c | 371 | 371 | 0 | 118080 | 118080 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_sin_boundary.c | 371 | 371 | 0 | 104392 | 104392 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_sin_cancel.c | 371 | 371 | 0 | 108248 | 108248 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_sin_cutoff.c | 371 | 371 | 0 | 114448 | 114448 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_sin_direct.c | 371 | 371 | 0 | 98184 | 98184 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_sin_even.c | 371 | 371 | 0 | 104840 | 104840 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_sin_extended.c | 371 | 371 | 0 | 130552 | 130552 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_sin_first.c | 371 | 371 | 0 | 107144 | 107144 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_sin_larger.c | 371 | 371 | 0 | 108656 | 108656 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_sin_modest.c | 371 | 371 | 0 | 106640 | 106640 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_sin_normal.c | 371 | 371 | 0 | 145488 | 145488 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_sin_odd.c | 371 | 371 | 0 | 108888 | 108888 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_sincos_boundary.c | 456 | 456 | 0 | 191000 | 191000 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_sincos_cancel.c | 456 | 456 | 0 | 190234 | 190234 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_sincos_cutoff.c | 456 | 456 | 0 | 200433 | 200433 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_sincos_direct.c | 456 | 456 | 0 | 177711 | 177711 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_sincos_even.c | 456 | 456 | 0 | 190092 | 190092 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_sincos_extended.c | 456 | 456 | 0 | 212053 | 212053 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_sincos_first.c | 456 | 456 | 0 | 188467 | 188467 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_sincos_larger.c | 456 | 456 | 0 | 192637 | 192637 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_sincos_modest.c | 456 | 456 | 0 | 189853 | 189853 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_sincos_normal.c | 456 | 456 | 0 | 227849 | 227849 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_sincos_odd.c | 456 | 456 | 0 | 189887 | 189887 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_tan_boundary.c | 375 | 375 | 0 | 121120 | 121120 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_tan_cancel.c | 375 | 375 | 0 | 125552 | 125552 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_tan_cutoff.c | 375 | 375 | 0 | 132416 | 132416 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_tan_direct.c | 375 | 375 | 0 | 112288 | 112288 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_tan_even.c | 375 | 375 | 0 | 121544 | 121544 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_tan_extended.c | 375 | 375 | 0 | 154272 | 154272 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_tan_first.c | 375 | 375 | 0 | 132888 | 132888 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_tan_larger.c | 375 | 375 | 0 | 126368 | 126368 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_tan_modest.c | 375 | 375 | 0 | 127504 | 127504 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_tan_normal.c | 375 | 375 | 0 | 169152 | 169152 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_tan_odd.c | 375 | 375 | 0 | 134656 | 134656 | 0 | 5120 | 5120 | 0 |
| math_trig_probe_window_extended.c | 2061 | 2055 | -6 | 1115178 | 1111690 | -3488 | 8192 | 8192 | 0 |
| math_trig_probe_window_normal.c | 2061 | 2055 | -6 | 498442 | 497898 | -544 | 8192 | 8192 | 0 |
| math_trig_quotient_bias.c | 281 | 281 | 0 | 34949 | 34949 | 0 | 5120 | 5120 | 0 |
| math_trig_quotient_u16.c | 268 | 268 | 0 | 27417 | 27417 | 0 | 5120 | 5120 | 0 |
| math_trig_quotient_u32.c | 278 | 278 | 0 | 31085 | 31085 | 0 | 5120 | 5120 | 0 |
| math_trig_reconstruction.c | 385 | 385 | 0 | 77656 | 77656 | 0 | 5376 | 5376 | 0 |
| math_trig_reduce_direct.c | 2659 | 2652 | -7 | 63622 | 63622 | 0 | 13824 | 13824 | 0 |
| math_trig_reduce_edge.c | 2659 | 2652 | -7 | 403216 | 402723 | -493 | 13824 | 13824 | 0 |
| math_trig_reduce_game.c | 2659 | 2652 | -7 | 195942 | 195874 | -68 | 13824 | 13824 | 0 |
| math_trig_reduce_large.c | 2659 | 2652 | -7 | 487182 | 486638 | -544 | 13824 | 13824 | 0 |
| math_trig_reduce_poles.c | 2659 | 2652 | -7 | 168759 | 168759 | 0 | 13824 | 13824 | 0 |
| math_trig_sin_direct.c | 358 | 358 | 0 | 95713 | 95713 | 0 | 5120 | 5120 | 0 |
| math_trig_sin_edge.c | 358 | 358 | 0 | 111567 | 111567 | 0 | 5120 | 5120 | 0 |
| math_trig_sin_game.c | 358 | 358 | 0 | 105139 | 105139 | 0 | 5120 | 5120 | 0 |
| math_trig_sin_large.c | 358 | 358 | 0 | 133382 | 133382 | 0 | 5120 | 5120 | 0 |
| math_trig_sin_poles.c | 358 | 358 | 0 | 105614 | 105614 | 0 | 5120 | 5120 | 0 |
| math_trig_sincos_direct.c | 444 | 444 | 0 | 176298 | 176298 | 0 | 5120 | 5120 | 0 |
| math_trig_sincos_edge.c | 444 | 444 | 0 | 193703 | 193703 | 0 | 5120 | 5120 | 0 |
| math_trig_sincos_game.c | 444 | 444 | 0 | 188071 | 188071 | 0 | 5120 | 5120 | 0 |
| math_trig_sincos_large.c | 444 | 444 | 0 | 215535 | 215535 | 0 | 5120 | 5120 | 0 |
| math_trig_sincos_poles.c | 444 | 444 | 0 | 187074 | 187074 | 0 | 5120 | 5120 | 0 |
| math_trig_tan_direct.c | 362 | 362 | 0 | 109829 | 109829 | 0 | 5120 | 5120 | 0 |
| math_trig_tan_edge.c | 362 | 362 | 0 | 132980 | 132980 | 0 | 5120 | 5120 | 0 |
| math_trig_tan_game.c | 362 | 362 | 0 | 125075 | 125075 | 0 | 5120 | 5120 | 0 |
| math_trig_tan_large.c | 362 | 362 | 0 | 155114 | 155114 | 0 | 5120 | 5120 | 0 |
| math_trig_tan_poles.c | 362 | 362 | 0 | 128120 | 128120 | 0 | 5120 | 5120 | 0 |
| math_trunc.c | 322 | 322 | 0 | 36567 | 36567 | 0 | 5120 | 5120 | 0 |
| memory_services.c | 277 | 277 | 0 | 18300 | 18300 | 0 | 5120 | 5120 | 0 |
| mixed_width.c | 441 | 440 | -1 | 1063957 | 1063957 | 0 | 5376 | 5376 | 0 |
| multiply.c | 404 | 404 | 0 | 765445 | 765445 | 0 | 5376 | 5376 | 0 |
| narrow_arithmetic.c | 665 | 665 | 0 | 1192042 | 1192042 | 0 | 5376 | 5376 | 0 |
| normalized_loads.c | 364 | 364 | 0 | 1286219 | 1286219 | 0 | 5120 | 5120 | 0 |
| packed_fields.c | 332 | 332 | 0 | 802669 | 802669 | 0 | 5376 | 5376 | 0 |
| pointer_table.c | 417 | 417 | 0 | 286671 | 286671 | 0 | 5376 | 5376 | 0 |
| pointer_walk.c | 283 | 283 | 0 | 929811 | 929811 | 0 | 5376 | 5376 | 0 |
| poly12_guest.c | 684 | 684 | 0 | 215688 | 215688 | 0 | 5376 | 5376 | 0 |
| poly12_native.c | 603 | 603 | 0 | 143338 | 143338 | 0 | 5376 | 5376 | 0 |
| poly1_guest.c | 577 | 577 | 0 | 38955 | 38955 | 0 | 5376 | 5376 | 0 |
| poly1_native.c | 559 | 559 | 0 | 37519 | 37519 | 0 | 5376 | 5376 | 0 |
| poly2_guest.c | 577 | 577 | 0 | 58277 | 58277 | 0 | 5376 | 5376 | 0 |
| poly2_native.c | 563 | 563 | 0 | 47500 | 47500 | 0 | 5376 | 5376 | 0 |
| poly4_guest.c | 597 | 597 | 0 | 88444 | 88444 | 0 | 5376 | 5376 | 0 |
| poly4_native.c | 571 | 571 | 0 | 66773 | 66773 | 0 | 5376 | 5376 | 0 |
| poly8_guest.c | 641 | 641 | 0 | 153277 | 153277 | 0 | 5376 | 5376 | 0 |
| poly8_native.c | 587 | 587 | 0 | 105146 | 105146 | 0 | 5376 | 5376 | 0 |
| popcount.c | 1113 | 1113 | 0 | 297331 | 297331 | 0 | 5888 | 5888 | 0 |
| progmem_record_index.c | 557 | 557 | 0 | 1935672 | 1935672 | 0 | 6912 | 6912 | 0 |
| progmem_walk.c | 324 | 324 | 0 | 2358308 | 2358308 | 0 | 5120 | 5120 | 0 |
| progmem_widen_ldp16.c | 339 | 339 | 0 | 531946 | 531946 | 0 | 5120 | 5120 | 0 |
| progmem_widen_ldp32_bytes.c | 411 | 411 | 0 | 721763 | 721763 | 0 | 5376 | 5376 | 0 |
| progmem_widen_ldp32_words.c | 344 | 344 | 0 | 531972 | 531972 | 0 | 5120 | 5120 | 0 |
| record_scan.c | 410 | 410 | 0 | 1443008 | 1443008 | 0 | 5376 | 5376 | 0 |
| record_stride.c | 425 | 425 | 0 | 142993 | 142993 | 0 | 5120 | 5120 | 0 |
| record_stride_nested.c | 466 | 466 | 0 | 392231 | 392231 | 0 | 5120 | 5120 | 0 |
| register_cleanup.c | 514 | 514 | 0 | 2277115 | 2277115 | 0 | 5376 | 5376 | 0 |
| reverse_walk.c | 285 | 285 | 0 | 1919930 | 1919930 | 0 | 5376 | 5376 | 0 |
| rotate32.c | 583 | 578 | -5 | 1010076 | 1003573 | -6503 | 5376 | 5376 | 0 |
| saturating_math.c | 796 | 796 | 0 | 1326952 | 1326952 | 0 | 5632 | 5632 | 0 |
| select.c | 981 | 981 | 0 | 717297 | 717297 | 0 | 5632 | 5632 | 0 |
| shifts.c | 905 | 905 | 0 | 396293 | 396293 | 0 | 5632 | 5632 | 0 |
| short_circuit.c | 759 | 759 | 0 | 1669825 | 1669825 | 0 | 5376 | 5376 | 0 |
| sieve.c | 285 | 285 | 0 | 377189 | 377189 | 0 | 5888 | 5888 | 0 |
| small_memops.c | 503 | 503 | 0 | 323653 | 323653 | 0 | 5376 | 5376 | 0 |
| stack_array.c | 864 | 864 | 0 | 156996 | 156996 | 0 | 5632 | 5632 | 0 |
| stack_base_nested.c | 387 | 387 | 0 | 255931 | 255931 | 0 | 5120 | 5120 | 0 |
| stack_frames.c | 697 | 697 | 0 | 2425335 | 2425335 | 0 | 5376 | 5376 | 0 |
| state_machine.c | 414 | 414 | 0 | 7135388 | 7135388 | 0 | 5120 | 5120 | 0 |
| stdlib_abs.c | 365 | 365 | 0 | 155156 | 155156 | 0 | 5120 | 5120 | 0 |
| stdlib_atoi.c | 550 | 550 | 0 | 801662 | 801662 | 0 | 5376 | 5376 | 0 |
| stdlib_atol.c | 865 | 861 | -4 | 7391636 | 7358036 | -33600 | 5632 | 5632 | 0 |
| stdlib_atoll.c | 1313 | 1308 | -5 | 55433736 | 54694216 | -739520 | 6144 | 6144 | 0 |
| stdlib_div.c | 301 | 301 | 0 | 164889 | 164889 | 0 | 5120 | 5120 | 0 |
| stdlib_labs.c | 389 | 389 | 0 | 186669 | 186669 | 0 | 5120 | 5120 | 0 |
| stdlib_ldiv.c | 637 | 637 | 0 | 5688273 | 5688273 | 0 | 5376 | 5376 | 0 |
| stdlib_llabs.c | 402 | 402 | 0 | 762376 | 762376 | 0 | 5120 | 5120 | 0 |
| stdlib_lldiv.c | 1305 | 1299 | -6 | 41787388 | 41149308 | -638080 | 6144 | 6144 | 0 |
| stdlib_strtod.c | 2332 | 2325 | -7 | 4369665 | 4329857 | -39808 | 7168 | 7168 | 0 |
| stdlib_strtof.c | 2329 | 2322 | -7 | 4351873 | 4312065 | -39808 | 7168 | 7168 | 0 |
| stdlib_strtol.c | 1070 | 1066 | -4 | 8286228 | 8245428 | -40800 | 5888 | 5888 | 0 |
| stdlib_strtoll.c | 1825 | 1813 | -12 | 67340300 | 66167980 | -1172320 | 6656 | 6656 | 0 |
| stdlib_strtoul.c | 1073 | 1069 | -4 | 8287572 | 8246772 | -40800 | 5888 | 5888 | 0 |
| stdlib_strtoull.c | 1809 | 1797 | -12 | 68984140 | 67701340 | -1282800 | 6656 | 6656 | 0 |
| string_memchr.c | 629 | 629 | 0 | 2423952 | 2423952 | 0 | 5376 | 5376 | 0 |
| string_memchr_p.c | 468 | 465 | -3 | 4710808 | 4703512 | -7296 | 5376 | 5376 | 0 |
| string_scan.c | 747 | 747 | 0 | 25934602 | 25934602 | 0 | 5632 | 5632 | 0 |
| string_strchr.c | 564 | 562 | -2 | 1205808 | 1204624 | -1184 | 5376 | 5376 | 0 |
| string_strchr_p.c | 444 | 441 | -3 | 2405816 | 2398520 | -7296 | 5376 | 5376 | 0 |
| string_strcspn.c | 487 | 487 | 0 | 3291184 | 3291184 | 0 | 5120 | 5120 | 0 |
| string_strcspn_p.c | 572 | 572 | 0 | 5920473 | 5920473 | 0 | 5376 | 5376 | 0 |
| string_strncmp.c | 507 | 507 | 0 | 1461040 | 1461040 | 0 | 5376 | 5376 | 0 |
| string_strncmp_p.c | 695 | 695 | 0 | 2284307 | 2284307 | 0 | 5632 | 5632 | 0 |
| string_strnlen.c | 451 | 451 | 0 | 989904 | 989904 | 0 | 5120 | 5120 | 0 |
| string_strnlen_p.c | 552 | 552 | 0 | 1913610 | 1913610 | 0 | 5376 | 5376 | 0 |
| string_strpbrk.c | 601 | 601 | 0 | 3335280 | 3335280 | 0 | 5376 | 5376 | 0 |
| string_strpbrk_p.c | 695 | 695 | 0 | 5989721 | 5989721 | 0 | 5376 | 5376 | 0 |
| string_strrchr.c | 570 | 568 | -2 | 1771792 | 1770608 | -1184 | 5376 | 5376 | 0 |
| string_strrchr_p.c | 449 | 446 | -3 | 3525816 | 3518520 | -7296 | 5376 | 5376 | 0 |
| string_strspn.c | 489 | 489 | 0 | 4266288 | 4266288 | 0 | 5120 | 5120 | 0 |
| string_strspn_p.c | 580 | 580 | 0 | 8066905 | 8066905 | 0 | 5376 | 5376 | 0 |
| string_strstr.c | 621 | 621 | 0 | 1837488 | 1837488 | 0 | 5376 | 5376 | 0 |
| string_strstr_p.c | 696 | 696 | 0 | 2199193 | 2199193 | 0 | 5376 | 5376 | 0 |
| string_strtok.c | 535 | 535 | 0 | 2491491 | 2491491 | 0 | 5376 | 5376 | 0 |
| string_strtok_p.c | 649 | 649 | 0 | 4536578 | 4536578 | 0 | 5376 | 5376 | 0 |
| string_strtok_r.c | 576 | 576 | 0 | 2620028 | 2620028 | 0 | 5376 | 5376 | 0 |
| string_strtok_r_p.c | 715 | 715 | 0 | 4399874 | 4399874 | 0 | 5376 | 5376 | 0 |
| struct_copy.c | 319 | 319 | 0 | 443789 | 443789 | 0 | 5376 | 5376 | 0 |
| switch.c | 379 | 379 | 0 | 950957 | 950957 | 0 | 5120 | 5120 | 0 |
| sys_memcmp.c | 353 | 353 | 0 | 2868 | 2868 | 0 | 5376 | 5376 | 0 |
| sys_memcmp_p.c | 330 | 330 | 0 | 5133 | 5133 | 0 | 5376 | 5376 | 0 |
| sys_strcmp.c | 397 | 397 | 0 | 2489 | 2489 | 0 | 5376 | 5376 | 0 |
| sys_strcmp_p.c | 315 | 315 | 0 | 5402 | 5402 | 0 | 5376 | 5376 | 0 |
| sys_strlen.c | 368 | 368 | 0 | 2101 | 2101 | 0 | 5376 | 5376 | 0 |
| sys_strlen_p.c | 266 | 266 | 0 | 7020 | 7020 | 0 | 5376 | 5376 | 0 |
| sys_strncat.c | 309 | 309 | 0 | 2202 | 2202 | 0 | 5120 | 5120 | 0 |
| sys_strncat_p.c | 326 | 326 | 0 | 3500 | 3500 | 0 | 5120 | 5120 | 0 |
| sys_strncpy.c | 365 | 365 | 0 | 2112 | 2112 | 0 | 5120 | 5120 | 0 |
| sys_strncpy_p.c | 323 | 323 | 0 | 3536 | 3536 | 0 | 5120 | 5120 | 0 |
| tail_calls.c | 269 | 269 | 0 | 487471 | 487471 | 0 | 5120 | 5120 | 0 |
| text.c | 272 | 272 | 0 | 52140 | 52140 | 0 | 5888 | 5888 | 0 |
| tile_cache_render.c | 459 | 459 | 0 | 3133968 | 3133968 | 0 | 5376 | 5376 | 0 |
| tilesrect.c | 740 | 740 | 0 | 42482 | 42482 | 0 | 5120 | 5120 | 0 |
| tilessprite.c | 757 | 757 | 0 | 90924 | 90924 | 0 | 5632 | 5632 | 0 |
| tilessprite16.c | 365 | 365 | 0 | 37944 | 37944 | 0 | 5120 | 5120 | 0 |
| tilessprite16_cached.c | 361 | 361 | 0 | 34756 | 34756 | 0 | 5120 | 5120 | 0 |
| tilessprite_cached.c | 753 | 753 | 0 | 77464 | 77464 | 0 | 5632 | 5632 | 0 |
| volatile_rmw.c | 522 | 522 | 0 | 500729 | 500729 | 0 | 5376 | 5376 | 0 |
| wide_add_sub.c | 573 | 573 | 0 | 511620 | 511620 | 0 | 5376 | 5376 | 0 |
| wide_compare.c | 782 | 782 | 0 | 1104068 | 1104068 | 0 | 5632 | 5632 | 0 |
| wide_divmod.c | 1960 | 1945 | -15 | 2451935 | 2403586 | -48349 | 6656 | 6656 | 0 |
| wide_mul.c | 829 | 828 | -1 | 481802 | 479082 | -2720 | 5632 | 5632 | 0 |
| wide_shifts.c | 1047 | 1045 | -2 | 218903 | 218607 | -296 | 5888 | 5888 | 0 |
| aggregate_byte_dispatch.cpp | 702 | 702 | 0 | 1238476 | 1238476 | 0 | 5376 | 5376 | 0 |
| aggregate_byte_packing.cpp | 611 | 611 | 0 | 1596220 | 1596220 | 0 | 5376 | 5376 | 0 |
| aggregate_byte_packing_hoisted.cpp | 411 | 411 | 0 | 2292893 | 2292893 | 0 | 5120 | 5120 | 0 |
| lambda_capture.cpp | 519 | 519 | 0 | 1083864 | 1083864 | 0 | 5376 | 5376 | 0 |
| member_pointers.cpp | 334 | 334 | 0 | 386951 | 386951 | 0 | 5120 | 5120 | 0 |
| scoped_lifetime.cpp | 306 | 306 | 0 | 641050 | 641050 | 0 | 5120 | 5120 | 0 |
| template_specialization.cpp | 560 | 560 | 0 | 1860613 | 1860613 | 0 | 5376 | 5376 | 0 |
| virtual_dispatch.cpp | 327 | 327 | 0 | 698467 | 698467 | 0 | 5120 | 5120 | 0 |

## Every instruction measurement

The instruction fixture ELF SHA-256 is identical before and after: `600d8d1dd40c48396d783ce70881963e77e741846a146650b871fb4b78c4dda2`. Its complete `.text` size is 32266 bytes in both phases, so every individual assembly fixture has unchanged code size.

| Instruction | Cycles before | Cycles after | Delta |
|---|---:|---:|---:|
| SYS debug_break (baseline) | 35 | 35 | 0 |
| SYS debug_putc | 35 | 35 | 0 |
| SYS millis | 38 | 38 | 0 |
| SYS millis32 | 42 | 42 | 0 |
| NOP (MOV r4,r4 alias) | 17 | 17 | 0 |
| CLR r4 (XOR r4,r4 alias) | 17 | 17 | 0 |
| MOV r4,r5 (upper one-byte) | 17 | 17 | 0 |
| MOV r0,r1 (full F1) | 37 | 37 | 0 |
| MOV32 q0,q1 (full F2) | 38 | 38 | 0 |
| LDI8 r4,imm8 (upper) | 35 | 35 | 0 |
| LDI8 r0,imm8 (cold lower) | 53 | 53 | 0 |
| LDI16 r4,imm16 (upper) | 52 | 52 | 0 |
| LDI16 r0,imm16 (cold lower) | 71 | 71 | 0 |
| ZEXT8 r0 | 37 | 37 | 0 |
| SEXT8 r0 | 38 | 38 | 0 |
| SWAP8 r0 | 37 | 37 | 0 |
| BSWAP16 r0 | 38 | 38 | 0 |
| BOOL r0 (zero) | 38 | 38 | 0 |
| BOOL r0 (nonzero) | 38 | 38 | 0 |
| PUSH16 r0 | 19 | 19 | 0 |
| POP16 r0 | 18 | 18 | 0 |
| ADJSP simm8 | 35 | 35 | 0 |
| GETSP r0 | 37 | 37 | 0 |
| SETSP r0 | 40 | 40 | 0 |
| LEASP r0,32 (cold) | 60 | 60 | 0 |
| ADD r4,r5 (upper one-byte) | 17 | 17 | 0 |
| ADD r0,r1 (full F2) | 38 | 38 | 0 |
| SUB r4,r5 (upper one-byte) | 17 | 17 | 0 |
| SUB r0,r1 (full F2) | 38 | 38 | 0 |
| ADDI.S8 r4,simm8 (upper) | 35 | 35 | 0 |
| ADDI.S8 r0,simm8 (cold lower) | 54 | 54 | 0 |
| INC16 r0 | 38 | 38 | 0 |
| DEC16 r0 | 38 | 38 | 0 |
| NEG16 r0 | 38 | 38 | 0 |
| ADD32 q0,q1 | 38 | 38 | 0 |
| SUB32 q0,q1 | 38 | 38 | 0 |
| LSL32.1 q0 (ADD32 q0,q0 alias) | 38 | 38 | 0 |
| AND r4,r5 (upper one-byte) | 17 | 17 | 0 |
| AND r0,r1 (full F9) | 51 | 51 | 0 |
| OR r4,r5 (upper one-byte) | 17 | 17 | 0 |
| OR r0,r1 (full F9) | 52 | 52 | 0 |
| XOR r4,r5 (upper one-byte) | 17 | 17 | 0 |
| XOR r0,r1 (full F9) | 53 | 53 | 0 |
| NOT16 r0 | 38 | 38 | 0 |
| LSL16.1 r0 | 38 | 38 | 0 |
| LSR16.1 r0 | 38 | 38 | 0 |
| ASR16.1 r0 | 38 | 38 | 0 |
| LSR32.1 q0 | 38 | 38 | 0 |
| ASR32.1 q0 | 38 | 38 | 0 |
| SHL16V r4,r5 (count 0) | 42 | 42 | 0 |
| SHL16V r4,r5 (count 1) | 45 | 45 | 0 |
| SHL16V r4,r5 (count 2) | 50 | 50 | 0 |
| SHL16V r4,r5 (count 3) | 55 | 55 | 0 |
| SHL16V r4,r5 (count 4) | 60 | 60 | 0 |
| SHL16V r4,r5 (count 5) | 65 | 65 | 0 |
| SHL16V r4,r5 (count 6) | 70 | 70 | 0 |
| SHL16V r4,r5 (count 7) | 75 | 75 | 0 |
| SHL16V r4,r5 (count 8) | 44 | 44 | 0 |
| SHL16V r4,r5 (count 9) | 47 | 47 | 0 |
| SHL16V r4,r5 (count 10) | 52 | 52 | 0 |
| SHL16V r4,r5 (count 11) | 57 | 57 | 0 |
| SHL16V r4,r5 (count 12) | 62 | 62 | 0 |
| SHL16V r4,r5 (count 13) | 67 | 67 | 0 |
| SHL16V r4,r5 (count 14) | 72 | 72 | 0 |
| SHL16V r4,r5 (count 15) | 77 | 77 | 0 |
| LSR16V r4,r5 (count 0) | 42 | 42 | 0 |
| LSR16V r4,r5 (count 1) | 45 | 45 | 0 |
| LSR16V r4,r5 (count 2) | 50 | 50 | 0 |
| LSR16V r4,r5 (count 3) | 55 | 55 | 0 |
| LSR16V r4,r5 (count 4) | 60 | 60 | 0 |
| LSR16V r4,r5 (count 5) | 65 | 65 | 0 |
| LSR16V r4,r5 (count 6) | 70 | 70 | 0 |
| LSR16V r4,r5 (count 7) | 75 | 75 | 0 |
| LSR16V r4,r5 (count 8) | 44 | 44 | 0 |
| LSR16V r4,r5 (count 9) | 47 | 47 | 0 |
| LSR16V r4,r5 (count 10) | 52 | 52 | 0 |
| LSR16V r4,r5 (count 11) | 57 | 57 | 0 |
| LSR16V r4,r5 (count 12) | 62 | 62 | 0 |
| LSR16V r4,r5 (count 13) | 67 | 67 | 0 |
| LSR16V r4,r5 (count 14) | 72 | 72 | 0 |
| LSR16V r4,r5 (count 15) | 77 | 77 | 0 |
| ASR16V r4,r5 (count 0) | 42 | 42 | 0 |
| ASR16V r4,r5 (count 1) | 45 | 45 | 0 |
| ASR16V r4,r5 (count 2) | 50 | 50 | 0 |
| ASR16V r4,r5 (count 3) | 55 | 55 | 0 |
| ASR16V r4,r5 (count 4) | 60 | 60 | 0 |
| ASR16V r4,r5 (count 5) | 65 | 65 | 0 |
| ASR16V r4,r5 (count 6) | 70 | 70 | 0 |
| ASR16V r4,r5 (count 7) | 75 | 75 | 0 |
| ASR16V r4,r5 (count 8) | 45 | 45 | 0 |
| ASR16V r4,r5 (count 9) | 48 | 48 | 0 |
| ASR16V r4,r5 (count 10) | 53 | 53 | 0 |
| ASR16V r4,r5 (count 11) | 58 | 58 | 0 |
| ASR16V r4,r5 (count 12) | 63 | 63 | 0 |
| ASR16V r4,r5 (count 13) | 68 | 68 | 0 |
| ASR16V r4,r5 (count 14) | 73 | 73 | 0 |
| ASR16V r4,r5 (count 15) | 78 | 78 | 0 |
| LSL16I r4,0 | 44 | 44 | 0 |
| LSL16I r4,1 | 47 | 47 | 0 |
| LSL16I r4,2 | 52 | 52 | 0 |
| LSL16I r4,3 | 57 | 57 | 0 |
| LSL16I r4,4 | 62 | 62 | 0 |
| LSL16I r4,5 | 67 | 67 | 0 |
| LSL16I r4,6 | 72 | 72 | 0 |
| LSL16I r4,7 | 77 | 77 | 0 |
| LSL16I r4,8 | 46 | 46 | 0 |
| LSL16I r4,9 | 49 | 49 | 0 |
| LSL16I r4,10 | 54 | 54 | 0 |
| LSL16I r4,11 | 59 | 59 | 0 |
| LSL16I r4,12 | 64 | 64 | 0 |
| LSL16I r4,13 | 69 | 69 | 0 |
| LSL16I r4,14 | 74 | 74 | 0 |
| LSL16I r4,15 | 79 | 79 | 0 |
| LSR16I r4,0 | 44 | 44 | 0 |
| LSR16I r4,1 | 47 | 47 | 0 |
| LSR16I r4,2 | 52 | 52 | 0 |
| LSR16I r4,3 | 57 | 57 | 0 |
| LSR16I r4,4 | 62 | 62 | 0 |
| LSR16I r4,5 | 67 | 67 | 0 |
| LSR16I r4,6 | 72 | 72 | 0 |
| LSR16I r4,7 | 77 | 77 | 0 |
| LSR16I r4,8 | 46 | 46 | 0 |
| LSR16I r4,9 | 49 | 49 | 0 |
| LSR16I r4,10 | 54 | 54 | 0 |
| LSR16I r4,11 | 59 | 59 | 0 |
| LSR16I r4,12 | 64 | 64 | 0 |
| LSR16I r4,13 | 69 | 69 | 0 |
| LSR16I r4,14 | 74 | 74 | 0 |
| LSR16I r4,15 | 79 | 79 | 0 |
| ASR16I r4,0 | 44 | 44 | 0 |
| ASR16I r4,1 | 47 | 47 | 0 |
| ASR16I r4,2 | 52 | 52 | 0 |
| ASR16I r4,3 | 57 | 57 | 0 |
| ASR16I r4,4 | 62 | 62 | 0 |
| ASR16I r4,5 | 67 | 67 | 0 |
| ASR16I r4,6 | 72 | 72 | 0 |
| ASR16I r4,7 | 77 | 77 | 0 |
| ASR16I r4,8 | 47 | 47 | 0 |
| ASR16I r4,9 | 50 | 50 | 0 |
| ASR16I r4,10 | 55 | 55 | 0 |
| ASR16I r4,11 | 60 | 60 | 0 |
| ASR16I r4,12 | 65 | 65 | 0 |
| ASR16I r4,13 | 70 | 70 | 0 |
| ASR16I r4,14 | 75 | 75 | 0 |
| ASR16I r4,15 | 80 | 80 | 0 |
| MUL8 r4,r5 | 38 | 38 | 0 |
| MULU8.W r4,r5 | 38 | 38 | 0 |
| MULS8.W r4,r5 | 38 | 38 | 0 |
| MULSU8.W r4,r5 | 38 | 38 | 0 |
| MUL16 r0,r1 | 46 | 46 | 0 |
| UDIV16 r0,r1 (0xa5a5 / 0x0000; zero-divisor fast path) | 59 | 59 | 0 |
| UDIV16 r2,r3 (0x0007 / 0x00ff; 8-bit core, quotient popcount 0) | 122 | 122 | 0 |
| UDIV16 r1,r6 (0x0080 / 0x0001; 8-bit core, quotient popcount 1) | 123 | 123 | 0 |
| UDIV16 r4,r5 (0x00ff / 0x0001; 8-bit core, quotient popcount 8) | 130 | 130 | 0 |
| UDIV16 r6,r7 (0x1234 / 0x8000; 16-bit core, quotient popcount 0) | 219 | 219 | 0 |
| UDIV16 r3,r4 (0x8000 / 0x0001; 16-bit core, quotient popcount 1) | 221 | 221 | 0 |
| UDIV16 r7,r0 (0xffff / 0x0001; 16-bit core, quotient popcount 16) | 251 | 251 | 0 |
| UDIV16 r5,r5 (0x00a5 / 0x00a5; 8-bit core, rD == rS) | 123 | 123 | 0 |
| UREM16 r0,r1 (0xa5a5 / 0x0000; zero-divisor fast path) | 58 | 58 | 0 |
| UREM16 r2,r3 (0x0007 / 0x00ff; 8-bit core, quotient popcount 0) | 122 | 122 | 0 |
| UREM16 r1,r6 (0x0080 / 0x0001; 8-bit core, quotient popcount 1) | 123 | 123 | 0 |
| UREM16 r4,r5 (0x00ff / 0x0001; 8-bit core, quotient popcount 8) | 130 | 130 | 0 |
| UREM16 r6,r7 (0x1234 / 0x8000; 16-bit core, quotient popcount 0) | 219 | 219 | 0 |
| UREM16 r3,r4 (0x8000 / 0x0001; 16-bit core, quotient popcount 1) | 221 | 221 | 0 |
| UREM16 r7,r0 (0xffff / 0x0001; 16-bit core, quotient popcount 16) | 251 | 251 | 0 |
| UREM16 r5,r5 (0x00a5 / 0x00a5; 8-bit core, rD == rS) | 123 | 123 | 0 |
| SDIV16 r0,r1 (0xcfc7 / 0x0000; zero-divisor fast path, negative dividend) | 59 | 59 | 0 |
| SDIV16 r2,r3 (0x0007 / 0x007f; 8-bit core, positive operands, quotient popcount 0) | 132 | 132 | 0 |
| SDIV16 r1,r6 (0xff80 / 0x0001; 8-bit core, one negative input, quotient popcount 1) | 139 | 139 | 0 |
| SDIV16 r4,r5 (0xff01 / 0x0001; 8-bit core, one negative input, quotient popcount 8) | 146 | 146 | 0 |
| SDIV16 r6,r7 (0x1234 / 0x7fff; 16-bit core, positive operands, quotient popcount 0) | 229 | 229 | 0 |
| SDIV16 r3,r4 (0x8000 / 0x0100; 16-bit core, one negative input, quotient popcount 1) | 237 | 237 | 0 |
| SDIV16 r7,r0 (0x8001 / 0x0001; 16-bit core, one negative input, quotient popcount 15) | 265 | 265 | 0 |
| SDIV16 r5,r2 (0x8000 / 0xffff; 16-bit core, INT16_MIN / -1) | 235 | 235 | 0 |
| SDIV16 r4,r4 (0xffff / 0xffff; 8-bit core, two negative inputs, rD == rS) | 137 | 137 | 0 |
| SREM16 r0,r1 (0xcfc7 / 0x0000; zero-divisor fast path, negative dividend) | 58 | 58 | 0 |
| SREM16 r2,r3 (0x0007 / 0x007f; 8-bit core, positive operands, quotient popcount 0) | 132 | 132 | 0 |
| SREM16 r1,r6 (0xff80 / 0x0001; 8-bit core, one negative input, quotient popcount 1) | 139 | 139 | 0 |
| SREM16 r4,r5 (0xff01 / 0xffff; 8-bit core, two negative inputs, quotient popcount 8) | 148 | 148 | 0 |
| SREM16 r6,r7 (0x1234 / 0x7fff; 16-bit core, positive operands, quotient popcount 0) | 229 | 229 | 0 |
| SREM16 r3,r4 (0x8000 / 0x0100; 16-bit core, one negative input, quotient popcount 1) | 237 | 237 | 0 |
| SREM16 r7,r0 (0x8001 / 0xffff; 16-bit core, two negative inputs, quotient popcount 15) | 267 | 267 | 0 |
| SREM16 r5,r2 (0x8000 / 0xffff; 16-bit core, INT16_MIN / -1) | 239 | 239 | 0 |
| SREM16 r4,r4 (0xffff / 0xffff; 8-bit core, two negative inputs, rD == rS) | 141 | 141 | 0 |
| FADD (normal same-sign) | 156 | 156 | 0 |
| FADD (exact cancellation) | 127 | 127 | 0 |
| FADD (large exponent gap) | 138 | 138 | 0 |
| FADD (subnormal result) | 142 | 142 | 0 |
| FADD (overflow to +infinity) | 141 | 141 | 0 |
| FADD (infinity plus finite) | 153 | 153 | 0 |
| FADD (invalid +infinity plus -infinity) | 162 | 162 | 0 |
| FADD (quiet NaN operand) | 134 | 134 | 0 |
| FADD (equal operands) | 140 | 140 | 0 |
| FSUB (normal) | 156 | 156 | 0 |
| FSUB (exact cancellation) | 128 | 128 | 0 |
| FSUB (large exponent gap) | 139 | 139 | 0 |
| FSUB (subnormal result) | 146 | 146 | 0 |
| FSUB (overflow to +infinity) | 142 | 142 | 0 |
| FSUB (-infinity minus finite) | 154 | 154 | 0 |
| FSUB (invalid infinity minus infinity) | 163 | 163 | 0 |
| FSUB (quiet NaN operand) | 135 | 135 | 0 |
| FSUB (equal operands) | 128 | 128 | 0 |
| FMUL (normal) | 192 | 192 | 0 |
| FMUL (negative result) | 192 | 192 | 0 |
| FMUL (signed zero) | 124 | 124 | 0 |
| FMUL (subnormal result) | 174 | 174 | 0 |
| FMUL (underflow halfway to zero) | 183 | 183 | 0 |
| FMUL (overflow to +infinity) | 191 | 191 | 0 |
| FMUL (infinity times finite) | 149 | 149 | 0 |
| FMUL (invalid infinity times zero) | 152 | 152 | 0 |
| FMUL (quiet NaN operand) | 131 | 131 | 0 |
| FMUL (equal operands) | 192 | 192 | 0 |
| FADD (normal sample 0) | 156 | 156 | 0 |
| FADD (normal sample 1) | 156 | 156 | 0 |
| FADD (normal sample 2) | 156 | 156 | 0 |
| FADD (normal sample 3) | 156 | 156 | 0 |
| FSUB (normal sample 0) | 156 | 156 | 0 |
| FSUB (normal sample 1) | 156 | 156 | 0 |
| FSUB (normal sample 2) | 156 | 156 | 0 |
| FSUB (normal sample 3) | 156 | 156 | 0 |
| FMUL (normal sample 0) | 192 | 192 | 0 |
| FMUL (normal sample 1) | 192 | 192 | 0 |
| FMUL (normal sample 2) | 192 | 192 | 0 |
| FMUL (normal sample 3) | 192 | 192 | 0 |
| FDIV (exact normal) | 502 | 502 | 0 |
| FDIV (recurring normal) | 529 | 529 | 0 |
| FDIV (negative result) | 502 | 502 | 0 |
| FDIV (signed zero numerator) | 124 | 124 | 0 |
| FDIV (zero divisor) | 124 | 124 | 0 |
| FDIV (subnormal result) | 504 | 504 | 0 |
| FDIV (underflow halfway to zero) | 1283 | 1283 | 0 |
| FDIV (overflow) | 565 | 565 | 0 |
| FDIV (finite divided by infinity) | 157 | 157 | 0 |
| FDIV (infinity divided by finite) | 150 | 150 | 0 |
| FDIV (invalid zero divided by zero) | 126 | 126 | 0 |
| FDIV (invalid infinity divided by infinity) | 159 | 159 | 0 |
| FDIV (quiet NaN operand) | 145 | 145 | 0 |
| FDIV (equal operands) | 496 | 496 | 0 |
| FNEG q0 (signed zero) | 38 | 38 | 0 |
| FNEG q3 (NaN payload/sign bit path) | 38 | 38 | 0 |
| FABS q0 (signed zero) | 38 | 38 | 0 |
| FABS q3 (NaN payload/sign bit path) | 35 | 35 | 0 |
| S16TOF (zero) | 76 | 76 | 0 |
| S16TOF (small positive) | 125 | 125 | 0 |
| S16TOF (small negative) | 131 | 131 | 0 |
| S16TOF (INT16_MAX) | 88 | 88 | 0 |
| S16TOF (INT16_MIN) | 90 | 90 | 0 |
| U16TOF (zero) | 74 | 74 | 0 |
| U16TOF (small) | 123 | 123 | 0 |
| U16TOF (UINT16_MAX) | 82 | 82 | 0 |
| U16TOF (high-bit value) | 82 | 82 | 0 |
| FTOS16 (+zero) | 96 | 96 | 0 |
| FTOS16 (-zero) | 96 | 96 | 0 |
| FTOS16 (positive fractional) | 112 | 112 | 0 |
| FTOS16 (negative fractional) | 118 | 118 | 0 |
| FTOS16 (largest in-range positive neighborhood) | 104 | 104 | 0 |
| FTOS16 (INT16_MIN) | 104 | 104 | 0 |
| FTOS16 (NaN unspecified result) | 105 | 105 | 0 |
| FTOS16 (infinity unspecified result) | 105 | 105 | 0 |
| FTOU16 (zero) | 86 | 86 | 0 |
| FTOU16 (positive fractional) | 102 | 102 | 0 |
| FTOU16 (UINT16_MAX neighborhood) | 88 | 88 | 0 |
| FTOU16 (negative unspecified result) | 144 | 144 | 0 |
| FTOU16 (NaN unspecified result) | 89 | 89 | 0 |
| FTOU16 (infinity unspecified result) | 89 | 89 | 0 |
| S32TOF (zero) | 73 | 73 | 0 |
| S32TOF (small positive) | 122 | 122 | 0 |
| S32TOF (small negative) | 128 | 128 | 0 |
| S32TOF (rounding above 2^24) | 84 | 84 | 0 |
| S32TOF (INT32_MAX) | 142 | 142 | 0 |
| S32TOF (INT32_MIN) | 149 | 149 | 0 |
| S32TOF (equal operands) | 74 | 74 | 0 |
| U32TOF (zero) | 73 | 73 | 0 |
| U32TOF (small) | 122 | 122 | 0 |
| U32TOF (ties-to-even neighborhood) | 84 | 84 | 0 |
| U32TOF (UINT32_MAX) | 151 | 151 | 0 |
| U32TOF (equal operands) | 143 | 143 | 0 |
| FTOS32 (zero) | 99 | 99 | 0 |
| FTOS32 (positive fractional) | 115 | 115 | 0 |
| FTOS32 (negative fractional) | 121 | 121 | 0 |
| FTOS32 (large in-range positive) | 149 | 149 | 0 |
| FTOS32 (INT32_MIN) | 169 | 169 | 0 |
| FTOS32 (NaN unspecified result) | 108 | 108 | 0 |
| FTOS32 (infinity unspecified result) | 108 | 108 | 0 |
| FTOS32 (equal operands) | 157 | 157 | 0 |
| FTOU32 (zero) | 89 | 89 | 0 |
| FTOU32 (positive fractional) | 105 | 105 | 0 |
| FTOU32 (large in-range unsigned) | 147 | 147 | 0 |
| FTOU32 (negative unspecified result) | 147 | 147 | 0 |
| FTOU32 (NaN unspecified result) | 92 | 92 | 0 |
| FTOU32 (infinity unspecified result) | 92 | 92 | 0 |
| FTOU32 (equal operands) | 141 | 141 | 0 |
| FCMP (less) | 78 | 78 | 0 |
| FCMP (greater) | 83 | 83 | 0 |
| FCMP (equal) | 87 | 87 | 0 |
| FCMP (signed zeros equal) | 81 | 81 | 0 |
| FCMP (left quiet NaN unordered) | 61 | 61 | 0 |
| FCMP (right quiet NaN unordered) | 69 | 69 | 0 |
| FCMP (left signaling NaN unordered) | 61 | 61 | 0 |
| FCMP (equal operands) | 87 | 87 | 0 |
| FCLASS (signaling NaN) | 65 | 65 | 0 |
| FCLASS (quiet NaN) | 71 | 71 | 0 |
| FCLASS (negative infinity) | 78 | 78 | 0 |
| FCLASS (negative normal) | 81 | 81 | 0 |
| FCLASS (negative subnormal) | 89 | 89 | 0 |
| FCLASS (negative zero) | 93 | 93 | 0 |
| FCLASS (positive zero) | 98 | 98 | 0 |
| FCLASS (positive subnormal) | 106 | 106 | 0 |
| FCLASS (positive normal) | 110 | 110 | 0 |
| FCLASS (positive infinity) | 119 | 119 | 0 |
| FNEG q1 (negative normal) | 38 | 38 | 0 |
| FNEG q2 (negative subnormal) | 38 | 38 | 0 |
| FABS q1 (negative normal) | 38 | 38 | 0 |
| FABS q2 (negative subnormal) | 35 | 35 | 0 |
| FPOLY (N=1; x=0.5; coefficients=0.25) | 168 | 168 | 0 |
| FPOLY (N=3; x=0.5; coefficients=0.25) | 717 | 717 | 0 |
| FPOLY (N=5; x=0.5; coefficients=0.25) | 1287 | 1287 | 0 |
| FPOLY (N=9; x=0.5; coefficients=0.25) | 2427 | 2427 | 0 |
| FPOLY (N=255; x=0.5; coefficients=0.25) | 72543 | 72543 | 0 |
| FSQRT (normal) | 629 | 629 | 0 |
| FSQRT (positive subnormal) | 784 | 784 | 0 |
| FTRUNC (fractional) | 377 | 377 | 0 |
| FFLOOR (negative fractional) | 382 | 382 | 0 |
| FCEIL (fractional) | 383 | 383 | 0 |
| FROUND (negative halfway) | 390 | 390 | 0 |
| FMOD (normal) | 189 | 189 | 0 |
| FMOD (large exponent gap) | 660 | 660 | 0 |
| FREMPIO2 (6.25 radians) | 225 | 225 | 0 |
| FMA (retained product residual) | 464 | 464 | 0 |
| CMP r4,r5 (upper one-byte) | 18 | 18 | 0 |
| CMP r0,r1 (full F5) | 39 | 39 | 0 |
| CMP32 q0,q1 (cold F0) | 83 | 83 | 0 |
| CMPI.S8 r4,simm8 (upper) | 35 | 35 | 0 |
| CMPI.S8 r0,simm8 (cold lower) | 55 | 55 | 0 |
| TST8 r0 | 38 | 38 | 0 |
| TST16 r0 | 39 | 39 | 0 |
| CSET.EQ r0 (true) | 41 | 41 | 0 |
| CSET.EQ r0 (false) | 41 | 41 | 0 |
| CSET.NE r0 (true) | 41 | 41 | 0 |
| CSET.NE r0 (false) | 41 | 41 | 0 |
| CSET.ULT r0 (true) | 41 | 41 | 0 |
| CSET.ULT r0 (false) | 41 | 41 | 0 |
| CSET.UGE r0 (true) | 41 | 41 | 0 |
| CSET.UGE r0 (false) | 41 | 41 | 0 |
| CSET.SLT r0 (true) | 41 | 41 | 0 |
| CSET.SLT r0 (false) | 41 | 41 | 0 |
| CSET.SGE r0 (true) | 41 | 41 | 0 |
| CSET.SGE r0 (false) | 41 | 41 | 0 |
| CMOV.EQ r0,r1 (taken) | 37 | 37 | 0 |
| CMOV.EQ r0,r1 (not taken) | 36 | 36 | 0 |
| CMOV.NE r0,r1 (taken) | 37 | 37 | 0 |
| CMOV.NE r0,r1 (not taken) | 36 | 36 | 0 |
| CMOV.ULT r0,r1 (taken) | 37 | 37 | 0 |
| CMOV.ULT r0,r1 (not taken) | 36 | 36 | 0 |
| CMOV.UGE r0,r1 (taken) | 37 | 37 | 0 |
| CMOV.UGE r0,r1 (not taken) | 36 | 36 | 0 |
| CMOV.SLT r0,r1 (taken) | 37 | 37 | 0 |
| CMOV.SLT r0,r1 (not taken) | 36 | 36 | 0 |
| CMOV.SGE r0,r1 (taken) | 37 | 37 | 0 |
| CMOV.SGE r0,r1 (not taken) | 36 | 36 | 0 |
| LD8U r4,[r6] (upper one-byte) | 18 | 18 | 0 |
| ST8 [r6],r5 (upper one-byte) | 18 | 18 | 0 |
| LD16 r4,[r6] (upper one-byte) | 18 | 18 | 0 |
| ST16 [r6],r5 (upper one-byte) | 18 | 18 | 0 |
| ST8 [r6],r0 (dense F3) | 38 | 38 | 0 |
| LD8U r0,[r6] (dense F5) | 38 | 38 | 0 |
| LD16 r0,[r6] (dense F5) | 39 | 39 | 0 |
| ST16 [r6],r0 (dense F5) | 39 | 39 | 0 |
| LD8U r0,[r6+] (dense F7) | 39 | 39 | 0 |
| LD16 r0,[r6+] (dense F7) | 40 | 40 | 0 |
| ST8 [r6+],r0 (dense F6) | 38 | 38 | 0 |
| ST16 [r6+],r0 (dense F7) | 40 | 40 | 0 |
| LD8U r0,[r1] (cold general F0) | 70 | 70 | 0 |
| LD16 r0,[r1] (cold general F0) | 71 | 71 | 0 |
| ST8 [r1],r0 (cold general F0) | 68 | 68 | 0 |
| ST16 [r1],r0 (cold general F0) | 69 | 69 | 0 |
| LD8U r0,[r1+7] (displaced ED) | 54 | 54 | 0 |
| LD16 r0,[r1-5] (displaced ED) | 55 | 55 | 0 |
| ST8 [r1+7],r0 (displaced EE) | 54 | 54 | 0 |
| ST16 [r1-5],r0 (displaced EE) | 55 | 55 | 0 |
| LD8U r0,[r1+] (cold general F0) | 76 | 76 | 0 |
| LD16 r0,[r1+] (cold general F0) | 77 | 77 | 0 |
| ST8 [r1+],r0 (cold general F0) | 73 | 73 | 0 |
| ST16 [r1+],r0 (cold general F0) | 74 | 74 | 0 |
| LDSP8U r4,[SP+8] (upper short) | 38 | 38 | 0 |
| STSP8 [SP+8],r4 (upper short) | 37 | 37 | 0 |
| LDSP16 r4,[SP+8] (upper short) | 38 | 38 | 0 |
| STSP16 [SP+8],r4 (upper short) | 38 | 38 | 0 |
| LDSP8U r0,[SP+32] (cold) | 62 | 62 | 0 |
| LDSP8S r0,[SP+32] (cold) | 64 | 64 | 0 |
| STSP8 [SP+32],r0 (cold) | 60 | 60 | 0 |
| LDSP16 r0,[SP+32] (cold) | 64 | 64 | 0 |
| STSP16 [SP+32],r0 (cold) | 64 | 64 | 0 |
| LDM8U r0,0x0600 | 72 | 72 | 0 |
| STM8 0x0600,r0 | 72 | 72 | 0 |
| LDM16 r0,0x0600 | 72 | 72 | 0 |
| STM16 0x0600,r0 | 72 | 72 | 0 |
| LD32 q0,[r4] | 82 | 82 | 0 |
| ST32 [r4],q0 | 81 | 81 | 0 |
| LDP8U r0,[q3] | 285 | 285 | 0 |
| LDP8S r0,[q3] | 287 | 287 | 0 |
| LDP16 r0,[q3] | 301 | 301 | 0 |
| LDP24 q0,[q3] | 321 | 321 | 0 |
| LDP32 q0,[q3] | 335 | 335 | 0 |
| LDP8U r0,[q3+] | 302 | 302 | 0 |
| LDP16 r0,[q3+] | 318 | 318 | 0 |
| LDP24 q0,[q3+] | 338 | 338 | 0 |
| LDP32 q0,[q3+] | 352 | 352 | 0 |
| BREQ8 (not taken) | 35 | 35 | 0 |
| BREQ8 (taken) | 132 | 132 | 0 |
| BRNE8 (not taken) | 35 | 35 | 0 |
| BRNE8 (taken) | 132 | 132 | 0 |
| BRULT8 (not taken) | 35 | 35 | 0 |
| BRULT8 (taken) | 132 | 132 | 0 |
| BRUGE8 (not taken) | 35 | 35 | 0 |
| BRUGE8 (taken) | 132 | 132 | 0 |
| BRSLT8 (not taken) | 35 | 35 | 0 |
| BRSLT8 (taken) | 132 | 132 | 0 |
| BRSGE8 (not taken) | 35 | 35 | 0 |
| BRSGE8 (taken) | 132 | 132 | 0 |
| BREQ16 (not taken) | 51 | 51 | 0 |
| BREQ16 (taken) | 139 | 139 | 0 |
| BRNE16 (not taken) | 51 | 51 | 0 |
| BRNE16 (taken) | 139 | 139 | 0 |
| BRULT16 (not taken) | 51 | 51 | 0 |
| BRULT16 (taken) | 139 | 139 | 0 |
| BRUGE16 (not taken) | 51 | 51 | 0 |
| BRUGE16 (taken) | 139 | 139 | 0 |
| BRSLT16 (not taken) | 51 | 51 | 0 |
| BRSLT16 (taken) | 139 | 139 | 0 |
| BRSGE16 (not taken) | 51 | 51 | 0 |
| BRSGE16 (taken) | 139 | 139 | 0 |
| JMP8 rel8 | 126 | 126 | 0 |
| CALL8 rel8 | 131 | 131 | 0 |
| JMP16 rel16 | 139 | 139 | 0 |
| CALL16 rel16 | 140 | 140 | 0 |
| JMPF target24 | 154 | 154 | 0 |
| CALLF target24 | 154 | 154 | 0 |
| JMPP q0 | 114 | 114 | 0 |
| CALLP q0 | 123 | 123 | 0 |
| SYS memcpy (n=0) | 43 | 43 | 0 |
| SYS memcpy (n=1) | 54 | 54 | 0 |
| SYS memcpy (n=2) | 61 | 61 | 0 |
| SYS memcpy (n=3) | 64 | 64 | 0 |
| SYS memcpy (n=4) | 73 | 73 | 0 |
| SYS memcpy (n=5) | 76 | 76 | 0 |
| SYS memcpy (n=6) | 85 | 85 | 0 |
| SYS memcpy (n=7) | 88 | 88 | 0 |
| SYS memcpy (n=8) | 97 | 97 | 0 |
| SYS memcpy (n=16) | 145 | 145 | 0 |
| SYS memcpy (n=32) | 241 | 241 | 0 |
| SYS memcpy (n=256) | 1585 | 1585 | 0 |
| SYS memmove (n=0; zero-length fast path) | 43 | 43 | 0 |
| SYS memmove (n=1; forward non-overlap) | 59 | 59 | 0 |
| SYS memmove (n=2; forward overlap) | 66 | 66 | 0 |
| SYS memmove (n=3; forward overlap) | 69 | 69 | 0 |
| SYS memmove (n=4; forward overlap) | 78 | 78 | 0 |
| SYS memmove (n=5; forward overlap) | 81 | 81 | 0 |
| SYS memmove (n=6; forward overlap) | 90 | 90 | 0 |
| SYS memmove (n=7; forward overlap) | 93 | 93 | 0 |
| SYS memmove (n=8; forward overlap) | 102 | 102 | 0 |
| SYS memmove (n=16; forward overlap) | 150 | 150 | 0 |
| SYS memmove (n=32; forward overlap) | 246 | 246 | 0 |
| SYS memmove (n=256; forward overlap) | 1590 | 1590 | 0 |
| SYS memmove (n=2; backward overlap) | 75 | 75 | 0 |
| SYS memmove (n=3; backward overlap) | 80 | 80 | 0 |
| SYS memmove (n=4; backward overlap) | 87 | 87 | 0 |
| SYS memmove (n=5; backward overlap) | 92 | 92 | 0 |
| SYS memmove (n=6; backward overlap) | 99 | 99 | 0 |
| SYS memmove (n=7; backward overlap) | 104 | 104 | 0 |
| SYS memmove (n=8; backward overlap) | 111 | 111 | 0 |
| SYS memmove (n=16; backward overlap) | 159 | 159 | 0 |
| SYS memmove (n=32; backward overlap) | 255 | 255 | 0 |
| SYS memmove (n=256; backward overlap) | 1599 | 1599 | 0 |
| SYS memcpy_P (n=0) | 44 | 44 | 0 |
| SYS memcpy_P (n=1) | 250 | 250 | 0 |
| SYS memcpy_P (n=2) | 267 | 267 | 0 |
| SYS memcpy_P (n=3) | 284 | 284 | 0 |
| SYS memcpy_P (n=4) | 301 | 301 | 0 |
| SYS memcpy_P (n=5) | 318 | 318 | 0 |
| SYS memcpy_P (n=6) | 335 | 335 | 0 |
| SYS memcpy_P (n=7) | 352 | 352 | 0 |
| SYS memcpy_P (n=8) | 369 | 369 | 0 |
| SYS memcpy_P (n=16) | 505 | 505 | 0 |
| SYS memcpy_P (n=32) | 777 | 777 | 0 |
| SYS memcpy_P (n=256) | 4585 | 4585 | 0 |
| SYS memset (n=0) | 43 | 43 | 0 |
| SYS memset (n=1) | 52 | 52 | 0 |
| SYS memset (n=2) | 57 | 57 | 0 |
| SYS memset (n=3) | 58 | 58 | 0 |
| SYS memset (n=4) | 65 | 65 | 0 |
| SYS memset (n=5) | 66 | 66 | 0 |
| SYS memset (n=6) | 73 | 73 | 0 |
| SYS memset (n=7) | 74 | 74 | 0 |
| SYS memset (n=8) | 81 | 81 | 0 |
| SYS memset (n=16) | 113 | 113 | 0 |
| SYS memset (n=32) | 177 | 177 | 0 |
| SYS memset (n=256) | 1073 | 1073 | 0 |
| SYS memcmp (n=0; zero-length fast path) | 45 | 45 | 0 |
| SYS memcmp (n=1; equal) | 52 | 52 | 0 |
| SYS memcmp (n=32; equal) | 362 | 362 | 0 |
| SYS memcmp (n=32; first-byte mismatch) | 48 | 48 | 0 |
| SYS memcmp (n=32; last-byte mismatch) | 358 | 358 | 0 |
| SYS memcmp_P (n=0; zero-length fast path; q3 padding=0xa5) | 39 | 39 | 0 |
| SYS memcmp_P (n=1; equal; q3 padding=0xa5) | 251 | 251 | 0 |
| SYS memcmp_P (n=32; equal; q3 padding=0xa5) | 778 | 778 | 0 |
| SYS memcmp_P (n=32; first-byte mismatch; q3 padding=0xa5) | 251 | 251 | 0 |
| SYS memcmp_P (n=32; last-byte mismatch; q3 padding=0xa5) | 779 | 779 | 0 |
| SYS strcmp (equal empty) | 47 | 47 | 0 |
| SYS strcmp (equal one byte) | 56 | 56 | 0 |
| SYS strcmp (equal length 32) | 335 | 335 | 0 |
| SYS strcmp (first-byte mismatch) | 44 | 44 | 0 |
| SYS strcmp (last-byte mismatch) | 323 | 323 | 0 |
| SYS strcmp (lhs is prefix) | 116 | 116 | 0 |
| SYS strcmp (rhs is prefix) | 116 | 116 | 0 |
| SYS strcmp_P (equal empty; q3 padding=0xa5) | 246 | 246 | 0 |
| SYS strcmp_P (equal one byte; q3 padding=0xa5) | 263 | 263 | 0 |
| SYS strcmp_P (equal length 32; q3 padding=0xa5) | 790 | 790 | 0 |
| SYS strcmp_P (first-byte mismatch; q3 padding=0xa5) | 247 | 247 | 0 |
| SYS strcmp_P (last-byte mismatch; q3 padding=0xa5) | 775 | 775 | 0 |
| SYS strcmp_P (lhs is prefix; q3 padding=0xa5) | 384 | 384 | 0 |
| SYS strcmp_P (rhs is prefix; q3 padding=0xa5) | 383 | 383 | 0 |
| SYS strlen (length 0) | 43 | 43 | 0 |
| SYS strlen (length 1) | 48 | 48 | 0 |
| SYS strlen (length 8) | 83 | 83 | 0 |
| SYS strlen (length 32) | 203 | 203 | 0 |
| SYS strlen (length 256) | 1323 | 1323 | 0 |
| SYS strlen_P (length 0; q3 padding=0xa5) | 245 | 245 | 0 |
| SYS strlen_P (length 1; q3 padding=0xa5) | 262 | 262 | 0 |
| SYS strlen_P (length 8; q3 padding=0xa5) | 381 | 381 | 0 |
| SYS strlen_P (length 32; q3 padding=0xa5) | 789 | 789 | 0 |
| SYS strlen_P (length 256; q3 padding=0xa5) | 4597 | 4597 | 0 |
| SYS strncpy (n=0; zero-length fast path) | 37 | 37 | 0 |
| SYS strncpy (n=1; truncation) | 58 | 58 | 0 |
| SYS strncpy (n=8; source length 3 with padding) | 114 | 114 | 0 |
| SYS strncpy (n=8; source length 8 without copied NUL) | 135 | 135 | 0 |
| SYS strncpy (n=8; source length 32 truncation) | 135 | 135 | 0 |
| SYS strncpy (n=32; source length 3 with long padding) | 258 | 258 | 0 |
| SYS strncpy_P (n=0; zero-length fast path; q3 padding=0xa5) | 37 | 37 | 0 |
| SYS strncpy_P (n=1; truncation; q3 padding=0xa5) | 264 | 264 | 0 |
| SYS strncpy_P (n=8; source length 3 with padding; q3 padding=0xa5) | 337 | 337 | 0 |
| SYS strncpy_P (n=8; source length 8 without copied NUL; q3 padding=0xa5) | 383 | 383 | 0 |
| SYS strncpy_P (n=8; source length 32 truncation; q3 padding=0xa5) | 383 | 383 | 0 |
| SYS strncpy_P (n=32; source length 3 with long padding; q3 padding=0xa5) | 481 | 481 | 0 |
| SYS strncat (n=0; destination length 8) | 37 | 37 | 0 |
| SYS strncat (empty destination and empty source) | 63 | 63 | 0 |
| SYS strncat (empty destination and source length 3) | 96 | 96 | 0 |
| SYS strncat (destination length 8 and source length 3) | 136 | 136 | 0 |
| SYS strncat (destination length 8; source truncated at 4) | 138 | 138 | 0 |
| SYS strncat (destination length 32 and source length 3) | 256 | 256 | 0 |
| SYS strncat (destination length 256 and source length 1) | 1345 | 1345 | 0 |
| SYS strncat_P (n=0; destination length 8; q3 padding=0xa5) | 37 | 37 | 0 |
| SYS strncat_P (empty destination and empty source; q3 padding=0xa5) | 268 | 268 | 0 |
| SYS strncat_P (empty destination and source length 3; q3 padding=0xa5) | 319 | 319 | 0 |
| SYS strncat_P (destination length 8 and source length 3; q3 padding=0xa5) | 359 | 359 | 0 |
| SYS strncat_P (destination length 8; source truncated at 4; q3 padding=0xa5) | 360 | 360 | 0 |
| SYS strncat_P (destination length 32 and source length 3; q3 padding=0xa5) | 479 | 479 | 0 |
| SYS strncat_P (destination length 256 and source length 1; q3 padding=0xa5) | 1549 | 1549 | 0 |
| SYS vsnprintf (empty format; size=0) | 275 | 275 | 0 |
| SYS vsnprintf (one-byte literal) | 350 | 350 | 0 |
| SYS vsnprintf (32-byte literal; complete output) | 2582 | 2582 | 0 |
| SYS vsnprintf (32-byte literal; destination size=8 truncation) | 2532 | 2532 | 0 |
| SYS vsnprintf (%c) | 532 | 532 | 0 |
| SYS vsnprintf (%s; RAM string length 3) | 588 | 588 | 0 |
| SYS vsnprintf (%.8s; RAM string length 32) | 784 | 784 | 0 |
| SYS vsnprintf (%S; program string length 3) | 1090 | 1090 | 0 |
| SYS vsnprintf (%40S; program string length 32 with padding) | 3807 | 3807 | 0 |
| SYS vsnprintf (%d; INT16_MIN) | 1804 | 1804 | 0 |
| SYS vsnprintf (%ld; INT32_MIN) | 3913 | 3913 | 0 |
| SYS vsnprintf (%lu; UINT32_MAX) | 3881 | 3881 | 0 |
| SYS vsnprintf (%#08x; 16-bit alternate zero padding) | 1727 | 1727 | 0 |
| SYS vsnprintf (%*.*u; dynamic width=12 precision=5) | 1366 | 1366 | 0 |
| SYS vsnprintf (conversion split at format-cache boundary) | 2486 | 2486 | 0 |
| SYS vsnprintf (mixed %c %s %S %ld %#x) | 6095 | 6095 | 0 |
| SYS vsnprintf (%p; data pointer) | 724 | 724 | 0 |
| SYS vsnprintf (malformed %q error exit) | 391 | 391 | 0 |
| SYS vsnprintf_P (empty format; size=0; q3 padding=0xa5) | 456 | 456 | 0 |
| SYS vsnprintf_P (one-byte literal; q3 padding=0xa5) | 568 | 568 | 0 |
| SYS vsnprintf_P (32-byte literal; complete output; q3 padding=0xa5) | 4227 | 4227 | 0 |
| SYS vsnprintf_P (32-byte literal; destination size=8 truncation; q3 padding=0xa5) | 4177 | 4177 | 0 |
| SYS vsnprintf_P (%c; q3 padding=0xa5) | 787 | 787 | 0 |
| SYS vsnprintf_P (%s; RAM string length 3; q3 padding=0xa5) | 843 | 843 | 0 |
| SYS vsnprintf_P (%.8s; RAM string length 32; q3 padding=0xa5) | 1113 | 1113 | 0 |
| SYS vsnprintf_P (%S; program string length 3; q3 padding=0xa5) | 1345 | 1345 | 0 |
| SYS vsnprintf_P (%40S; program string length 32 with padding; q3 padding=0xa5) | 4136 | 4136 | 0 |
| SYS vsnprintf_P (%d; INT16_MIN; q3 padding=0xa5) | 2059 | 2059 | 0 |
| SYS vsnprintf_P (%ld; INT32_MIN; q3 padding=0xa5) | 4205 | 4205 | 0 |
| SYS vsnprintf_P (%lu; UINT32_MAX; q3 padding=0xa5) | 4173 | 4173 | 0 |
| SYS vsnprintf_P (%#08x; 16-bit alternate zero padding; q3 padding=0xa5) | 2093 | 2093 | 0 |
| SYS vsnprintf_P (%*.*u; dynamic width=12 precision=5; q3 padding=0xa5) | 1732 | 1732 | 0 |
| SYS vsnprintf_P (conversion split at 16-byte program-format cache boundary; q3 padding=0xa5) | 3436 | 3436 | 0 |
| SYS vsnprintf_P (mixed %c %s %S %ld %#x; q3 padding=0xa5) | 7378 | 7378 | 0 |
| SYS vsnprintf_P (%p; data pointer; q3 padding=0xa5) | 979 | 979 | 0 |
| SYS vsnprintf_P (malformed %q error exit; q3 padding=0xa5) | 639 | 639 | 0 |
| SYS debug_printfv_P (%f; +zero default; q3 padding=0xa5) | 1310 | 1310 | 0 |
| SYS debug_printfv_P (%f; -zero default; q3 padding=0xa5) | 1344 | 1344 | 0 |
| SYS debug_printfv_P (%f; 1.5 normal default; q3 padding=0xa5) | 2067 | 2067 | 0 |
| SYS debug_printfv_P (%.0f; 2.5 half-up rounding; q3 padding=0xa5) | 1942 | 1942 | 0 |
| SYS debug_printfv_P (%.2f; 9.99609375 carry to 10.00; q3 padding=0xa5) | 2418 | 2418 | 0 |
| SYS debug_printfv_P (%.6f; small fixed with leading fractional zeros; q3 padding=0xa5) | 2142 | 2142 | 0 |
| SYS debug_printfv_P (%.10f; precision beyond digit engine; q3 padding=0xa5) | 2382 | 2382 | 0 |
| SYS debug_printfv_P (%+016.3f; positive zero padding; q3 padding=0xa5) | 2450 | 2450 | 0 |
| SYS debug_printfv_P (%-16.3f; negative left alignment; q3 padding=0xa5) | 2548 | 2548 | 0 |
| SYS debug_printfv_P (%#.0f; forced decimal point; q3 padding=0xa5) | 1842 | 1842 | 0 |
| SYS debug_printfv_P (%e; 1.5 normal default; q3 padding=0xa5) | 2094 | 2094 | 0 |
| SYS debug_printfv_P (%E; -0.125 uppercase; q3 padding=0xa5) | 2208 | 2208 | 0 |
| SYS debug_printfv_P (%.0e; rounding below one to exponent zero; q3 padding=0xa5) | 1935 | 1935 | 0 |
| SYS debug_printfv_P (%.2e; carry to next decimal exponent; q3 padding=0xa5) | 2432 | 2432 | 0 |
| SYS debug_printfv_P (%.7e; maximum finite; q3 padding=0xa5) | 2551 | 2551 | 0 |
| SYS debug_printfv_P (%.7e; minimum normal; q3 padding=0xa5) | 2697 | 2697 | 0 |
| SYS debug_printfv_P (%.5e; minimum subnormal supported precision; q3 padding=0xa5) | 2733 | 2733 | 0 |
| SYS debug_printfv_P (%+016.3e; positive zero padding; q3 padding=0xa5) | 2542 | 2542 | 0 |
| SYS debug_printfv_P (%g; fixed-notation branch; q3 padding=0xa5) | 2280 | 2280 | 0 |
| SYS debug_printfv_P (%g; small scientific-notation branch; q3 padding=0xa5) | 2313 | 2313 | 0 |
| SYS debug_printfv_P (%.4g; rounding crosses negative notation threshold; q3 padding=0xa5) | 2627 | 2627 | 0 |
| SYS debug_printfv_P (%.4g; all-digit carry selects scientific notation; q3 padding=0xa5) | 2454 | 2454 | 0 |
| SYS debug_printfv_P (%#g; alternate form retains trailing zeros; q3 padding=0xa5) | 2222 | 2222 | 0 |
| SYS debug_printfv_P (%#.10G; uppercase with synthetic trailing zeros; q3 padding=0xa5) | 2527 | 2527 | 0 |
| SYS debug_printfv_P (%g; +zero; q3 padding=0xa5) | 1210 | 1210 | 0 |
| SYS debug_printfv_P (%g; -zero; q3 padding=0xa5) | 1244 | 1244 | 0 |
| SYS debug_printfv_P (%-16.5G; uppercase scientific left alignment; q3 padding=0xa5) | 2508 | 2508 | 0 |
| SYS debug_printfv_P (%a; +zero; q3 padding=0xa5) | 1356 | 1356 | 0 |
| SYS debug_printfv_P (%a; -zero; q3 padding=0xa5) | 1390 | 1390 | 0 |
| SYS debug_printfv_P (%a; 1.5 exact trimmed; q3 padding=0xa5) | 1465 | 1465 | 0 |
| SYS debug_printfv_P (%A; 0.1 uppercase exact; q3 padding=0xa5) | 1472 | 1472 | 0 |
| SYS debug_printfv_P (%.6a; 0.1 full binary32 fraction; q3 padding=0xa5) | 1613 | 1613 | 0 |
| SYS debug_printfv_P (%a; minimum normal; q3 padding=0xa5) | 1414 | 1414 | 0 |
| SYS debug_printfv_P (%a; minimum subnormal; q3 padding=0xa5) | 1632 | 1632 | 0 |
| SYS debug_printfv_P (%a; largest subnormal normalized; q3 padding=0xa5) | 1539 | 1539 | 0 |
| SYS debug_printfv_P (%.0a; largest subnormal rounds into normal range; q3 padding=0xa5) | 1955 | 1955 | 0 |
| SYS debug_printfv_P (%.0a; maximum finite rounds to exponent +128; q3 padding=0xa5) | 1941 | 1941 | 0 |
| SYS debug_printfv_P (%.1a; maximum finite rounded with explicit fraction; q3 padding=0xa5) | 1981 | 1981 | 0 |
| SYS debug_printfv_P (%+018.3a; positive zero padding after prefix; q3 padding=0xa5) | 2153 | 2153 | 0 |
| SYS debug_printfv_P (%-18.2A; negative uppercase left alignment; q3 padding=0xa5) | 2128 | 2128 | 0 |
| SYS debug_printfv_P (%#.0a; forced radix point; q3 padding=0xa5) | 1937 | 1937 | 0 |
| SYS debug_printfv_P (%.8a; precision beyond exact fraction; q3 padding=0xa5) | 1612 | 1612 | 0 |
| SYS debug_printfv_P (%f; +infinity fast path; q3 padding=0xa5) | 2109 | 2109 | 0 |
| SYS debug_printfv_P (%E; -infinity uppercase fast path; q3 padding=0xa5) | 2019 | 2019 | 0 |
| SYS debug_printfv_P (%G; quiet NaN uppercase fast path; q3 padding=0xa5) | 1967 | 1967 | 0 |
| SYS debug_printfv_P (%+12A; signed quiet NaN with width; q3 padding=0xa5) | 1214 | 1214 | 0 |
| SYS debug_printfv_P (%*.*f; dynamic width=12 precision=4; q3 padding=0xa5) | 2420 | 2420 | 0 |
| SYS debug_printfv_P (%*.*g; negative precision means omitted; q3 padding=0xa5) | 2322 | 2322 | 0 |
| SYS debug_printfv_P (%.*a; dynamic precision=3; q3 padding=0xa5) | 1772 | 1772 | 0 |
| SYS debug_printfv_P (mixed %f %e %g %a; packed float arguments; q3 padding=0xa5) | 6890 | 6890 | 0 |
| SYS display (clear=false; nonzero framebuffer) | 18595 | 18595 | 0 |
| SYS display (clear=true; nonzero framebuffer) | 18595 | 18595 | 0 |
| SYS draw_filled_rect_white (width=0, height=8; zero-width fast path) | 40 | 40 | 0 |
| SYS draw_filled_rect_white (width=8, height=0; zero-height fast path) | 42 | 42 | 0 |
| SYS draw_filled_rect_white (1x1 at x=0,y=0) | 175 | 175 | 0 |
| SYS draw_filled_rect_white (8x8 at x=40,y=24; aligned) | 191 | 191 | 0 |
| SYS draw_filled_rect_white (8x8 at x=40,y=27; unaligned) | 310 | 310 | 0 |
| SYS draw_filled_rect_white (16x9 at x=16,y=8; partial final page) | 353 | 353 | 0 |
| SYS draw_filled_rect_white (16x9 at x=16,y=11; unaligned) | 438 | 438 | 0 |
| SYS draw_filled_rect_white (16x17 at x=16,y=8; three destination pages) | 407 | 407 | 0 |
| SYS draw_filled_rect_white (16x17 at x=16,y=13; unaligned three-page path) | 492 | 492 | 0 |
| SYS draw_filled_rect_white (32x16 at x=48,y=24; medium aligned rectangle) | 344 | 344 | 0 |
| SYS draw_filled_rect_white (64x32 at x=32,y=16; large aligned rectangle) | 834 | 834 | 0 |
| SYS draw_filled_rect_white (128x64 at x=0,y=0; full-screen rectangle) | 2730 | 2730 | 0 |
| SYS draw_filled_rect_white (16x9 at x=-5,y=11; left clipping) | 359 | 359 | 0 |
| SYS draw_filled_rect_white (16x9 at x=120,y=11; right clipping) | 310 | 310 | 0 |
| SYS draw_filled_rect_white (16x9 at x=16,y=-4; top clipping) | 296 | 296 | 0 |
| SYS draw_filled_rect_white (16x9 at x=16,y=60; bottom clipping) | 295 | 295 | 0 |
| SYS draw_filled_rect_white (16x9 at x=-5,y=-4; top-left clipping) | 257 | 257 | 0 |
| SYS draw_filled_rect_white (16x9 at x=120,y=60; bottom-right clipping) | 231 | 231 | 0 |
| SYS draw_filled_rect_white (16x9 at x=128,y=11; fully off right) | 45 | 45 | 0 |
| SYS draw_filled_rect_white (16x9 at x=16,y=64; fully off bottom) | 48 | 48 | 0 |
| SYS draw_filled_rect_white (16x9 at x=-16,y=11; fully off left) | 54 | 54 | 0 |
| SYS draw_filled_rect_white (16x9 at x=16,y=-9; fully off top) | 59 | 59 | 0 |
| SYS draw_filled_rect_black (width=0, height=8; zero-width fast path) | 40 | 40 | 0 |
| SYS draw_filled_rect_black (width=8, height=0; zero-height fast path) | 42 | 42 | 0 |
| SYS draw_filled_rect_black (1x1 at x=0,y=0) | 175 | 175 | 0 |
| SYS draw_filled_rect_black (8x8 at x=40,y=24; aligned) | 191 | 191 | 0 |
| SYS draw_filled_rect_black (8x8 at x=40,y=27; unaligned) | 310 | 310 | 0 |
| SYS draw_filled_rect_black (16x9 at x=16,y=8; partial final page) | 353 | 353 | 0 |
| SYS draw_filled_rect_black (16x9 at x=16,y=11; unaligned) | 438 | 438 | 0 |
| SYS draw_filled_rect_black (16x17 at x=16,y=8; three destination pages) | 407 | 407 | 0 |
| SYS draw_filled_rect_black (16x17 at x=16,y=13; unaligned three-page path) | 492 | 492 | 0 |
| SYS draw_filled_rect_black (32x16 at x=48,y=24; medium aligned rectangle) | 344 | 344 | 0 |
| SYS draw_filled_rect_black (64x32 at x=32,y=16; large aligned rectangle) | 834 | 834 | 0 |
| SYS draw_filled_rect_black (128x64 at x=0,y=0; full-screen rectangle) | 2730 | 2730 | 0 |
| SYS draw_filled_rect_black (16x9 at x=-5,y=11; left clipping) | 359 | 359 | 0 |
| SYS draw_filled_rect_black (16x9 at x=120,y=11; right clipping) | 310 | 310 | 0 |
| SYS draw_filled_rect_black (16x9 at x=16,y=-4; top clipping) | 296 | 296 | 0 |
| SYS draw_filled_rect_black (16x9 at x=16,y=60; bottom clipping) | 295 | 295 | 0 |
| SYS draw_filled_rect_black (16x9 at x=-5,y=-4; top-left clipping) | 257 | 257 | 0 |
| SYS draw_filled_rect_black (16x9 at x=120,y=60; bottom-right clipping) | 231 | 231 | 0 |
| SYS draw_filled_rect_black (16x9 at x=128,y=11; fully off right) | 45 | 45 | 0 |
| SYS draw_filled_rect_black (16x9 at x=16,y=64; fully off bottom) | 48 | 48 | 0 |
| SYS draw_filled_rect_black (16x9 at x=-16,y=11; fully off left) | 54 | 54 | 0 |
| SYS draw_filled_rect_black (16x9 at x=16,y=-9; fully off top) | 59 | 59 | 0 |
| SYS draw_sprite_overwrite (width=0, height=8; zero-width fast path) | 291 | 291 | 0 |
| SYS draw_sprite_overwrite (width=8, height=0; zero-height fast path) | 293 | 293 | 0 |
| SYS draw_sprite_overwrite (1x1 at x=0,y=0) | 569 | 569 | 0 |
| SYS draw_sprite_overwrite (8x8 at x=40,y=24; aligned) | 677 | 677 | 0 |
| SYS draw_sprite_overwrite (8x8 at x=40,y=27; unaligned) | 676 | 676 | 0 |
| SYS draw_sprite_overwrite (16x9 frame=0 at x=16,y=8; partial final page) | 1196 | 1196 | 0 |
| SYS draw_sprite_overwrite (16x9 frame=1 at x=16,y=11; unaligned) | 1206 | 1206 | 0 |
| SYS draw_sprite_overwrite (16x9 frame=2 at x=16,y=11; later frame) | 1206 | 1206 | 0 |
| SYS draw_sprite_overwrite (16x17 at x=16,y=8; three source pages) | 1523 | 1523 | 0 |
| SYS draw_sprite_overwrite (16x17 at x=16,y=13; unaligned three-page path) | 1522 | 1522 | 0 |
| SYS draw_sprite_overwrite (32x16 at x=48,y=24; medium aligned sprite) | 1722 | 1722 | 0 |
| SYS draw_sprite_overwrite (64x32 at x=32,y=16; large aligned sprite) | 5252 | 5252 | 0 |
| SYS draw_sprite_overwrite (128x64 at x=0,y=0; full-screen sprite) | 19212 | 19212 | 0 |
| SYS draw_sprite_overwrite (16x9 at x=-5,y=11; left clipping) | 1099 | 1099 | 0 |
| SYS draw_sprite_overwrite (16x9 at x=120,y=11; right clipping) | 969 | 969 | 0 |
| SYS draw_sprite_overwrite (16x9 at x=16,y=-4; top clipping) | 1189 | 1189 | 0 |
| SYS draw_sprite_overwrite (16x9 at x=16,y=60; bottom clipping) | 821 | 821 | 0 |
| SYS draw_sprite_overwrite (16x9 at x=-5,y=-4; top-left clipping) | 1089 | 1089 | 0 |
| SYS draw_sprite_overwrite (16x9 at x=120,y=60; bottom-right clipping) | 677 | 677 | 0 |
| SYS draw_sprite_overwrite (16x9 at x=128,y=11; fully off right) | 297 | 297 | 0 |
| SYS draw_sprite_overwrite (16x9 at x=16,y=64; fully off bottom) | 300 | 300 | 0 |
| SYS draw_sprite_overwrite (16x9 at x=-16,y=11; fully off left) | 306 | 306 | 0 |
| SYS draw_sprite_overwrite (16x9 at x=16,y=-9; fully off top) | 312 | 312 | 0 |
| SYS draw_sprite_plus_mask (width=0, height=8; zero-width fast path) | 292 | 292 | 0 |
| SYS draw_sprite_plus_mask (width=8, height=0; zero-height fast path) | 294 | 294 | 0 |
| SYS draw_sprite_plus_mask (1x1 at x=0,y=0) | 565 | 565 | 0 |
| SYS draw_sprite_plus_mask (8x8 at x=40,y=24; aligned) | 807 | 807 | 0 |
| SYS draw_sprite_plus_mask (8x8 at x=40,y=27; unaligned) | 806 | 806 | 0 |
| SYS draw_sprite_plus_mask (16x9 frame=0 at x=16,y=8; partial final page) | 1678 | 1678 | 0 |
| SYS draw_sprite_plus_mask (16x9 frame=1 at x=16,y=11; unaligned) | 1688 | 1688 | 0 |
| SYS draw_sprite_plus_mask (16x9 frame=2 at x=16,y=11; later frame) | 1688 | 1688 | 0 |
| SYS draw_sprite_plus_mask (16x17 at x=16,y=8; three source pages) | 2266 | 2266 | 0 |
| SYS draw_sprite_plus_mask (16x17 at x=16,y=13; unaligned three-page path) | 2265 | 2265 | 0 |
| SYS draw_sprite_plus_mask (32x16 at x=48,y=24; medium aligned sprite) | 2795 | 2795 | 0 |
| SYS draw_sprite_plus_mask (64x32 at x=32,y=16; large aligned sprite) | 9571 | 9571 | 0 |
| SYS draw_sprite_plus_mask (128x64 at x=0,y=0; full-screen sprite) | 36425 | 36425 | 0 |
| SYS draw_sprite_plus_mask (16x9 at x=-5,y=11; left clipping) | 1418 | 1418 | 0 |
| SYS draw_sprite_plus_mask (16x9 at x=120,y=11; right clipping) | 1195 | 1195 | 0 |
| SYS draw_sprite_plus_mask (16x9 at x=16,y=-4; top clipping) | 1657 | 1657 | 0 |
| SYS draw_sprite_plus_mask (16x9 at x=16,y=60; bottom clipping) | 1064 | 1064 | 0 |
| SYS draw_sprite_plus_mask (16x9 at x=-5,y=-4; top-left clipping) | 1403 | 1403 | 0 |
| SYS draw_sprite_plus_mask (16x9 at x=120,y=60; bottom-right clipping) | 792 | 792 | 0 |
| SYS draw_sprite_plus_mask (16x9 at x=128,y=11; fully off right) | 298 | 298 | 0 |
| SYS draw_sprite_plus_mask (16x9 at x=16,y=64; fully off bottom) | 301 | 301 | 0 |
| SYS draw_sprite_plus_mask (16x9 at x=-16,y=11; fully off left) | 307 | 307 | 0 |
| SYS draw_sprite_plus_mask (16x9 at x=16,y=-9; fully off top) | 313 | 313 | 0 |
| SYS draw_sprite_self_masked (width=0, height=8; zero-width fast path) | 291 | 291 | 0 |
| SYS draw_sprite_self_masked (width=8, height=0; zero-height fast path) | 293 | 293 | 0 |
| SYS draw_sprite_self_masked (1x1 at x=0,y=0) | 545 | 545 | 0 |
| SYS draw_sprite_self_masked (8x8 at x=40,y=24; aligned) | 668 | 668 | 0 |
| SYS draw_sprite_self_masked (8x8 at x=40,y=27; unaligned) | 667 | 667 | 0 |
| SYS draw_sprite_self_masked (16x9 frame=0 at x=16,y=8; partial final page) | 1131 | 1131 | 0 |
| SYS draw_sprite_self_masked (16x9 frame=1 at x=16,y=11; unaligned) | 1141 | 1141 | 0 |
| SYS draw_sprite_self_masked (16x9 frame=2 at x=16,y=11; later frame) | 1141 | 1141 | 0 |
| SYS draw_sprite_self_masked (16x17 at x=16,y=8; three source pages) | 1447 | 1447 | 0 |
| SYS draw_sprite_self_masked (16x17 at x=16,y=13; unaligned three-page path) | 1446 | 1446 | 0 |
| SYS draw_sprite_self_masked (32x16 at x=48,y=24; medium aligned sprite) | 1704 | 1704 | 0 |
| SYS draw_sprite_self_masked (64x32 at x=32,y=16; large aligned sprite) | 5216 | 5216 | 0 |
| SYS draw_sprite_self_masked (128x64 at x=0,y=0; full-screen sprite) | 19142 | 19142 | 0 |
| SYS draw_sprite_self_masked (16x9 at x=-5,y=11; left clipping) | 1040 | 1040 | 0 |
| SYS draw_sprite_self_masked (16x9 at x=120,y=11; right clipping) | 920 | 920 | 0 |
| SYS draw_sprite_self_masked (16x9 at x=16,y=-4; top clipping) | 1126 | 1126 | 0 |
| SYS draw_sprite_self_masked (16x9 at x=16,y=60; bottom clipping) | 805 | 805 | 0 |
| SYS draw_sprite_self_masked (16x9 at x=-5,y=-4; top-left clipping) | 1036 | 1036 | 0 |
| SYS draw_sprite_self_masked (16x9 at x=120,y=60; bottom-right clipping) | 661 | 661 | 0 |
| SYS draw_sprite_self_masked (16x9 at x=128,y=11; fully off right) | 297 | 297 | 0 |
| SYS draw_sprite_self_masked (16x9 at x=16,y=64; fully off bottom) | 300 | 300 | 0 |
| SYS draw_sprite_self_masked (16x9 at x=-16,y=11; fully off left) | 306 | 306 | 0 |
| SYS draw_sprite_self_masked (16x9 at x=16,y=-9; fully off top) | 312 | 312 | 0 |
| SYS draw_sprite_erase (width=0, height=8; zero-width fast path) | 291 | 291 | 0 |
| SYS draw_sprite_erase (width=8, height=0; zero-height fast path) | 293 | 293 | 0 |
| SYS draw_sprite_erase (1x1 at x=0,y=0) | 546 | 546 | 0 |
| SYS draw_sprite_erase (8x8 at x=40,y=24; aligned) | 676 | 676 | 0 |
| SYS draw_sprite_erase (8x8 at x=40,y=27; unaligned) | 675 | 675 | 0 |
| SYS draw_sprite_erase (16x9 frame=0 at x=16,y=8; partial final page) | 1163 | 1163 | 0 |
| SYS draw_sprite_erase (16x9 frame=1 at x=16,y=11; unaligned) | 1173 | 1173 | 0 |
| SYS draw_sprite_erase (16x9 frame=2 at x=16,y=11; later frame) | 1173 | 1173 | 0 |
| SYS draw_sprite_erase (16x17 at x=16,y=8; three source pages) | 1495 | 1495 | 0 |
| SYS draw_sprite_erase (16x17 at x=16,y=13; unaligned three-page path) | 1494 | 1494 | 0 |
| SYS draw_sprite_erase (32x16 at x=48,y=24; medium aligned sprite) | 1768 | 1768 | 0 |
| SYS draw_sprite_erase (64x32 at x=32,y=16; large aligned sprite) | 5472 | 5472 | 0 |
| SYS draw_sprite_erase (128x64 at x=0,y=0; full-screen sprite) | 19910 | 19910 | 0 |
| SYS draw_sprite_erase (16x9 at x=-5,y=11; left clipping) | 1062 | 1062 | 0 |
| SYS draw_sprite_erase (16x9 at x=120,y=11; right clipping) | 936 | 936 | 0 |
| SYS draw_sprite_erase (16x9 at x=16,y=-4; top clipping) | 1126 | 1126 | 0 |
| SYS draw_sprite_erase (16x9 at x=16,y=60; bottom clipping) | 789 | 789 | 0 |
| SYS draw_sprite_erase (16x9 at x=-5,y=-4; top-left clipping) | 1036 | 1036 | 0 |
| SYS draw_sprite_erase (16x9 at x=120,y=60; bottom-right clipping) | 653 | 653 | 0 |
| SYS draw_sprite_erase (16x9 at x=128,y=11; fully off right) | 297 | 297 | 0 |
| SYS draw_sprite_erase (16x9 at x=16,y=64; fully off bottom) | 300 | 300 | 0 |
| SYS draw_sprite_erase (16x9 at x=-16,y=11; fully off left) | 306 | 306 | 0 |
| SYS draw_sprite_erase (16x9 at x=16,y=-9; fully off top) | 312 | 312 | 0 |
| SYS set_sprite (16x9 multi-frame sprite) | 273 | 273 | 0 |
| SYS draw_overwrite (width=0, height=8; zero-width fast path) | 184 | 184 | 0 |
| SYS draw_overwrite (width=8, height=0; zero-height fast path) | 186 | 186 | 0 |
| SYS draw_overwrite (1x1 at x=0,y=0) | 462 | 462 | 0 |
| SYS draw_overwrite (8x8 at x=40,y=24; aligned) | 570 | 570 | 0 |
| SYS draw_overwrite (8x8 at x=40,y=27; unaligned) | 569 | 569 | 0 |
| SYS draw_overwrite (16x9 frame=0 at x=16,y=8; partial final page) | 1089 | 1089 | 0 |
| SYS draw_overwrite (16x9 frame=1 at x=16,y=11; unaligned) | 1099 | 1099 | 0 |
| SYS draw_overwrite (16x9 frame=2 at x=16,y=11; later frame) | 1099 | 1099 | 0 |
| SYS draw_overwrite (16x17 at x=16,y=8; three source pages) | 1416 | 1416 | 0 |
| SYS draw_overwrite (16x17 at x=16,y=13; unaligned three-page path) | 1415 | 1415 | 0 |
| SYS draw_overwrite (32x16 at x=48,y=24; medium aligned sprite) | 1615 | 1615 | 0 |
| SYS draw_overwrite (64x32 at x=32,y=16; large aligned sprite) | 5145 | 5145 | 0 |
| SYS draw_overwrite (128x64 at x=0,y=0; full-screen sprite) | 19105 | 19105 | 0 |
| SYS draw_overwrite (16x9 at x=-5,y=11; left clipping) | 992 | 992 | 0 |
| SYS draw_overwrite (16x9 at x=120,y=11; right clipping) | 862 | 862 | 0 |
| SYS draw_overwrite (16x9 at x=16,y=-4; top clipping) | 1082 | 1082 | 0 |
| SYS draw_overwrite (16x9 at x=16,y=60; bottom clipping) | 714 | 714 | 0 |
| SYS draw_overwrite (16x9 at x=-5,y=-4; top-left clipping) | 982 | 982 | 0 |
| SYS draw_overwrite (16x9 at x=120,y=60; bottom-right clipping) | 570 | 570 | 0 |
| SYS draw_overwrite (16x9 at x=128,y=11; fully off right) | 190 | 190 | 0 |
| SYS draw_overwrite (16x9 at x=16,y=64; fully off bottom) | 193 | 193 | 0 |
| SYS draw_overwrite (16x9 at x=-16,y=11; fully off left) | 199 | 199 | 0 |
| SYS draw_overwrite (16x9 at x=16,y=-9; fully off top) | 205 | 205 | 0 |
| SYS draw_plus_mask (width=0, height=8; zero-width fast path) | 185 | 185 | 0 |
| SYS draw_plus_mask (width=8, height=0; zero-height fast path) | 187 | 187 | 0 |
| SYS draw_plus_mask (1x1 at x=0,y=0) | 458 | 458 | 0 |
| SYS draw_plus_mask (8x8 at x=40,y=24; aligned) | 700 | 700 | 0 |
| SYS draw_plus_mask (8x8 at x=40,y=27; unaligned) | 699 | 699 | 0 |
| SYS draw_plus_mask (16x9 frame=0 at x=16,y=8; partial final page) | 1571 | 1571 | 0 |
| SYS draw_plus_mask (16x9 frame=1 at x=16,y=11; unaligned) | 1581 | 1581 | 0 |
| SYS draw_plus_mask (16x9 frame=2 at x=16,y=11; later frame) | 1581 | 1581 | 0 |
| SYS draw_plus_mask (16x17 at x=16,y=8; three source pages) | 2159 | 2159 | 0 |
| SYS draw_plus_mask (16x17 at x=16,y=13; unaligned three-page path) | 2158 | 2158 | 0 |
| SYS draw_plus_mask (32x16 at x=48,y=24; medium aligned sprite) | 2688 | 2688 | 0 |
| SYS draw_plus_mask (64x32 at x=32,y=16; large aligned sprite) | 9464 | 9464 | 0 |
| SYS draw_plus_mask (128x64 at x=0,y=0; full-screen sprite) | 36318 | 36318 | 0 |
| SYS draw_plus_mask (16x9 at x=-5,y=11; left clipping) | 1311 | 1311 | 0 |
| SYS draw_plus_mask (16x9 at x=120,y=11; right clipping) | 1088 | 1088 | 0 |
| SYS draw_plus_mask (16x9 at x=16,y=-4; top clipping) | 1550 | 1550 | 0 |
| SYS draw_plus_mask (16x9 at x=16,y=60; bottom clipping) | 957 | 957 | 0 |
| SYS draw_plus_mask (16x9 at x=-5,y=-4; top-left clipping) | 1296 | 1296 | 0 |
| SYS draw_plus_mask (16x9 at x=120,y=60; bottom-right clipping) | 685 | 685 | 0 |
| SYS draw_plus_mask (16x9 at x=128,y=11; fully off right) | 191 | 191 | 0 |
| SYS draw_plus_mask (16x9 at x=16,y=64; fully off bottom) | 194 | 194 | 0 |
| SYS draw_plus_mask (16x9 at x=-16,y=11; fully off left) | 200 | 200 | 0 |
| SYS draw_plus_mask (16x9 at x=16,y=-9; fully off top) | 206 | 206 | 0 |
| SYS draw_self_masked (width=0, height=8; zero-width fast path) | 184 | 184 | 0 |
| SYS draw_self_masked (width=8, height=0; zero-height fast path) | 186 | 186 | 0 |
| SYS draw_self_masked (1x1 at x=0,y=0) | 438 | 438 | 0 |
| SYS draw_self_masked (8x8 at x=40,y=24; aligned) | 561 | 561 | 0 |
| SYS draw_self_masked (8x8 at x=40,y=27; unaligned) | 560 | 560 | 0 |
| SYS draw_self_masked (16x9 frame=0 at x=16,y=8; partial final page) | 1024 | 1024 | 0 |
| SYS draw_self_masked (16x9 frame=1 at x=16,y=11; unaligned) | 1034 | 1034 | 0 |
| SYS draw_self_masked (16x9 frame=2 at x=16,y=11; later frame) | 1034 | 1034 | 0 |
| SYS draw_self_masked (16x17 at x=16,y=8; three source pages) | 1340 | 1340 | 0 |
| SYS draw_self_masked (16x17 at x=16,y=13; unaligned three-page path) | 1339 | 1339 | 0 |
| SYS draw_self_masked (32x16 at x=48,y=24; medium aligned sprite) | 1597 | 1597 | 0 |
| SYS draw_self_masked (64x32 at x=32,y=16; large aligned sprite) | 5109 | 5109 | 0 |
| SYS draw_self_masked (128x64 at x=0,y=0; full-screen sprite) | 19035 | 19035 | 0 |
| SYS draw_self_masked (16x9 at x=-5,y=11; left clipping) | 933 | 933 | 0 |
| SYS draw_self_masked (16x9 at x=120,y=11; right clipping) | 813 | 813 | 0 |
| SYS draw_self_masked (16x9 at x=16,y=-4; top clipping) | 1019 | 1019 | 0 |
| SYS draw_self_masked (16x9 at x=16,y=60; bottom clipping) | 698 | 698 | 0 |
| SYS draw_self_masked (16x9 at x=-5,y=-4; top-left clipping) | 929 | 929 | 0 |
| SYS draw_self_masked (16x9 at x=120,y=60; bottom-right clipping) | 554 | 554 | 0 |
| SYS draw_self_masked (16x9 at x=128,y=11; fully off right) | 190 | 190 | 0 |
| SYS draw_self_masked (16x9 at x=16,y=64; fully off bottom) | 193 | 193 | 0 |
| SYS draw_self_masked (16x9 at x=-16,y=11; fully off left) | 199 | 199 | 0 |
| SYS draw_self_masked (16x9 at x=16,y=-9; fully off top) | 205 | 205 | 0 |
| SYS draw_erase (width=0, height=8; zero-width fast path) | 184 | 184 | 0 |
| SYS draw_erase (width=8, height=0; zero-height fast path) | 186 | 186 | 0 |
| SYS draw_erase (1x1 at x=0,y=0) | 439 | 439 | 0 |
| SYS draw_erase (8x8 at x=40,y=24; aligned) | 569 | 569 | 0 |
| SYS draw_erase (8x8 at x=40,y=27; unaligned) | 568 | 568 | 0 |
| SYS draw_erase (16x9 frame=0 at x=16,y=8; partial final page) | 1056 | 1056 | 0 |
| SYS draw_erase (16x9 frame=1 at x=16,y=11; unaligned) | 1066 | 1066 | 0 |
| SYS draw_erase (16x9 frame=2 at x=16,y=11; later frame) | 1066 | 1066 | 0 |
| SYS draw_erase (16x17 at x=16,y=8; three source pages) | 1388 | 1388 | 0 |
| SYS draw_erase (16x17 at x=16,y=13; unaligned three-page path) | 1387 | 1387 | 0 |
| SYS draw_erase (32x16 at x=48,y=24; medium aligned sprite) | 1661 | 1661 | 0 |
| SYS draw_erase (64x32 at x=32,y=16; large aligned sprite) | 5365 | 5365 | 0 |
| SYS draw_erase (128x64 at x=0,y=0; full-screen sprite) | 19803 | 19803 | 0 |
| SYS draw_erase (16x9 at x=-5,y=11; left clipping) | 955 | 955 | 0 |
| SYS draw_erase (16x9 at x=120,y=11; right clipping) | 829 | 829 | 0 |
| SYS draw_erase (16x9 at x=16,y=-4; top clipping) | 1019 | 1019 | 0 |
| SYS draw_erase (16x9 at x=16,y=60; bottom clipping) | 682 | 682 | 0 |
| SYS draw_erase (16x9 at x=-5,y=-4; top-left clipping) | 929 | 929 | 0 |
| SYS draw_erase (16x9 at x=120,y=60; bottom-right clipping) | 546 | 546 | 0 |
| SYS draw_erase (16x9 at x=128,y=11; fully off right) | 190 | 190 | 0 |
| SYS draw_erase (16x9 at x=16,y=64; fully off bottom) | 193 | 193 | 0 |
| SYS draw_erase (16x9 at x=-16,y=11; fully off left) | 199 | 199 | 0 |
| SYS draw_erase (16x9 at x=16,y=-9; fully off top) | 205 | 205 | 0 |
| RET | 114 | 114 | 0 |
