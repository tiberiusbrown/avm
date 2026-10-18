# CSET size and performance comparison

Baseline: commit `b5fe42f`, with the 480-byte F8 executable table. Candidate: the shared runtime CSET decoder with a local dispatch tail. Hexadecimal formatting is unchanged.

Measurements use the repository benchmark runner, the same guest images, and the 16 MHz interpreter configuration. Baseline firmware and all three timing files are retained under ignored `build/cset-baseline/`. All cycle deltas are after minus before; positive percentages mean slower execution.

## Summary

| Metric | Before | After | Difference |
| --- | ---: | ---: | ---: |
| Default firmware bytes | 29,472 | 29,056 | -416 (-1.4115%) |
| Free bytes below 29,696-byte ceiling | 224 | 640 | +416 |
| CSET, every condition/register/outcome | 38 cycles | 41 cycles | +3 (+7.8947%) |
| Other instruction/SYS measurements | 1006 | 1006 | 0 cycles (0%) |

The sum of C benchmark cycles changes from **137,601,734 to 137,652,401**, a difference of **+50,667 cycles (+0.036821%)**.
The sum of C++ benchmark cycles changes from **4,673,663 to 4,673,663**, a difference of **+0 cycles (+0.000000%)**.

Summed figures describe this fixed suite. Application impact depends on the number of CSET instructions executed.
Of the 78 C benchmarks, 13 change and 65 are unchanged. All five C++ benchmarks are unchanged. The largest individual increase is **+15,360 cycles (+1.1895%)** in `byte_comparisons.c`.

## Implementation and tradeoff

The 480-byte table is replaced by a 64-byte decoder/dispatch. The fixed four-word F8 primary slot reads architectural flags, selects Z in native T, and clears XH. The decoder performs the protected reverse SPI handoff at cycle 17, rejects secondary values 0x30..0xff, selects C or S when needed, applies inversion, and writes a zero-extended result through the register-file pointer. Flag selection and inversion take equal time for either bit value.

A 48-byte decoder sharing the existing dispatch tail saved 432 bytes but cost 43 cycles per CSET. The selected version spends 16 additional bytes to inline dispatch and remove two cycles per instruction. For the same guest images, this reduces the worst C regression from 25,600 cycles (1.9825%) to 15,360 cycles (1.1895%).

## Instruction/SYS benchmark differences

All six CSET conditions have the same change on true and false paths. The other 1006 instruction/SYS measurements are byte-for-byte identical in the timing output.

| Benchmark | Before cycles | After cycles | Delta cycles | Delta % |
| --- | ---: | ---: | ---: | ---: |
| `CSET.EQ r0 (true)` | 38 | 41 | +3 | +7.8947% |
| `CSET.EQ r0 (false)` | 38 | 41 | +3 | +7.8947% |
| `CSET.NE r0 (true)` | 38 | 41 | +3 | +7.8947% |
| `CSET.NE r0 (false)` | 38 | 41 | +3 | +7.8947% |
| `CSET.ULT r0 (true)` | 38 | 41 | +3 | +7.8947% |
| `CSET.ULT r0 (false)` | 38 | 41 | +3 | +7.8947% |
| `CSET.UGE r0 (true)` | 38 | 41 | +3 | +7.8947% |
| `CSET.UGE r0 (false)` | 38 | 41 | +3 | +7.8947% |
| `CSET.SLT r0 (true)` | 38 | 41 | +3 | +7.8947% |
| `CSET.SLT r0 (false)` | 38 | 41 | +3 | +7.8947% |
| `CSET.SGE r0 (true)` | 38 | 41 | +3 | +7.8947% |
| `CSET.SGE r0 (false)` | 38 | 41 | +3 | +7.8947% |

## Complete C benchmark results

