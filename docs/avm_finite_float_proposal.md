# AVM Finite-Normal, Correctly Rounded Floating-Point Profile

**Status:** Design proposal  
**Scope:** AVM binary32 arithmetic, AVR interpreter implementation, LLVM/Clang lowering, optional runtime helpers, tests, and documentation  
**Primary objective:** Obtain most of the performance benefit of ABC's simplified floating-point implementation while retaining correctly rounded ordinary finite-normal `FADD`, `FSUB`, and `FMUL` results and a compiler contract LLVM can model directly.

---

## 1. Final recommendation

AVM should adopt one mandatory direct-instruction floating-point profile:

- Binary32 retains the standard IEEE-754 **storage representation**.
- Direct `FADD`, `FSUB`, and `FMUL` support finite normal operands and arithmetic zero.
- Subnormal inputs are treated as positive zero (**DAZ**).
- Subnormal outputs are flushed to positive zero (**FTZ**).
- Arithmetic does not preserve or distinguish signed zero.
- Supported nonzero normal results are rounded using **round-to-nearest, ties-to-even**.
- NaN and infinity arithmetic is unsupported.
- Finite overflow has no canonical result. It is left as the **arbitrary natural packed result** of the simplified implementation.
- Floating-point exception flags, traps, and dynamic rounding modes are unsupported.
- Direct AVM instructions will never provide a full IEEE-compliant mode.
- Full IEEE behavior, if ever supported, must be supplied by optional software runtime helpers generated or provided with LLVM/Compiler-RT rather than by the interpreter's direct instructions.

The corresponding LLVM contract is:

```text
Fast-math assumptions on direct arithmetic: nnan ninf nsz
Float denormal environment:                 positivezero | positivezero
Rounding for supported normal results:      round-to-nearest, ties-to-even
Floating-point exceptions:                  ignored / unobservable
```

This is deliberately narrower than `-ffast-math`. It does **not** inherently enable reassociation, reciprocal replacement, approximate elementary functions, contraction, or other unrelated transformations.

### 1.1 Why positive zero is the fastest choice

The recommended combination is:

```text
DAZ = positive zero
FTZ = positive zero
nsz = enabled
```

This permits the interpreter to:

- Treat every exponent-zero operand as the same arithmetic zero without examining its fraction or sign.
- Return one canonical `0x00000000` result for exact cancellation, zero operands, and underflow.
- Avoid sign XOR or sign restoration on zero multiplication results.
- Avoid distinguishing a stored `-0` from a negative subnormal.
- Use one short positive-zero helper instead of signed and unsigned zero paths.

`positivezero` without `nsz` would still require distinguishing a true `-0` from a negative subnormal in some contexts. `preservesign` would retain extra sign selection in zero, cancellation, multiplication, and underflow paths. Neither is desirable for the performance-oriented AVM profile.

---

## 2. Normative arithmetic model

### 2.1 Representation and ABI

AVM `float` remains a 32-bit binary32 bit pattern:

```text
bit 31       sign
bits 30:23   exponent
bits 22:0    fraction
```

The proposal changes arithmetic semantics, not representation:

- `float` remains four bytes.
- q-register argument and result placement is unchanged.
- Stack layout and alignment are unchanged.
- Loads, stores, integer bit operations, unions, serialization, and debugging retain raw binary32 encodings.
- NaN, infinity, subnormal, and negative-zero bit patterns may exist in memory or be created through bit manipulation even though direct arithmetic does not support their IEEE meanings.

### 2.2 Supported direct-arithmetic domain

The supported domain for direct `FADD`, `FSUB`, and `FMUL` consists of:

- finite normal inputs;
- either zero encoding, with the sign ignored;
- results that are exactly zero, flush to zero, or round to a finite nonzero normal value.

Within that domain, every nonzero normal result must be bit-identical to exact arithmetic rounded to nearest, ties to even.

The following are outside the direct-instruction contract:

- NaN input or result;
- infinity input or result;
- finite overflow;
- dependence on the sign of zero;
- gradual underflow;
- dynamic rounding modes;
- observable floating-point status flags or traps.

### 2.3 Denormal inputs: DAZ

Any operand whose encoded exponent is zero is treated as arithmetic positive zero. The fraction and sign do not need to be inspected.

This includes:

- `+0`;
- `-0`;
- positive subnormals;
- negative subnormals.

### 2.4 Denormal outputs: FTZ

If a supported finite calculation would produce a subnormal result after correct rounding, the direct instruction returns:

```text
0x00000000
```

No gradual-underflow shift or subnormal pack is performed.

### 2.5 Correct rounding

For every supported nonzero normal result, `FADD`, `FSUB`, and `FMUL` use:

