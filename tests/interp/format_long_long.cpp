#include <absim.hpp>
#include <absim_regs.hpp>
#include <algorithm>
#include <array>
#include <cstdint>
#include <fstream>
#include <iostream>
#include <map>
#include <memory>
#include <sstream>
#include <stdexcept>
#include <string>

namespace {
void require(bool condition, const char *message) {
    if(!condition) throw std::runtime_error(message);
}

// Deliberately assert the original concrete workspace layout, independently
// of the new aliases. The first byte outside it is still 0xAB9.
constexpr unsigned workspace = 0xa71, source = workspace + 16;
constexpr unsigned digits = workspace + 21, args = workspace + 43;
constexpr unsigned count = workspace + 49, nonzero = workspace + 52;
constexpr unsigned mode = workspace + 53, integer_value = workspace + 58;
constexpr unsigned scratch_end = workspace + 72;

struct harness {
    std::unique_ptr<absim::arduboy_t> e = std::make_unique<absim::arduboy_t>();
    std::map<std::string, unsigned> symbols;
    unsigned cases = 0;
    bool inject_interrupt = false, interrupted = false;
    unsigned maximum_stack = 0;
    auto& cpu() { return e->core_state.cpu; }
    unsigned sym(const char *name) { return symbols.at(name) / 2; }
    void word(unsigned p, unsigned n) {
        cpu().data[p] = uint8_t(n); cpu().data[p+1] = uint8_t(n >> 8);
    }
    unsigned word(unsigned p) { return cpu().data[p] | unsigned(cpu().data[p+1]) << 8; }
    void value(unsigned p, uint64_t n, unsigned width=8) {
        for(unsigned i=0; i<width; ++i) cpu().data[p+i] = uint8_t(n >> (8*i));
    }
    uint64_t value(unsigned p, unsigned width=8) {
        uint64_t n = 0;
        for(unsigned i=0; i<width; ++i) n |= uint64_t(cpu().data[p+i]) << (8*i);
        return n;
    }
    harness(const char *hex, const char *listing) {
        std::ifstream in(listing);
        require(bool(in), "missing listing");
        for(std::string line; std::getline(in, line);) {
            std::istringstream row(line); unsigned address; std::string token, name;
            if(!(row >> std::hex >> address)) continue;
            while(row >> token) name = token;
            symbols[name] = address;
        }
        e->reset();
        std::ifstream file(hex, std::ios::binary);
        require(e->load_file("interpreter.hex", file).empty(), "cannot load interpreter");
        cpu().no_merged = true;
        cpu().autobreaks.reset();
    }
    void prepare(bool t) {
        std::fill(cpu().data.begin(), cpu().data.end(), 0);
        for(unsigned r=0; r<32; ++r) cpu().data[r] = uint8_t(r*13+7);
        std::fill(cpu().data.begin()+0x100, cpu().data.begin()+scratch_end, 0xa5);
        cpu().data[2] = 0; cpu().data[3] = 1;
        // Both H and C initially set; I is set with all interrupt masks clear.
        cpu().data[absim::reg::addr::SREG] = uint8_t(0xa1 | (t ? 0x40 : 0));
        word(absim::reg::addr::SPL, 0xaff);
        cpu().min_stack = 0xaff;
    }
    void until(unsigned stop) {
        unsigned limit=200000;
        while(cpu().pc != stop && limit--) {
            // Force the longest enabled ISR at the deepest integer division,
            // including its pending audio-update RCALL. Model hardware entry:
            // push the word PC, clear I, and enter the real timer vector body.
            if(inject_interrupt && !interrupted && cpu().pc == sym("format_divide_byte_by_10")) {
                unsigned resume = cpu().pc;
                cpu().push(uint8_t(resume)); cpu().push(uint8_t(resume >> 8));
                cpu().data[absim::reg::addr::SREG] &= uint8_t(~0x80);
                cpu().pc = uint16_t(sym("timer1_compa_isr"));
                interrupted = true;
            }
            e->cycle(); cpu().update_all();
        }
        require(cpu().pc == stop, "helper/parser timeout");
    }
    void call(const char *name, std::initializer_list<unsigned> clobbers,
              unsigned flags, std::initializer_list<std::pair<unsigned,unsigned>> writes) {
        auto before = cpu().data;
        auto sp = cpu().sp();
        constexpr unsigned stop = 0x3fff;
        cpu().push(uint8_t(stop)); cpu().push(uint8_t(stop >> 8));
        cpu().pc = uint16_t(sym(name));
        until(stop);
        require(cpu().sp() == sp, "helper stack leak");
        for(unsigned r=0; r<32; ++r)
            if(std::find(clobbers.begin(), clobbers.end(), r) == clobbers.end())
                require(before[r] == cpu().data[r], "helper register clobber");
        require(((before[absim::reg::addr::SREG] ^ cpu().data[absim::reg::addr::SREG]) & ~flags) == 0,
                "helper SREG clobber (including T/I)");
        for(unsigned p=0x100; p<scratch_end; ++p) {
            bool writable = false;
            for(auto range : writes) if(p >= range.first && p < range.second) writable = true;
            if(!writable) require(before[p] == cpu().data[p], "helper SRAM overwrite");
        }
        ++cases;
    }
    void run() {
        for(bool t : {false, true}) {
            for(unsigned rem=0; rem<10; ++rem) for(unsigned byte=0; byte<256; ++byte) {
                prepare(t); cpu().data[24]=uint8_t(rem); cpu().data[25]=uint8_t(byte);
                call("format_divide_byte_by_10", {24,25,26}, 0x3f, {});
                require(cpu().data[24] == (rem*256+byte)%10 &&
                        cpu().data[25] == (rem*256+byte)/10, "byte divider result");
            }
            uint64_t random = 0x41564d4c4c;
            for(unsigned i=0; i<512; ++i) {
                // Unsigned arithmetic provides an independent host oracle.
                random ^= random << 13; random ^= random >> 7; random ^= random << 17;
                uint64_t bits = i < 64 ? uint64_t(1) << i : random;
                if(i == 64) bits=UINT64_MAX;
                if(i == 65) bits=0;
                for(unsigned width : {1u,2u,4u,8u}) {
                    uint64_t mask = width==8 ? UINT64_MAX : (uint64_t(1) << (width*8))-1;
                    uint64_t n=bits&mask;
                    prepare(t); value(0x301,bits); word(args,0x301); cpu().data[20]=uint8_t(width);
                    call("format_arg_integer", {21,22,23,26,27,30,31}, 0x3f,
                         {{integer_value,integer_value+width},{args,args+2}});
                    require(value(integer_value,width)==n && word(args)==0x301+std::max(width,2u),
                            "packed argument read (including promoted hh)");
                    require(cpu().data[21]==uint8_t(n >> ((width-1)*8)) &&
                            bool(cpu().data[23])==bool(n), "argument sign/zero outputs");
                    prepare(t); value(integer_value,n,width); cpu().data[20]=uint8_t(width);
                    call("format_negate_integer", {22,23,24,30,31}, 0x3f,
                         {{integer_value,integer_value+width}});
                    require(value(integer_value,width)==((uint64_t(0)-n)&mask), "negation result");
                    prepare(t); value(integer_value,n,width); cpu().data[20]=uint8_t(width);
                    call("format_divide_integer_by_10", {22,23,24,25,26,30,31}, 0x3f,
                         {{integer_value,integer_value+width}});
                    require(value(integer_value,width)==n/10 && cpu().data[24]==n%10 &&
                            bool(cpu().data[23])==bool(n/10), "integer division result");
                    for(unsigned shift : {3u,4u}) {
                        prepare(t); value(integer_value,n,width); cpu().data[20]=uint8_t(width);
                        cpu().data[19]=uint8_t(shift);
                        call("format_shift_integer_right", {19,22,23,25,30,31}, 0x3f,
                             {{integer_value,integer_value+width}});
                        require(value(integer_value,width)==n>>shift && bool(cpu().data[23])==bool(n>>shift),
                                "integer shift result");
                    }
                    unsigned base=i%4;
                    std::ostringstream expected;
                    if(base==1) expected << std::oct;
                    if(base>=2) expected << std::hex;
                    if(base==3) expected << std::uppercase;
                    expected << n;
                    auto text=expected.str();
                    prepare(t); value(integer_value,n,width); cpu().data[20]=uint8_t(width);
                    cpu().data[nonzero]=uint8_t(bool(n));
                    cpu().data[mode]=uint8_t(base==3 ? 10 : base);
                    call("format_generate_integer_digits", {19,22,23,24,25,26,30,31}, 0x3f,
                         {{integer_value,integer_value+width},{digits,digits+unsigned(text.size())},{count,count+1}});
                    require(cpu().data[count]==text.size(), "integer digit count");
                    require(std::equal(text.rbegin(),text.rend(),cpu().data.begin()+digits),
                            "reversed integer digits");
                }
            }
        }
        // Exhaust all signed/unsigned hh representations through the parser
        // and shared field emitter, with a nonzero discarded promoted byte
        // and a following 16-bit argument to check exact cursor advancement.
        for(unsigned n=0; n<256; ++n) for(char conversion : std::string("diuoxX")) {
            std::string format="%hh"; format+=conversion; format+="|%u";
            std::ostringstream reference;
            if(conversion=='o') reference << std::oct;
            if(conversion=='x' || conversion=='X') reference << std::hex;
            if(conversion=='X') reference << std::uppercase;
            if(conversion=='d' || conversion=='i') reference << (n>=128 ? int(n)-256 : int(n));
            else reference << n;
            reference << "|" << std::dec << 1234;
            auto expected=reference.str();
            prepare(false);
            std::copy(format.c_str(), format.c_str()+format.size()+1, cpu().data.begin()+0x200);
            word(source,0x200); word(args,0x301); word(0x301,0x5a00|n); word(0x303,1234);
            cpu().data[17]=0; word(8,0); word(10,95); word(28,0x400);
            cpu().pc=uint16_t(sym("format_core"));
            until(sym("format_finish"));
            require(!(cpu().data[17]&8) && word(args)==0x305 && word(8)==expected.size(),
                    "hh parser/count/cursor");
            require(std::equal(expected.begin(),expected.end(),cpu().data.begin()+0x400),
                    "hh signed magnitude or digit output");
            require(cpu().sp()==0xaff, "hh formatter stack leak");
            ++cases;
        }
        for(const char *format : {"%ll", "%lls", "%llc", "%llp", "%llf", "%llld",
                                  "%llS", "%llP", "%ll%", "%*.*lls"}) {
            prepare(false);
            std::copy(format, format+std::char_traits<char>::length(format)+1, cpu().data.begin()+0x200);
            word(source,0x200); word(args,0x301); word(0x301,2); word(0x303,3);
            cpu().data[17]=0; word(8,0); word(10,0); word(28,0x400);
            cpu().pc=uint16_t(sym("format_core"));
            until(sym("format_finish"));
            require(cpu().data[17] & 8, "invalid format accepted");
            require(word(args)==(format[1]=='*' ? 0x305u : 0x301u), "invalid conversion consumed value");
            require(cpu().sp()==0xaff, "invalid parser leaked return address");
            ++cases;
        }
        for(const char *format : {"%+025lld|%u", "%#025llo|%u", "%#018llX|%u"}) {
            prepare(false);
            std::copy(format, format+std::char_traits<char>::length(format)+1, cpu().data.begin()+0x200);
            word(source,0x200); word(args,0x301);
            value(0x301,UINT64_MAX); word(0x309,1234);
            cpu().data[17]=0; word(8,0); word(10,95); word(28,0x400);
            for(unsigned i=0; i<16; ++i) cpu().push(0);
            cpu().pc=uint16_t(sym("format_core"));
            inject_interrupt = format[1]=='+'; interrupted = false;
            until(sym("format_finish"));
            require(!inject_interrupt || interrupted, "missing interrupt coverage");
            inject_interrupt = false;
            require(word(args)==0x30b && !(cpu().data[17]&8), "mixed formatter cursor");
            require(cpu().sp()==0xaef, "formatter native stack leak");
            maximum_stack = std::max(maximum_stack, 0xaffu-cpu().min_stack);
            require(cpu().min_stack >= scratch_end, "formatter native stack overlaps workspace");
            ++cases;
        }
        require(maximum_stack == 32, "wide formatter/ISR stack depth changed");
        std::cout << cases << " native formatter helper/parser checks passed\n";
        std::cout << "Native integer conversion/ISR peak: " << maximum_stack
                  << " of " << 0xb00-scratch_end << " available stack bytes\n";
    }
};
}

int main(int argc, char **argv) {
    try {
        require(argc==3, "expected interpreter hex and listing");
        harness h(argv[1],argv[2]); h.run(); return 0;
    } catch(const std::exception& error) {
        std::cerr << error.what() << '\n'; return 1;
    }
}