| Benchmark | Before cycles | After cycles | Delta cycles | Delta % |
| --- | ---: | ---: | ---: | ---: |
| `aggregate_args.c` | 2,495,089 | 2,496,049 | +960 | +0.0385% |
| `aggregate_return.c` | 1,953,666 | 1,955,202 | +1,536 | +0.0786% |
| `aliasing.c` | 2,094,135 | 2,094,135 | +0 | +0.0000% |
| `bit_count.c` | 1,850,355 | 1,850,355 | +0 | +0.0000% |
| `bitfields.c` | 1,695,785 | 1,695,785 | +0 | +0.0000% |
| `bubble1.c` | 1,316,321 | 1,316,321 | +0 | +0.0000% |
| `bubble2.c` | 1,163,105 | 1,163,105 | +0 | +0.0000% |
| `bubble4.c` | 1,785,131 | 1,785,131 | +0 | +0.0000% |
| `byte_comparisons.c` | 1,291,271 | 1,306,631 | +15,360 | +1.1895% |
| `call_args.c` | 256,247 | 256,247 | +0 | +0.0000% |
| `constant_arith.c` | 7,306,132 | 7,306,132 | +0 | +0.0000% |
| `count_leading_zeros.c` | 724,156 | 724,156 | +0 | +0.0000% |
| `count_trailing_zeros.c` | 582,616 | 582,616 | +0 | +0.0000% |
| `crc16.c` | 526,194 | 526,194 | +0 | +0.0000% |
| `div_pow2.c` | 1,737,578 | 1,737,578 | +0 | +0.0000% |
| `divmod.c` | 1,063,814 | 1,065,446 | +1,632 | +0.1534% |
| `draw_text.c` | 18,717 | 18,717 | +0 | +0.0000% |
| `draw_text_P.c` | 20,825 | 20,825 | +0 | +0.0000% |
| `dynamic_stack.c` | 739,468 | 739,468 | +0 | +0.0000% |
| `fibonacci.c` | 236,880 | 236,880 | +0 | +0.0000% |
| `fir8.c` | 5,948,825 | 5,948,825 | +0 | +0.0000% |
| `fixed_point.c` | 11,790,092 | 11,802,380 | +12,288 | +0.1042% |
| `float.c` | 930,848 | 930,848 | +0 | +0.0000% |
| `float_comparisons.c` | 1,073,610 | 1,078,218 | +4,608 | +0.4292% |
| `float_conversions.c` | 712,588 | 712,588 | +0 | +0.0000% |
| `indirect_call.c` | 84,966 | 84,966 | +0 | +0.0000% |
| `loop_control.c` | 11,045,125 | 11,045,125 | +0 | +0.0000% |
| `loop_shapes.c` | 3,413,880 | 3,413,880 | +0 | +0.0000% |
| `memory_services.c` | 18,337 | 18,337 | +0 | +0.0000% |
| `mixed_width.c` | 3,214,724 | 3,217,796 | +3,072 | +0.0956% |
| `multiply.c` | 923,080 | 923,080 | +0 | +0.0000% |
| `narrow_arithmetic.c` | 1,193,770 | 1,193,770 | +0 | +0.0000% |
| `packed_fields.c` | 963,413 | 963,413 | +0 | +0.0000% |
| `pointer_table.c` | 286,671 | 286,671 | +0 | +0.0000% |
| `pointer_walk.c` | 930,675 | 930,675 | +0 | +0.0000% |
| `popcount.c` | 387,686 | 387,686 | +0 | +0.0000% |
| `progmem_walk.c` | 2,971,012 | 2,971,012 | +0 | +0.0000% |
| `progmem_widen_ldp16.c` | 545,522 | 545,522 | +0 | +0.0000% |
| `progmem_widen_ldp32_bytes.c` | 738,473 | 738,473 | +0 | +0.0000% |
| `progmem_widen_ldp32_words.c` | 545,548 | 545,548 | +0 | +0.0000% |
| `record_scan.c` | 1,444,736 | 1,444,736 | +0 | +0.0000% |
| `reverse_walk.c` | 1,921,658 | 1,921,658 | +0 | +0.0000% |
| `rotate32.c` | 4,932,237 | 4,932,237 | +0 | +0.0000% |
| `saturating_math.c` | 3,884,489 | 3,888,329 | +3,840 | +0.0989% |
| `select.c` | 718,161 | 718,161 | +0 | +0.0000% |
| `shifts.c` | 518,677 | 518,677 | +0 | +0.0000% |
| `short_circuit.c` | 1,830,484 | 1,830,484 | +0 | +0.0000% |
| `sieve.c` | 377,189 | 377,189 | +0 | +0.0000% |
| `small_memops.c` | 322,354 | 322,354 | +0 | +0.0000% |
| `stack_array.c` | 266,996 | 266,996 | +0 | +0.0000% |
| `stack_frames.c` | 2,555,871 | 2,555,871 | +0 | +0.0000% |
| `state_machine.c` | 7,138,844 | 7,138,844 | +0 | +0.0000% |
| `string_scan.c` | 25,938,065 | 25,938,065 | +0 | +0.0000% |
| `struct_copy.c` | 485,357 | 485,357 | +0 | +0.0000% |
| `switch.c` | 950,957 | 950,957 | +0 | +0.0000% |
| `sys_memcmp.c` | 2,876 | 2,876 | +0 | +0.0000% |
| `sys_memcmp_p.c` | 5,285 | 5,285 | +0 | +0.0000% |
| `sys_strcmp.c` | 2,524 | 2,524 | +0 | +0.0000% |
| `sys_strcmp_p.c` | 5,402 | 5,402 | +0 | +0.0000% |
| `sys_strlen.c` | 2,138 | 2,138 | +0 | +0.0000% |
| `sys_strlen_p.c` | 7,020 | 7,020 | +0 | +0.0000% |
| `sys_strncat.c` | 2,202 | 2,202 | +0 | +0.0000% |
| `sys_strncat_p.c` | 3,480 | 3,480 | +0 | +0.0000% |
| `sys_strncpy.c` | 2,072 | 2,072 | +0 | +0.0000% |
| `sys_strncpy_p.c` | 3,536 | 3,536 | +0 | +0.0000% |
| `tail_calls.c` | 487,471 | 487,471 | +0 | +0.0000% |
| `text.c` | 51,421 | 51,421 | +0 | +0.0000% |
| `tilesrect.c` | 42,482 | 42,482 | +0 | +0.0000% |
| `tilessprite.c` | 90,796 | 90,796 | +0 | +0.0000% |
| `tilessprite16.c` | 37,912 | 37,912 | +0 | +0.0000% |
| `tilessprite16_cached.c` | 34,724 | 34,724 | +0 | +0.0000% |
| `tilessprite_cached.c` | 77,336 | 77,336 | +0 | +0.0000% |
| `volatile_rmw.c` | 502,025 | 502,025 | +0 | +0.0000% |
| `wide_add_sub.c` | 534,349 | 535,885 | +1,536 | +0.2875% |
| `wide_compare.c` | 1,189,630 | 1,193,470 | +3,840 | +0.3228% |
| `wide_divmod.c` | 3,224,131 | 3,225,118 | +987 | +0.0306% |
| `wide_mul.c` | 880,158 | 881,118 | +960 | +0.1091% |
| `wide_shifts.c` | 550,359 | 550,407 | +48 | +0.0087% |