```text
round-to-nearest, ties-to-even
```

The implementation must retain enough guard, round, sticky, and carry information to distinguish:

- below halfway;
- exactly halfway with an even retained LSB;
- exactly halfway with an odd retained LSB;
- above halfway.

AVM therefore does **not** adopt ABC's no-rounding shortcut.

### 2.6 Overflow: arbitrary natural result

Finite overflow is outside the supported domain. The interpreter must not spend code or cycles canonicalizing overflow to infinity, NaN, maximum finite, or any other defined value.

The result is the natural value produced by the implementation's ordinary exponent arithmetic, significand packing, and rounding sequence after explicit overflow handling has been removed. Depending on the exact path and future implementation changes, that value may resemble:

- an infinity encoding;
- a NaN encoding;
- a wrapped finite value;
- zero;
- another arbitrary bit pattern.

No particular result is specified, stable, or testable as an architectural requirement. Assembly tests may execute overflow cases for safety and cycle measurement, but must not assert result bits.

The interpreter should specifically remove branches whose sole purpose is to jump to `__fp_inf` for finite add or multiply overflow. It should allow the exponent and packed representation to evolve naturally.

### 2.7 NaN and infinity

Direct arithmetic performs no NaN or infinity classification, propagation, quieting, or invalid-operation handling. An exponent of `0xFF` is simply outside the supported input contract.

`FCLASS`, raw loads/stores, and integer bit manipulation may continue to recognize or preserve those encodings. That does not make them supported arithmetic values.

### 2.8 Zero results

Every arithmetic zero result may be canonicalized to:

```text
+0 = 0x00000000
```

This applies to:

- zero operands;
- exact cancellation;
- multiplication by arithmetic zero;
- flushed underflow.

`FNEG`, `FABS`, `FCLASS`, loads, stores, and bitwise code may still expose raw negative zero. Its sign becomes insignificant when consumed by direct arithmetic.

### 2.9 Floating-point environment

AVM direct instructions provide only:

```text
rounding:   round-to-nearest, ties-to-even
exceptions: ignored and unobservable
```

AVM does not provide:

- dynamic rounding modes;
- floating-point status flags;
- trapping exceptions;
- signaling-NaN semantics;
- an architectural IEEE mode switch.

---

## 3. Scope of the first implementation

The first implementation should replace the direct helper implementations for:

- `FADD`;
- `FSUB`;
- `FMUL`.

The current implementations of `FDIV`, `FSQRT`, conversions, `FMIN`, `FMAX`, `FCMP`, `FCLASS`, and integral rounding may remain temporarily. Any IEEE-like edge behavior they happen to retain is incidental unless separately specified.

Full IEEE semantics must never become a requirement of the direct ISA instructions. If LLVM needs stricter behavior for any operation, it must use an optional runtime helper or reject the operation.

---

## 4. Current AVR interpreter structure

The current `interp(23).asm` implementation has three relevant layers.

### 4.1 FF decoding and helper selection

`ff_decode` performs the fixed SPI cadence and preloads the low byte of `ff_binary_helper_targets`. `ff_binary_arithmetic` extracts the operation number, distinguishes arithmetic from direct `FMIN`/`FMAX`, loads the selected helper address, and jumps to `ff_bridge_binary_q_to_q`.

The existing compact table is:

```asm
ff_binary_helper_targets:
    .word pm(__addsf3)
    .word pm(__subsf3)
    .word pm(__mulsf3)
    .word pm(__divsf3)
```

The finite-profile implementation can preserve the decoder and bridge unchanged and replace only the first three table targets.

### 4.2 q-register bridge

`ff_bridge_binary_q_to_q`:

- chooses a destination-specific save class;
- saves the architectural registers overlapping the helper ABI;
- enters one of sixteen alias-safe marshalling slots;
- places operand A/result in `r22-r25`;
- places operand B in `r18-r21`;
- calls the selected helper;
- writes the result to qD and restores saved registers.

This bridge cost is independent of IEEE edge semantics. The finite-profile arithmetic work should initially keep this ABI so the semantic rewrite can be validated separately from bridge optimization.

### 4.3 Embedded arithmetic register convention

The current add and multiply cores use:

```text
A/result packed value      r22:r23:r24:r25
B packed value             r18:r19:r20:r21
A extension / guard        r27
B extension                r26
saved sign / scratch       r30
sticky / low product       r31 (and r30 where needed)
ZERO constant              r2
```

This is already suitable for a finite-normal implementation. The primary savings come from removing classification, subnormal normalization, gradual underflow, canonical infinity generation, and general normalization loops.

---

## 5. Specific assembly-level implementation strategy

## 5.1 Add new finite-profile helper entry points

