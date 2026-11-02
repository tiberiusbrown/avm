// Function-index lookup at many positions. Each of the 48 pairs below is a thrower
// and the catch in its caller, so the index holds about 100 functions, and the
// throws reach the first, middle, and last entries of the binary search. Each
// thrower throws its own value, and each catch must return that value, so a lookup
// that found the wrong record would catch the wrong value or fall through.
// avm_eh_catch_all_run builds it with -fexceptions and selects it by name.

extern "C" int avm_test_main(void);

namespace {

int failures = 0;

void expect(bool ok) {
    if (!ok)
        ++failures;
}

#define AVM_EH_INDEX_PAIR(n)                                                    \
    __attribute__((noinline)) void thrower_##n() { throw n; }                   \
    __attribute__((noinline)) int catch_##n() {                                 \
        try {                                                                   \
            thrower_##n();                                                      \
        } catch (int value) {                                                   \
            return value;                                                       \
        }                                                                       \
        return -1;                                                              \
    }

AVM_EH_INDEX_PAIR(0)
AVM_EH_INDEX_PAIR(1)
AVM_EH_INDEX_PAIR(2)
AVM_EH_INDEX_PAIR(3)
AVM_EH_INDEX_PAIR(4)
AVM_EH_INDEX_PAIR(5)
AVM_EH_INDEX_PAIR(6)
AVM_EH_INDEX_PAIR(7)
AVM_EH_INDEX_PAIR(8)
AVM_EH_INDEX_PAIR(9)
AVM_EH_INDEX_PAIR(10)
AVM_EH_INDEX_PAIR(11)
AVM_EH_INDEX_PAIR(12)
AVM_EH_INDEX_PAIR(13)
AVM_EH_INDEX_PAIR(14)
AVM_EH_INDEX_PAIR(15)
AVM_EH_INDEX_PAIR(16)
AVM_EH_INDEX_PAIR(17)
AVM_EH_INDEX_PAIR(18)
AVM_EH_INDEX_PAIR(19)
AVM_EH_INDEX_PAIR(20)
AVM_EH_INDEX_PAIR(21)
AVM_EH_INDEX_PAIR(22)
AVM_EH_INDEX_PAIR(23)
AVM_EH_INDEX_PAIR(24)
AVM_EH_INDEX_PAIR(25)
AVM_EH_INDEX_PAIR(26)
AVM_EH_INDEX_PAIR(27)
AVM_EH_INDEX_PAIR(28)
AVM_EH_INDEX_PAIR(29)
AVM_EH_INDEX_PAIR(30)
AVM_EH_INDEX_PAIR(31)
AVM_EH_INDEX_PAIR(32)
AVM_EH_INDEX_PAIR(33)
AVM_EH_INDEX_PAIR(34)
AVM_EH_INDEX_PAIR(35)
AVM_EH_INDEX_PAIR(36)
AVM_EH_INDEX_PAIR(37)
AVM_EH_INDEX_PAIR(38)
AVM_EH_INDEX_PAIR(39)
AVM_EH_INDEX_PAIR(40)
AVM_EH_INDEX_PAIR(41)
AVM_EH_INDEX_PAIR(42)
AVM_EH_INDEX_PAIR(43)
AVM_EH_INDEX_PAIR(44)
AVM_EH_INDEX_PAIR(45)
AVM_EH_INDEX_PAIR(46)
AVM_EH_INDEX_PAIR(47)

#undef AVM_EH_INDEX_PAIR

} // namespace

extern "C" int avm_test_main(void) {
    // Every pair runs in index order, so the first and last entries are both reached.
    expect(catch_0() == 0);
    expect(catch_1() == 1);
    expect(catch_2() == 2);
    expect(catch_3() == 3);
    expect(catch_4() == 4);
    expect(catch_5() == 5);
    expect(catch_6() == 6);
    expect(catch_7() == 7);
    expect(catch_8() == 8);
    expect(catch_9() == 9);
    expect(catch_10() == 10);
    expect(catch_11() == 11);
    expect(catch_12() == 12);
    expect(catch_13() == 13);
    expect(catch_14() == 14);
    expect(catch_15() == 15);
    expect(catch_16() == 16);
    expect(catch_17() == 17);
    expect(catch_18() == 18);
    expect(catch_19() == 19);
    expect(catch_20() == 20);
    expect(catch_21() == 21);
    expect(catch_22() == 22);
    expect(catch_23() == 23);
    expect(catch_24() == 24);
    expect(catch_25() == 25);
    expect(catch_26() == 26);
    expect(catch_27() == 27);
    expect(catch_28() == 28);
    expect(catch_29() == 29);
    expect(catch_30() == 30);
    expect(catch_31() == 31);
    expect(catch_32() == 32);
    expect(catch_33() == 33);
    expect(catch_34() == 34);
    expect(catch_35() == 35);
    expect(catch_36() == 36);
    expect(catch_37() == 37);
    expect(catch_38() == 38);
    expect(catch_39() == 39);
    expect(catch_40() == 40);
    expect(catch_41() == 41);
    expect(catch_42() == 42);
    expect(catch_43() == 43);
    expect(catch_44() == 44);
    expect(catch_45() == 45);
    expect(catch_46() == 46);
    expect(catch_47() == 47);
    return failures == 0 ? 0 : 1;
}