## Complete C++ benchmark results

| Benchmark | Before cycles | After cycles | Delta cycles | Delta % |
| --- | ---: | ---: | ---: | ---: |
| `lambda_capture.cpp` | 1,085,160 | 1,085,160 | +0 | +0.0000% |
| `member_pointers.cpp` | 386,951 | 386,951 | +0 | +0.0000% |
| `scoped_lifetime.cpp` | 641,176 | 641,176 | +0 | +0.0000% |
| `template_specialization.cpp` | 1,861,909 | 1,861,909 | +0 | +0.0000% |
| `virtual_dispatch.cpp` | 698,467 | 698,467 | +0 | +0.0000% |

[Complete machine-readable comparison, including all 1018 instruction/SYS cases](cset-benchmarks.csv).

## Validation

- All 471 AVM assembly/C/C++ tests pass.
- Native CSET checks pass for 49,152 valid condition/register/flag/PC combinations and 1,664 invalid-encoding cases. Every valid case takes exactly 41 cycles, including byte/word PC carries and 24-bit wraparound.
- All 285 LLVM AVM CodeGen/MC tests pass, including the updated 41-cycle scheduling model for all six CSET conditions.
- SHA256 checks confirm all 87 saved benchmark images are byte-identical to the baseline after rebuilding the compiler. The final regenerated instruction, C, and C++ timing files exactly match this report's candidate measurements.
- Existing native checks pass: 152 PUSH/POP cases, 1,133 stack-bound cases, 88 display preservation/sequencing cases per controller, 46 formatter cases, four exact atan2 rounding cases, and 27 audio cases. MINI and FXC firmware variants build successfully.

The audio ISR remains 178–185 cycles, atomic chord commit remains 120 cycles, and the interrupt/formatter stress test still uses 41 bytes of native stack. The default firmware and generated packages have been rebuilt. Hexadecimal formatting is unchanged.