Create dedicated entries, for example:

```asm
__avm_fadd_finite
__avm_fsub_finite
__avm_fmul_finite
```

or retain the public names `__addsf3`, `__subsf3`, and `__mulsf3` if every in-interpreter caller is intended to adopt the new profile.

Update the first three entries of `ff_binary_helper_targets`; leave `__divsf3` unchanged during the first phase.

Using separate names during development is safer because it permits differential testing against the existing routines. Once validated, the old add/sub/mul closure can be deleted if no SYS routine or optional runtime path references it.

## 5.2 Preserve the current decoder cadence

Do not alter the five pre-handoff instructions in `ff_decode` merely to optimize arithmetic. They are positioned to satisfy the reverse SPI transfer cadence. In particular, the current preload:

```asm
ldi r30, lo8(ff_binary_helper_targets)
```

is useful work occupying a cadence slot and should remain unless helper selection is redesigned as a separate optimization.

The finite-profile work begins after the operands have been marshalled into the helper ABI.

## 5.3 Inline a finite-only split

The current `__fp_split3` does all of the following:

- sign extraction;
- exponent extraction;
- zero versus subnormal handling;
- implicit-bit restoration;
- exponent-`0xFF` detection;
- nonfinite signaling through carry;
- preparation for `__fp_pscA`/`__fp_pscB` special-case closures.

The finite-profile helper needs only:

1. Extract the effective signs needed for add/sub or sign XOR for multiply.
2. Extract each exponent.
3. If an exponent is zero, treat that operand as canonical arithmetic zero.
4. Otherwise restore the implicit leading significand bit.
5. Never test exponent `0xFF`.

The current split sequence relies on `CPI exponent, 0xFF` setting carry before `ROR` restores the implicit bit. Removing that compare requires an explicit `SEC` before the restoring `ROR` on a nonzero exponent path.

Conceptually, each normal operand becomes:

```asm
; Packed top bytes are shifted to extract the exponent.
add   frac_hi, frac_hi
adc   exponent, exponent
breq  operand_is_zero       ; exponent zero => +0, fraction ignored
sec                          ; restore implicit leading one
ror   frac_hi
```

This sequence should be inlined into `FADD`/`FSUB` and `FMUL`. A shared finite splitter would save less code but retain `RCALL`/`RET`; benchmarking should decide whether the duplicated short sequence is worthwhile.

### Zero representation inside the core

An exponent-zero operand may be converted to an all-zero unpacked magnitude. The first implementation may then let the normal magnitude comparison select the nonzero operand. A later optimization can add direct one-zero and both-zero exits if that reduces cycles without complicating alias safety.

## 5.4 FADD and FSUB rewrite

### 5.4.1 Entry and sign handling

Retain the existing efficient fallthrough:

```asm
__avm_fsub_finite:
    subi  r21, 0x80       ; toggle B sign
__avm_fadd_finite:
```

Initialize the A and B extension bytes as the current wrapper does, then execute the inlined finite split. Save A's original sign in `r30` or another existing scratch location.

### 5.4.2 Delete the special-case closure

Remove the direct-add references to:

```text
.L__addsf3_special_cases
.L__addsf3_nan
.L__addsf3_infinity_b
.L__addsf3_infinity
__fp_pscA
__fp_pscB
__fp_nan
__fp_inf
```

Those labels may remain for `FDIV`, `FSQRT`, or other legacy helpers, but the direct finite add/sub path must not reach them.

The entry should no longer perform:

```asm
rcall __fp_split3
brcs  .L__addsf3_special_cases
```

### 5.4.3 Magnitude comparison and swap

Retain the current five-byte comparison and operand swap structure. It already handles alias-independent helper operands and orders magnitudes so that:

- only B is shifted right;
- opposite-sign subtraction cannot produce a negative magnitude;
- the result sign follows the larger magnitude.

Because all exponent-zero operands have been converted to positive arithmetic zero, no signed-zero repair is needed during the swap.

### 5.4.4 Exact cancellation

For equal magnitudes with opposite effective signs, jump directly to a new canonical positive-zero helper:

```asm
rjmp __fp_pzero
```

Do not call `__fp_zero` if that helper still contains signed-zero/T-flag behavior needed elsewhere.

### 5.4.5 Correctly rounded large-gap shortcut

The current add core discards B when the exponent difference reaches 32. Correct rounding permits a tighter shortcut, but the boundary must account for subtraction near binade boundaries.

Use the conservative rule:

```text
if orderedExponentDifference >= 26:
    return the larger operand unchanged
```

This avoids all byte and bit shifts for the large-gap cases while retaining round-to-nearest-even correctness. Verify differences 24, 25, 26, and 27 exhaustively before committing the threshold.

For differences below the threshold, retain exact guard and sticky information. The current `r26` extension plus `r31` sticky representation is suitable for the first implementation.

### 5.4.6 Alignment

Retain the existing byte-at-a-time then bit-at-a-time alignment structure initially:

```text
shift whole bytes while the difference permits
shift remaining 1-7 bits
OR every discarded nonzero bit into sticky state
```

The simplified domain enables these additional assumptions:

- B never requires input-subnormal normalization.
- A and B are either zero or have an implicit leading one.
- No alignment path must preserve a NaN payload or infinity encoding.

A later optimization may specialize common exponent differences 0 and 1, but that is independent of the semantic conversion.

### 5.4.7 Same-sign addition

Retain the current significand addition. If it carries out:

- shift right once;
- preserve the guard and sticky state;
- increment the exponent;
- continue to natural packing and finite rounding.

Delete the explicit overflow test and jump to `__fp_inf`:

```asm
cpi   r25, 0xFE
brcs  ...
rjmp  __fp_inf
```

After the rewrite, the exponent is simply incremented and packed. Overflow is outside the contract, so whatever bits naturally result are acceptable.

### 5.4.8 Opposite-sign subtraction

Retain left normalization after subtraction, but replace gradual-underflow behavior with a positive-zero exit:

```text
while significand is not normalized:
    decrement exponent
    if exponent reaches zero:
        return +0
    shift significand left
```

No subnormal result is packed. Near-cancellation remains potentially expensive, but the underflow boundary becomes a short exit.

The previously considered byte-normalization optimization remains compatible and can be added later:

- skip one or more complete leading zero bytes;
- subtract eight from the exponent for each skipped byte;
- finish with the bit loop;
- return `+0` immediately if the exponent would cross zero.

### 5.4.9 Normal-only packing

The add/sub pack path no longer needs to distinguish finite, infinity, or NaN. It only needs to:

- pack a nonzero normal significand and exponent;
- apply the selected sign;
- leave overflow as the natural packed result;
- pass guard/sticky information to finite rounding.

## 5.5 FMUL rewrite

### 5.5.1 Entry and zero handling

Inline the finite split for both operands. If either extracted exponent is zero, jump directly to `__fp_pzero`.

Do not normalize subnormal operands and do not apply the XOR sign to a zero result.

### 5.5.2 Delete special-value processing

Remove the direct multiply path through:

```text
.L__mulsf3_special_cases
.L__mulsf3_nan
__fp_pscA
__fp_pscB
__fp_nan
__fp_inf
```

No exponent-`0xFF` test is needed.

### 5.5.3 Keep all information needed for correct rounding

The current multiplier computes all nine 8-by-8 partial products:

```text
A0*B0  A0*B1  A0*B2
A1*B0  A1*B1  A1*B2
A2*B0  A2*B1  A2*B2
```

Retain that exact accumulation initially. Unlike ABC, AVM must not simply omit `A0*B0`, because the low product can affect carry propagation and sticky classification at a ties-to-even boundary.

A later reduced accumulator may be used only after exhaustive proof that it produces exactly the same retained significand, guard bit, tie state, and sticky bit for all normal inputs.

### 5.5.4 Replace the general normalization loop

For two nonzero normal significands, the exact product is in `[1,4)`. Therefore the product needs at most one normalization adjustment.

Replace `.L__mulsf3_normalize` with:

```text
inspect the high product bit
if already normalized:
    continue
otherwise:
    perform exactly one left-layout adjustment
    decrement exponent once
```

The current unbounded normalization loop exists to support subnormal inputs and is unnecessary after DAZ.

### 5.5.5 Flush underflow directly

After subtracting the bias, any exponent below the normal range returns `+0` immediately.

Replace:

```text
.L__mulsf3_prepare_denormal
.L__mulsf3_denormalize
.L__mulsf3_underflow_zero
```

with one underflow test and a branch to `__fp_pzero`.

This removes the potentially long six-byte right-shift loop.

### 5.5.6 Remove explicit overflow-to-infinity

Delete the multiply overflow comparison and jump:

```asm
cpi   r25, 0xFE
cpc   r21, ZERO
brcs  ...
rjmp  __fp_inf
```

Normal exponent arithmetic, packing, and rounding continue without canonicalization. Any overflow result is arbitrary and non-normative.

### 5.5.7 Preserve exact sticky state

Continue combining discarded low product bytes into sticky state before rounding, for example the current:

```asm
or r31, r30
```

or an equivalent exact reduction. Correct rounding still depends on distinguishing exact ties from values above halfway.

## 5.6 Add a finite normal-only rounder

The current `__fp_round` begins with checks intended to avoid rounding NaN and infinity encodings. Direct finite-profile arithmetic does not need those checks.

Add a separate helper such as:

```asm
__fp_round_finite:
```

that performs only:

1. Test the guard bit.
2. Combine the remaining discarded bits into sticky.
3. If below halfway, return.
4. If exactly halfway and the retained LSB is even, return.
5. Otherwise increment the packed significand/exponent.
6. Return without checking whether exponent increment created an infinity or other overflow encoding.

This helper can initially be shared by finite add/sub/mul. If the `RCALL`/`RJMP` cost is significant and code-size permits, inline it into the hot helpers later.

Keep the existing `__fp_round` for conversions, `FDIV`, `FSQRT`, or any remaining routines that still depend on its special-value behavior.

## 5.7 Add a canonical positive-zero helper

Provide a minimal helper with no T-flag sign handling:

```asm
__fp_pzero:
    clr   r27
    clr   r22
    clr   r23
    movw  r24, r22
    ret
```

Equivalent instruction arrangements are acceptable. The important properties are:

- result is exactly `0x00000000`;
- no sign is restored;
- extension state is cleared as required by the caller;
- the path is shared by add/sub cancellation, zero inputs, multiply-zero, and flushed underflow.

Retain `__fp_zero`/`__fp_szero` only for legacy routines that still use signed-zero semantics.

## 5.8 Helper-table and SYS/libm policy

The simplest code-size policy is for direct AVM arithmetic and embedded SYS math services to share the finite helpers. Under that policy:

- SYS math functions accept the same finite-normal arithmetic assumptions internally.
- Internal subnormal add/multiply inputs become zero.
- Internal subnormal outputs flush to zero.
- Internal overflow has an arbitrary natural result.
- Public SYS functions must document useful finite input ranges rather than IEEE edge behavior.

Tests for NaN, infinity, or precise overflow behavior in `sinf`, `expf`, `powf`, and similar services become non-normative.

If a SYS function proves to require wider internal behavior, a separate private primitive may be retained, but it is not an IEEE compatibility mechanism for LLVM IR.

## 5.9 Code that becomes removable from the hot closure

After direct add/sub/mul and SYS users have moved to finite helpers, the following code may become dead or partly dead:

- add special-case dispatch labels;
- multiply special-case dispatch labels;
- calls to `__fp_pscA` and `__fp_pscB` from add/multiply;
- explicit `__fp_inf` and `__fp_nan` branches from add/multiply;
- multiply input-subnormal normalization support;
- multiply result-denormalization loop;
- finite add/multiply overflow checks;
- nonfinite guards in the finite rounder.

`__fp_split3`, `__fp_pscA`, `__fp_pscB`, `__fp_inf`, `__fp_nan`, and the old rounder may still be referenced by `FDIV`, `FSQRT`, conversions, or legacy code and must not be deleted until the complete reference graph is checked.

## 5.10 Recommended assembly implementation order

1. Add `__fp_pzero` and `__fp_round_finite`.
2. Add finite add/sub helpers beside the current implementation.
3. Differential-test every supported normal case against the current exact implementation or SoftFloat.
4. Switch `ff_binary_helper_targets` entries 0 and 1.
5. Add the finite multiply helper while retaining all nine partial products.
6. Differential-test all normal products and rounding boundaries.
7. Switch table entry 2.
8. Update SYS math services to use the finite primitives if that is the chosen policy.
9. Remove dead special-case and denormal code only after symbol/reference inspection.
10. Benchmark before considering independent bridge, lookup, or save/restore rewrites.

## 5.11 Expected performance direction

The main normal-path savings are:

### FADD/FSUB

- no `RCALL __fp_split3` / `RET` pair;
- no carry-based special-case branch;
- no exponent-`0xFF` comparisons;
- no `__fp_pscA`/`__fp_pscB` closure;
- a 26-or-greater exponent-gap early return;
- no gradual-underflow result construction;
- a shorter finite-only rounder;
- no explicit overflow-to-infinity branch.

A typical current 203-cycle `FADD q0,q1` should plausibly lose roughly 20-40 cycles before any bridge redesign. Exact savings must be measured because the inlined split and operand-swap paths vary by data.

### FMUL

- no full split call or special-value classification;
- zero/subnormal inputs become a short common exit;
- at most one normalization adjustment;
- no denormalization loop;
- no overflow comparison/`__fp_inf` path;
- shorter finite-only rounding.

The nine partial products remain, so AVM will not match ABC's approximate multiply latency, but the fixed overhead and extreme underflow cost should fall substantially.

---

## 6. LLVM IR contract

LLVM IR does not change its semantics merely because the target triple is AVM. Direct instructions may be selected only when the IR explicitly carries the AVM finite-float contract.

## 6.1 Required operation flags

Direct `FADD`, `FSUB`, and `FMUL` require:

```text
nnan
ninf
nsz
```

Meaning:

- `nnan`: NaN operands/results are excluded;
- `ninf`: infinity operands/results are excluded;
- `nsz`: positive and negative zero are interchangeable.

The profile does not require:

```text
reassoc
arcp
contract
afn
fast
```

Those transformations remain separately controlled.

## 6.2 Required denormal environment

The containing function must use the float denormal mode equivalent to:

```text
output: positivezero
input:  positivezero
```

In current LLVM IR this is represented by `denormal_fpenv`, with a float-specific override if needed by the LLVM branch in use.

If the attribute is absent, LLVM's default is IEEE denormal handling, and the backend must not select direct AVM arithmetic.

## 6.3 Overflow and `ninf`

The compiler-generated contract assumes finite results. A source computation whose exact result overflows violates the `ninf` assumption and is outside the valid program domain.

The backend must not insert an overflow check or require the interpreter to produce infinity. The arbitrary natural result is acceptable because valid generated code cannot depend on an overflow case.

Compile-time constant folding may produce poison or otherwise exploit the finite-only assumption for overflowing expressions. That is consistent with the runtime contract.

## 6.4 Strict and constrained operations

Direct instructions must not be selected for:

- `strictfp` behavior requiring unsupported semantics;
- constrained operations with dynamic or non-nearest rounding;
- observable exception behavior;
- signaling-NaN semantics.

Such operations require an optional exact runtime helper. If no compatible helper is configured, the backend must issue an error.

---

## 7. Clang target defaults

## 7.1 No `-mavm-finite-float` option is required

The finite profile should be the default language and code-generation contract whenever Clang targets AVM.

The AVM Clang toolchain should automatically apply the equivalent of:

```text
-ffinite-math-only
-fno-signed-zeros
-fdenormal-fp-math=positive-zero
-fno-trapping-math
-fno-math-errno
```

For the internal denormal setting, the implementation must ensure both float inputs and outputs use positive-zero treatment. Use the current LLVM branch's target/driver APIs rather than depending on one textual spelling.

Do **not** automatically enable:

```text
-ffast-math
-fassociative-math
-freciprocal-math
-fapprox-func
-ffp-contract=fast
```

### Implementation location

Clang toolchains already support target-specific defaults through `ToolChain::addClangTargetOptions`. The AVM toolchain can append the required `cc1` options there when the user has not explicitly selected conflicting floating-point behavior.

This is the same class of hook currently used by targets such as AVR to inject target-specific frontend defaults.

The target frontend should also define:

```text
__AVM_FINITE_FLOAT__ = 1
__FINITE_MATH_ONLY__ = 1
```

and should not define `__STDC_IEC_559__`.

Recommended numeric declarations are:

```text
FLT_ROUNDS      1
FLT_HAS_SUBNORM 0
```

C++ traits should report:

```text
std::numeric_limits<float>::is_iec559   == false
std::numeric_limits<float>::has_denorm  == std::denorm_absent
std::numeric_limits<float>::round_style == std::round_to_nearest
```

## 7.2 Explicit requests for stricter semantics

Standard Clang options that explicitly request incompatible behavior should be respected as a request for software emulation, not silently ignored. Examples include:

```text
-fno-finite-math-only
-fsigned-zeros
-fdenormal-fp-math=ieee
-frounding-math
-ffp-exception-behavior=strict
```

If an AVM IEEE runtime is configured, Clang/LLVM may lower the affected operations to runtime helpers. Otherwise compilation must fail with a clear diagnostic.

An optional switch such as:

```text
-mavm-ieee-runtime
```

may indicate that the toolchain installation supplies compatible helper routines. This option would not change direct instruction semantics; it would only permit fallback calls.

There is no need for a finite-profile opt-in switch because finite mode is the architectural default.

---

## 8. AVM LLVM backend behavior

## 8.1 Direct-selection rule

SelectionDAG or GlobalISel may select direct `FADD`, `FSUB`, or `FMUL` only when all of these conditions hold:

```text
operation has nnan
operation has ninf
operation has nsz
function float input denormal mode is positivezero
function float output denormal mode is positivezero
operation is not strict/constrained
rounding assumption is round-to-nearest
```

The backend must check the actual IR flags and attributes. It must not infer them solely from the AVM target triple for externally supplied IR.

Clang-produced AVM IR will normally satisfy the rule because the target defaults generate the flags and attributes automatically.

## 8.2 AVM never has an IEEE direct-instruction mode

Do not add a subtarget feature that changes the direct instructions between finite and IEEE behavior. The direct ISA semantics are always the finite profile.

A request for IEEE behavior can only lower to software helpers. The interpreter must not carry a second full-IEEE add/multiply implementation merely to satisfy generic LLVM IR.

## 8.3 Optional runtime helper interface

Reserve helper names for possible LLVM/Compiler-RT implementations, for example:

```c
float __avm_ieee_fadd(float, float);
float __avm_ieee_fsub(float, float);
float __avm_ieee_fmul(float, float);
```

The exact names should follow LLVM's normal libcall conventions if existing generic soft-float helper names can be reused safely. The important distinction is that these helpers are external runtime code, not direct AVM instructions and not embedded interpreter primitives.

The backend should have an explicit configuration bit, toolchain capability, or runtime availability setting such as:

```text
HasAVMIEEEFloatRuntime
```

When true, incompatible operations lower to helpers. When false, they are diagnosed.

## 8.4 Required diagnostic behavior

In the default AVM toolchain, no full-IEEE helper runtime is assumed to exist. When the backend encounters an operation that cannot use the finite instructions, it must reject code generation rather than silently miscompile or leave an unexplained unresolved symbol.

Use LLVM's unsupported-feature diagnostic machinery so the error identifies the function and operation. A suitable message is:

```text
error: AVM direct f32 arithmetic requires nnan, ninf, nsz and
       positive-zero input/output denormal mode; no IEEE floating-point
       runtime helper is available for this fadd
```

Diagnostics should distinguish at least:

- missing `nnan` or `ninf`;
- signed-zero semantics required;
- IEEE input/output denormal mode required;
- strict or constrained rounding required;
- exception behavior required;
- runtime helper unavailable.

A link-time unresolved-symbol error may remain a secondary safety net, but the normal failure should occur during LLVM code generation.

## 8.5 External LLVM IR

External IR is accepted directly only when it carries the same contract as Clang-generated AVM IR.

For each incompatible operation:

1. If a compatible exact runtime helper is configured, emit the helper call.
2. Otherwise emit the AVM unsupported-floating-point diagnostic and reject the module/function.

The backend must not retroactively add fast-math flags to unannotated external IR. Doing so would change the IR's meaning.

## 8.6 LTO and inlining

The required information must survive:

- bitcode serialization;
- full LTO;
- ThinLTO;
- inlining;
- cloning;
- optimization pipeline changes.

Fast-math flags remain attached to individual operations. Denormal mode remains a function attribute. If unrestricted code is inlined into a finite-profile function, its unannotated operations remain unrestricted and must use helpers or be rejected.

## 8.7 Constant folding

Within the supported domain, correct rounding keeps runtime results consistent with LLVM's normal constant folding.

DAZ, FTZ, and zero-sign assumptions must be represented in IR so optimizers may handle subnormal and signed-zero expressions consistently.

Overflow expressions are outside the contract; no agreement with a particular runtime overflow bit pattern is required.

## 8.8 Comparisons

Finite-profile Clang code should carry `nnan` on `fcmp`, allowing LLVM to disregard unordered behavior for valid inputs.

The architectural `FCMP` may retain its current broader bit-pattern behavior. A future finite-only fast comparison path may exploit `nnan`/`nsz`, but it is not required for the initial FADD/FSUB/FMUL work.

---

## 9. Runtime and ABI implications

### 9.1 ABI stability

No calling-convention or object representation changes are required:

- q-register placement is unchanged;
- stack layout is unchanged;
- float size and alignment are unchanged;
- ELF and relocation behavior are unchanged;
- mixed raw bit patterns remain transferable across function boundaries.

### 9.2 Semantic boundaries

A finite-profile function may:

- treat any subnormal argument as `+0`;
- canonicalize negative zero;
- produce an arbitrary result on overflow;
- behave arbitrarily for NaN or infinity arithmetic.

An exact-helper function may preserve broader IEEE behavior internally, but values passed back to finite direct arithmetic immediately re-enter the finite profile.

### 9.3 Library policy

The default AVM C/C++ library and SYS math services should document finite useful input ranges. They need not promise NaN, infinity, subnormal, errno, exception, or overflow behavior.

Optional IEEE helpers, if ever supplied by LLVM/Compiler-RT, are a separate runtime component and should not be linked into ordinary Arduboy images.

---

## 10. Tests and benchmarks

## 10.1 Arithmetic oracle tests

Use SoftFloat, MPFR, or an equivalent exact oracle for supported normal-result cases.

### FADD/FSUB

Cover:

- equal exponents;
- exponent differences 0 through at least 31;
- large-gap boundary 24, 25, 26, and 27;
- same-sign and opposite-sign large-gap cases;
- carry normalization;
- exact cancellation to `+0`;
- near cancellation;
- minimum-normal outputs;
- results immediately above and below the FTZ boundary;
- halfway cases with even and odd retained LSBs;
- both raw zero signs;
- positive and negative subnormal inputs treated as `+0`.

### FMUL

Cover:

- both possible normal-product layouts;
- exact halfway cases;
- low-byte patterns where `A0*B0` changes sticky or carry;
- minimum-normal operands;
- output immediately above and below the FTZ boundary;
- zero and subnormal-input exits;
- randomized millions-of-pairs differential testing for finite normal operands whose result is normal.

## 10.2 Overflow tests

Overflow tests must verify only that:

- execution terminates correctly;
- the interpreter remains synchronized;
- no architectural state outside qD is corrupted;
- cycle counts can be measured.

They must **not** require infinity or any specific qD bit pattern. Benchmark names should use wording such as:

```text
FADD ... (overflow natural result)
FMUL ... (overflow natural result)
```

rather than “overflow to +infinity.”

## 10.3 Unsupported-value tests

NaN and infinity arithmetic tests should be removed from the normative result suite or marked unsupported/non-normative. `FCLASS` tests may continue to classify their raw encodings.

## 10.4 LLVM backend tests

Add tests proving:

- default Clang AVM compilation emits `nnan`, `ninf`, and `nsz` on applicable arithmetic;
- default AVM functions carry positive-zero float denormal input/output mode;
- default compilation selects direct FADD/FSUB/FMUL;
- no `-mavm-finite-float` option is required;
- full `-ffast-math` transformations are not enabled implicitly;
- external compatible IR selects direct instructions;
- missing any required flag or denormal attribute rejects compilation when no runtime exists;
- the same incompatible IR emits helper calls when the optional runtime capability is enabled;
- strict/constrained operations reject without runtime support;
- LTO and inlining preserve the distinction.

## 10.5 Benchmark updates

Retain q0-q3 destination coverage and add:

- exponent-gap 24/25/26/27;
- zero and subnormal-input fast exits;
- exact cancellation;
- minimum-normal and FTZ output boundaries;
- FMUL zero-shift and one-shift normalization;
- ties-to-even cases;
- overflow natural-result timing without output assertion.

---

## 11. Migration sequence

1. Add the finite profile to the normative AVM architecture documentation.
2. Make Clang's AVM target automatically emit the required finite/zero/denormal contract.
3. Add backend selection checks and unsupported-operation diagnostics before changing interpreter semantics.
4. Define the optional IEEE runtime-helper ABI, but keep the default capability disabled.
5. Add finite add/sub helpers alongside the current helpers.
6. Validate and switch FADD/FSUB helper-table entries.
7. Add and validate finite FMUL while retaining all nine partial products.
8. Switch the FMUL table entry.
9. Update SYS/libm policy and tests.
10. Remove dead add/multiply IEEE-special and denormal code after reference analysis.
11. Update benchmarks, especially overflow naming and non-normative result handling.
12. Measure cycles and code size before performing independent bridge optimizations.

---

## 12. Final decisions

AVM adopts:

```text
Storage representation:       IEEE-754 binary32 bits
Direct arithmetic domain:     finite normal values and arithmetic zero
NaN/infinity arithmetic:      unsupported
Input denormals:               treated as +0
Output denormals:              flushed to +0
Signed-zero dependence:       unsupported
Rounding:                      nearest, ties to even
Supported normal results:     correctly rounded
Overflow result:              arbitrary natural packed result
FP exceptions:                absent
Dynamic rounding:             absent
Direct IEEE mode:             never supported
Optional IEEE behavior:       external LLVM/Compiler-RT runtime helpers only
Default Clang AVM behavior:   profile selected automatically
Incompatible external IR:     helper call if available, otherwise diagnostic
```

The key LLVM-visible contract is:

```text
nnan + ninf + nsz
positivezero output/input denormal mode
```

This captures nearly all of ABC's useful structural simplifications while retaining exact rounding for supported normal results and keeping LLVM constant folding and runtime arithmetic aligned within the valid domain.

---

## References

- [Current AVM AVR interpreter source](interp(23).asm)
- [ABC simplified AVR floating-point implementation](https://github.com/tiberiusbrown/abc/blob/master/interp_arduboy/abc_float.S)
- [LLVM Language Reference: fast-math flags and `denormal_fpenv`](https://llvm.org/docs/LangRef.html)
- [Clang User's Manual: floating-point options](https://clang.llvm.org/docs/UsersManual.html)
- [LLVM constrained floating-point documentation](https://llvm.org/docs/AddingConstrainedIntrinsics.html)
