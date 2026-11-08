#include <absim.hpp>
#include <absim_regs.hpp>
#include "avm_spi_observer.hpp"
#include <algorithm>
#include <array>
#include <cmath>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <iterator>
#include <map>
#include <memory>
#include <sstream>
#include <stdexcept>
#include <vector>

using namespace absim;
namespace {
constexpr unsigned pending=0xa15, volume=0xa16, status=0xa17,
    read_head=0xa19, write_head=0xa1a, cursor=0xa1b, remaining=0xa27,
    frame_left=0xa2f, previous=0xa32, older=0xa33, bits=0xa34,
    held_sample=0xa36, underruns=0xa37, ring=0xa38,
    private_end=0xa78, scratch_end=private_end+72;
void require(bool c, char const* m) { if(!c) throw std::runtime_error(m); }
struct harness {
    std::unique_ptr<arduboy_t> e = std::make_unique<arduboy_t>();
    std::map<std::string,unsigned> symbols;
    unsigned cases=0;
    uint64_t isrmin=10000,isrmax=0,latencymax=0;
    uint64_t boot_cycles=0;
    bool freeze_commits=false;
    atmega32u4_t& c() { return e->core_state.cpu; }
    unsigned sym(char const* name) { return symbols.at(name)/2; }
    uint16_t word(unsigned a) { return uint16_t(c().data[a] | c().data[a+1]<<8); }
    void word(unsigned a, uint16_t v) { c().data[a]=uint8_t(v); c().data[a+1]=uint8_t(v>>8); }
    bool boundary() { unsigned p=c().pc; return p>=sym("primary_table") && p<sym("primary_table")+1024 && (p-sym("primary_table"))%4==0; }
    void tick(bool terminal_break=false) {
        // Unit tests invoke one sample explicitly. Guest workloads use live timers.
        if(freeze_commits) {
            c().st(reg::addr::TIMSK1,0); c().st(reg::addr::TCCR1B,0);
        }
        // Ardens resets spi_done_cycle after delivering the byte to FX. The
        // CPU completion deadline remains in spi_transmit_zero_cycle until
        // its deferred peripheral update clears spi_busy.
        if(c().pc==sym("seek_and_dispatch_func"))
            require(!c().spi_busy || c().spi_transmit_zero_cycle<=c().cycle_count,
                "FX deselected before speculative transfer completed");
        e->cycle(); c().update_all();
        require(!c().should_autobreak() || (terminal_break && c().autobreaks.test(AB_BREAK)), "native emulator fault");
    }
    template<class F> uint64_t until(F f, uint64_t limit=1000000) {
        auto start=c().cycle_count;
        while(!f() && c().cycle_count-start<limit) tick();
        if(!f()) {
            std::ostringstream error;
            error<<"native execution exceeded cycle limit at AVR byte PC 0x"<<std::hex<<c().pc*2<<" (started cycle "<<std::dec<<start<<")";
            throw std::runtime_error(error.str());
        }
        return c().cycle_count-start;
    }
    harness(char** args, bool isolated=true, unsigned expected_top=127) {
        std::ifstream listing(args[2]); require(bool(listing),"listing unavailable");
        for(std::string line; std::getline(listing,line);) {
            std::istringstream in(line); unsigned a; std::string name,token;
            if(!(in>>std::hex>>a)) continue;
            while(in>>token) name=token;
            symbols[name]=a;
        }
        e->reset();
        for(auto pair : {std::make_pair(args[1],"interpreter.hex"),std::make_pair(args[3],"fxdata.bin")}) {
            std::ifstream in(pair.first,std::ios::binary); require(bool(in),"input unavailable");
            auto error=e->load_file(pair.second,in); if(!error.empty()) throw std::runtime_error(error);
        }
        c().no_merged=true; c().autobreaks.reset();
        avm_test::observe_spi_writes(c());
        // Cover inherited timer clocks, interrupt enables and speaker ownership.
        c().st(reg::addr::TCCR1B, 10);
        c().st(reg::addr::TIMSK1, 2);
        c().st(reg::addr::TCCR3A, 128);
        c().st(reg::addr::TCCR3B, 10);
        c().st(reg::addr::TIMSK3, 2);
        c().data[reg::addr::TIFR1] |= 2;
        c().data[reg::addr::TIFR3] |= 2;
        c().st(reg::addr::PRR0, c().data[reg::addr::PRR0] |
            reg::bit::PRR0::PRTIM0 | reg::bit::PRR0::PRTIM1);
        c().pc=0; // test firmware reset vector, independently of bootloader fuses
        boot_cycles=until([&]{return boundary();},2000000);
        require(c().data[reg::addr::PLLFRQ]==0x6a,"PLL must clock Timer4 at 64 MHz");
        require(c().pll_num12==48,"emulator PLL frequency wrong");
        require(expected_top ? c().timer1.ocrNa==expected_top :
            (c().timer1.ocrNa==127 || c().timer1.ocrNa==255),"Timer1 TOP wrong");
        require(c().data[reg::addr::TIMSK3] == 0 && c().data[reg::addr::TCCR3B] == 0 &&
            c().data[reg::addr::TCCR3A] == 0, "unused Timer3 must release its interrupt and speaker pin");
        require(!(c().data[reg::addr::PRR0] & (reg::bit::PRR0::PRTIM0 | reg::bit::PRR0::PRTIM1)),
            "Timer0/Timer1 power gates were not cleared");
        require(c().timer4.ocrNc==255,"Timer4 TOP wrong");
        require(c().data[volume]==128,"default audio masters wrong");
        if(isolated) {
            c().st(reg::addr::TIMSK0,0); c().st(reg::addr::TCCR0B,0);
            quiet();
        }
    }
    uint64_t routine(char const* name, bool isr=false) {
        auto dest=sym("primary_table");
        c().push(uint8_t(dest)); c().push(uint8_t(dest>>8));
        c().pc=uint16_t(sym(name));
        if(isr) { c().data[reg::addr::SREG]&=0x7f; c().prev_sreg&=0x7f; }
        return until([&]{return c().pc==dest;});
    }
    uint64_t synth_sample() {
        auto previous=c().data[held_sample];
        c().data[reg::addr::TC4H]=3;
        auto cycles=routine("timer1_compa_isr",true)+7;
        require(c().timer4.ocrNa_next==previous,"ISR did not output the held sample or clear TC4H");
        isrmin=std::min(isrmin,cycles); isrmax=std::max(isrmax,cycles);
        return cycles;
    }
    void quiet() {
        c().st(reg::addr::TIMSK1,0); c().st(reg::addr::TCCR1B,0);
        routine("interp_delay_17"); // finish the interrupted bytecode transfer
        c().st(reg::addr::PORTD,uint8_t(c().data[reg::addr::PORTD]|2));
    }
    void asset(uint32_t addr, std::vector<uint8_t> const& data) {
        uint32_t base=uint32_t(word(0xa00))<<8;
        auto& flash=e->peripherals.fx;
        for(unsigned i=0;i<data.size();++i) {
            auto a=(base+addr+i)&0xffffff; auto s=a/4096;
            if(!flash.sectors[s]) { flash.sectors[s]=std::make_unique<w25q128_t::sector_t>(); flash.sectors[s]->fill(255); }
            (*flash.sectors[s])[a%4096]=data[i];
        }
    }
    uint64_t command(unsigned command, uint32_t ptr=0, unsigned value=0, bool synchronous=true) {
        if(synchronous) quiet();
        freeze_commits=synchronous;
        word(16,uint16_t(ptr)); word(18,uint16_t(ptr>>16)); word(20,uint16_t(value)); word(22,uint16_t(command));
        auto regs=c().data; auto flags=c().data[reg::addr::GPIOR0]; auto sp=c().sp();
        c().pc=uint16_t(sym("sys_audio_impl")); tick();
        auto t=until([&]{return boundary();});
        freeze_commits=false;
        if(synchronous) quiet();
        for(unsigned i=2;i<24;++i) if(command!=9 || (i!=16 && i!=17))
            require(c().data[i]==regs[i],"audio SYS corrupted VM registers/PC/constants");
        require(c().data[28]==regs[28] && c().data[29]==regs[29],"audio SYS corrupted guest SP");
        require(c().data[reg::addr::GPIOR0]==flags,"audio SYS corrupted guest flags");
        require(c().sp()==sp,"audio SYS leaked native stack");
        return t;
    }
    uint64_t elapsed(unsigned n) {
        quiet(); c().data[pending]=uint8_t(n);
        auto regs=c().data; auto sp=c().sp();
        auto t=routine("audio_service_func");
        for(unsigned i=2;i<24;++i) require(c().data[i]==regs[i],"service corrupted VM state");
        require(c().data[28]==regs[28] && c().data[29]==regs[29],"service corrupted Y");
        require(c().data[reg::addr::GPIOR0]==regs[reg::addr::GPIOR0],"service corrupted guest flags");
        require(c().sp()==sp,"service leaked stack");
        return t;
    }
};

void decimal_division(char** args) {
    harness h(args);
    for(unsigned remainder=0;remainder<10;++remainder) {
        for(unsigned byte=0;byte<256;++byte) {
            unsigned dividend=256*remainder+byte;
            h.c().data[24]=uint8_t(remainder); h.c().data[25]=uint8_t(byte);
            unsigned t=(byte&1)<<6;
            h.c().data[reg::addr::SREG]=uint8_t(t);
            h.c().prev_sreg=uint8_t(t);
            auto sp=h.c().sp();
            h.routine("format_divide_byte_by_10");
            require(h.c().data[24]==dividend%10 && h.c().data[25]==dividend/10,
                "decimal byte division quotient/remainder wrong");
            require((h.c().data[reg::addr::SREG]&64)==t,"decimal division changed T");
            require(h.c().sp()==sp,"decimal division leaked native stack");
        }
    }
    for(uint32_t value : {0u,9u,10u,255u,256u,65535u,65536u,0x7fffffffu,0x80000000u,0xffffffffu}) {
        for(unsigned i=0;i<4;++i) h.c().data[20+i]=uint8_t(value>>(8*i));
        h.routine("format_divide_u32_by_10");
        uint32_t quotient=h.word(20)|(uint32_t(h.word(22))<<16);
        require(quotient==value/10 && h.c().data[24]==value%10,"decimal u32 division wrong");
    }
    std::cout<<"decimal division: 2560 byte pairs and 10 u32 boundaries passed\n";
}

void cset(char** args) {
    harness h(args);
    unsigned valid=0, invalid=0;
    for(uint32_t pc : {0x7000u,0x70ffu,0xffffu,0xfffffeu}) {
        for(unsigned secondary=0;secondary<256;++secondary) {
            unsigned flag_count=secondary<0x30?256:2;
            for(unsigned f=0;f<flag_count;++f) {
                unsigned flags=secondary<0x30?f:f*255;
                h.quiet();
                h.asset(pc,{0xf8,uint8_t(secondary),0x00});
                for(unsigned r=0;r<8;++r) h.word(8+2*r,uint16_t(0xa531+r*0x127));
                h.word(28,0x9f0);
                h.word(4,uint16_t(pc)); h.c().data[6]=uint8_t(pc>>16);
                h.c().data[reg::addr::GPIOR0]=uint8_t(flags);
                h.c().data[reg::addr::SREG]=uint8_t(flags^0x42);
                h.c().prev_sreg=h.c().data[reg::addr::SREG];
                h.c().pc=uint16_t(h.sym("seek_and_dispatch_func")); h.tick();
                h.until([&]{return h.boundary();});
                auto regs=h.c().data; auto sp=h.c().sp();
                auto begin=h.c().cycle_count;
                h.tick();
                bool implemented=secondary<0x30;
                h.until([&]{return implemented?h.boundary():
                    h.c().pc==h.sym("invalid_secondary_instruction_func");},200);
                unsigned destination=secondary&7;
                unsigned condition=secondary>>3;
                unsigned bit=condition<2?1:condition<4?0:4;
                unsigned result=((flags>>bit)&1)^(condition&1);
                for(unsigned r=0;r<8;++r) {
                    auto expected=implemented && r==destination?result:
                        unsigned(regs[8+2*r]|regs[9+2*r]<<8);
                    require(h.word(8+2*r)==expected,"CSET result or register preservation wrong");
                }
                require(h.c().data[2]==regs[2] && h.c().data[3]==regs[3] &&
                    h.c().data[7]==regs[7],"CSET changed immutable constants");
                require(h.word(28)==0x9f0 && h.c().sp()==sp,"CSET changed guest/native SP");
                require(h.c().data[reg::addr::GPIOR0]==flags,"CSET changed architectural flags");
                require(std::equal(regs.begin()+0x100,regs.end(),h.c().data.begin()+0x100),
                    "CSET changed SRAM");
                auto next_pc=(pc+(implemented?2:1))&0xffffff;
                require((h.word(4)|(uint32_t(h.c().data[6])<<16))==next_pc,
                    "CSET PC increment/carry wrong");
                if(implemented) {
                    require(h.c().pc==h.sym("primary_table"),"CSET fetched wrong following opcode");
                    require(h.c().cycle_count-begin==41,"CSET latency is not constant 41 cycles");
                    ++valid;
                } else ++invalid;
            }
        }
    }
    std::cout<<"CSET: "<<valid<<" condition/register/flag/PC cases at 41 cycles and "
        <<invalid<<" invalid-encoding cases passed\n";
}
void libm_relocation(char** args) {
    harness h(args);
    // Preserve exact checkpoint results, including the existing tie rounding.
    // Approximate libm fixture tolerances would miss a one-ULP relocation change.
    std::array<uint32_t,4> expected{0x3eed6339u,0x3f8db70du,0x402b6374u,0xc02b6374u};
    unsigned cases=0;
    for(auto operands : {std::make_pair(0x3f800000u,0x40000000u),
                         std::make_pair(0x40000000u,0x3f800000u),
                         std::make_pair(0x3f800000u,0xc0000000u),
                         std::make_pair(0xbf800000u,0xc0000000u)}) {
        for(unsigned i=0;i<4;++i) {
            h.c().data[22+i]=uint8_t(operands.first>>(8*i));
            h.c().data[18+i]=uint8_t(operands.second>>(8*i));
        }
        auto sp=h.c().sp(); auto y=h.word(28);
        h.routine("atan2f");
        auto bits=uint32_t(h.word(22))|(uint32_t(h.word(24))<<16);
        require(bits==expected[cases++],"atan2 relocation changed tie rounding");
        require(h.c().sp()==sp && h.word(28)==y,"atan2 changed native stack or callee-saved Y");
    }
    std::cout<<"libm relocation: four exact atan2 rounding cases passed\n";
}
void format_fields(char** args) {
    harness h(args);
    std::cout<<"startup to first opcode: "<<h.boot_cycles<<" cycles; audio init: "
        <<h.routine("audio_init_func")<<" cycles\n";
    unsigned cases=0, minsp=0xaff;
    auto check=[&](std::string const& format, unsigned width, unsigned precision,
                   bool has_precision, bool program) {
        h.quiet();
        h.asset(0x7000,{0xd7,uint8_t(program?0x30:0x2f),0x00});
        std::vector<uint8_t> bytes(format.begin(),format.end()); bytes.push_back(0);
        if(program) h.asset(0x20000,bytes);
        else std::copy(bytes.begin(),bytes.end(),h.c().data.begin()+0x300);
        h.word(12,0x400); h.word(0x400,7); // va_list contains one int.
        h.word(16,0x100); h.word(18,32);
        h.word(20,program?0:0x300); h.word(22,program?2:0);
        h.word(4,0x7000); h.c().data[6]=0;
        h.c().data[reg::addr::GPIOR0]=5;
        h.c().pc=uint16_t(h.sym("seek_and_dispatch_func")); h.tick();
        h.until([&]{return h.boundary();});
        auto regs=h.c().data; auto sp=h.c().sp(); auto start=h.c().cycle_count;
        h.tick();
        h.until([&]{
            minsp=std::min(minsp,unsigned(h.c().sp()));
            return h.c().pc==h.sym("format_conversion_integer");
        });
        require(h.word(12)==width && h.word(14)==precision,"format field parse/saturation wrong");
        h.until([&]{
            minsp=std::min(minsp,unsigned(h.c().sp()));
            return h.boundary();
        });
        auto cycles=h.c().cycle_count-start;
        auto digits=has_precision?std::max(1u,precision):1u;
        auto count=std::max(width,digits);
        require(h.word(16)==(count>32767?0xffff:count),"format field count wrong");
        for(unsigned i=0;i<std::min(31u,count);++i) {
            auto expected=i<count-digits?' ':i<count-1?'0':'7';
            require(h.c().data[0x100+i]==expected,"format field padding/digits wrong");
        }
        require(h.c().data[0x100+std::min(31u,count)]==0,"format field missing terminator");
        for(unsigned i=8;i<24;++i) if(i!=16 && i!=17)
            require(h.c().data[i]==regs[i],"format field changed guest register");
        require(h.word(28)==uint16_t(regs[28]|regs[29]<<8),"format field changed guest SP");
        require(h.c().data[reg::addr::GPIOR0]==5,"format field changed guest flags");
        require(h.c().sp()==sp,"format field leaked native stack");
        if(format=="%d" || format=="%12.5d" || format=="%65536d" || format=="%.65536d")
            std::cout<<"format "<<(program?"program ":"RAM ")<<format<<": "<<cycles<<" cycles\n";
        ++cases;
    };
    for(bool program : {false,true}) {
        check("%d",0,0,false,program);
        for(auto digits : {"0","1","9","12","6553","65534","65535","65536",
                            "655350","99999999999999999999"}) {
            unsigned value=0;
            for(auto p=digits;*p;++p) value=std::min(65535u,value*10+unsigned(*p-'0'));
            check(std::string("%")+digits+"d",value,0,false,program);
            check(std::string("%.")+digits+"d",0,value,true,program);
        }
        check("%12.5d",12,5,true,program);
        check("%00012.00005d",12,5,true,program);
    }
    require(minsp>=scratch_end,"format field native stack collided with private workspace");
    std::cout<<"format fields: "<<cases<<" RAM/program width/precision cases passed; native stack "
        <<0xb00-minsp<<" bytes\n";
}
void sys_bounds(char** args) {
    harness h(args);
    auto table=h.sym("sys_dispatch_table"), trap=h.sym("invalid_syscall_func");
    auto services=h.sym("sys_dispatch_table_end")-table;
    require(services==0x3d,"SYS table has wrong size");
    for(unsigned id=0;id<256;++id) {
        h.c().data[24]=uint8_t(id); h.word(30,uint16_t(table));
        auto flags=h.c().data[reg::addr::GPIOR0]; auto sp=h.c().sp();
        auto regs=h.c().data;
        h.c().pc=uint16_t(h.sym("sys_dispatch_func"));
        h.until([&]{return h.c().pc==(id<services?table+id:trap);},32);
        if(id>=services) {
            for(unsigned i=0;i<10;++i) h.tick();
            require(h.c().pc==trap,"invalid SYS escaped trap");
        }
        for(unsigned r=2;r<24;++r) require(h.c().data[r]==regs[r],"SYS guard changed guest register");
        require(h.c().data[reg::addr::GPIOR0]==flags,"SYS guard changed guest flags");
        require(h.c().sp()==sp,"SYS guard changed native stack");
    }
    std::cout<<"SYS dispatch: all "<<services<<" services and "<<256-services<<" invalid IDs passed\n";
}
void float_precision(char** args) {
    harness h(args);
    constexpr unsigned value_address=private_end+58;
    unsigned cases=0;
    for(unsigned precision=0;precision<8;++precision) {
        for(uint32_t bits : {0u,1u,0x38d1b469u,0x3f800000u,0x3fc00000u,0x7f7fffffu}) {
            for(unsigned t : {0u,64u}) {
                for(unsigned i=0;i<4;++i) h.c().data[value_address+i]=uint8_t(bits>>(8*i));
                h.c().data[24]=uint8_t(precision); h.c().data[25]=uint8_t(t?60:0);
                h.c().data[18]=0xa5;
                h.c().data[reg::addr::SREG]=uint8_t(t); h.c().prev_sreg=uint8_t(t);
                auto regs=h.c().data; auto sp=h.c().sp();
                h.routine("format_float_call_decimal_engine");
                require(h.c().data[24]==precision,"float engine lost bounded precision");
                for(unsigned r : {14u,15u,17u,18u,28u,29u})
                    require(h.c().data[r]==regs[r],"float engine corrupted formatter state");
                require((h.c().data[reg::addr::SREG]&64)==t,"float engine changed T");
                require(h.c().sp()==sp,"float engine leaked native stack");
                ++cases;
            }
        }
    }
    std::cout<<"float precision: "<<cases<<" precision/value/flag cases passed\n";
}
void hex_fraction(char** args) {
    harness h(args);
    constexpr unsigned digits=private_end+21, conversion=private_end+51, value=private_end+58;
    unsigned cases=0;
    uint64_t minimum=10000, maximum=0;
    auto check=[&](uint32_t significand) {
        for(bool upper : {false,true}) for(unsigned t : {0u,64u}) {
            std::fill_n(h.c().data.begin()+digits-1,8,0xcc);
            for(unsigned i=0;i<4;++i) h.c().data[value+i]=uint8_t(significand>>(8*i));
            h.c().data[conversion]=upper?'A':'a';
            h.c().data[reg::addr::SREG]=uint8_t(t); h.c().prev_sreg=uint8_t(t);
            auto regs=h.c().data; auto sp=h.c().sp();
            auto cycles=h.routine("format_float_hex_generate_six");
            minimum=std::min(minimum,cycles); maximum=std::max(maximum,cycles);
            std::ostringstream expected;
            if(upper) expected<<std::uppercase;
            expected<<std::hex<<std::setw(6)<<std::setfill('0')<<((significand&0x7fffff)<<1);
            auto text=expected.str();
            require(std::equal(text.begin(),text.end(),h.c().data.begin()+digits),
                "hexadecimal fraction digits wrong");
            require(h.c().data[digits-1]==0xcc && h.c().data[digits+6]==0xcc,
                "hexadecimal fraction overwrote adjacent workspace");
            require(std::equal(regs.begin()+value,regs.begin()+value+4,h.c().data.begin()+value),
                "hexadecimal fraction changed source significand");
            for(unsigned r=2;r<20;++r)
                require(h.c().data[r]==regs[r],"hexadecimal fraction corrupted formatter state");
            for(unsigned r : {27u,28u,29u})
                require(h.c().data[r]==regs[r],"hexadecimal fraction corrupted preserved pointer");
            require((h.c().data[reg::addr::SREG]&64)==t,"hexadecimal fraction changed T");
            require(h.c().sp()==sp,"hexadecimal fraction leaked native stack");
            ++cases;
        }
    };
    for(unsigned byte=0;byte<3;++byte) for(unsigned pattern=0;pattern<256;++pattern) {
        unsigned shift=byte*8;
        check((0x95a56bu&~(0xffu<<shift))|(pattern<<shift));
    }
    uint32_t random=0x78a5c123;
    for(unsigned i=0;i<1024;++i) {
        random=random*1664525u+1013904223u;
        check(random&0xffffff);
    }
    for(uint32_t significand : {0u,0x7fffffu,0x800000u,0xffffffu,0x800001u,0xc00000u})
        check(significand);
    std::cout<<"hexadecimal fraction: "<<cases<<" byte-pattern/random/case/T checks passed; "
        <<minimum<<".."<<maximum<<" cycles\n";
}

std::vector<uint8_t> native(std::vector<uint8_t> const& payload, uint32_t count, bool loop=false) {
    std::vector<uint8_t> out{'A','V','M','1',uint8_t(payload.size()),uint8_t(payload.size()>>8),
        uint8_t(payload.size()>>16),uint8_t(loop),uint8_t(count),uint8_t(count>>8),
        uint8_t(count>>16),uint8_t(count>>24)};
    out.insert(out.end(),payload.begin(),payload.end());
    return out;
}
uint32_t u32(std::vector<uint8_t> const& data, unsigned at) {
    return data.at(at)|(uint32_t(data.at(at+1))<<8)|(uint32_t(data.at(at+2))<<16)|(uint32_t(data.at(at+3))<<24);
}
uint32_t remaining_count(harness& h) {
    return h.word(remaining)|(uint32_t(h.word(remaining+2))<<16);
}
void remaining_count(harness& h,uint32_t count) {
    h.word(remaining,uint16_t(count)); h.word(remaining+2,uint16_t(count>>16));
}
std::vector<int> reference(std::vector<uint8_t> const& data) {
    constexpr int steps[]{1,2,3,4,5,6,8,10,12,15,18,22,26,31,36,42};
    std::vector<int> output;
    unsigned offset=12, count=u32(data,8);
    for(unsigned start=0;start<count;start+=256) {
        int last=int(int8_t(data.at(offset++))), before=last;
        unsigned p=data.at(offset++), width=p>>6, mode=(p>>4)&3;
        require(width<3 && mode<3 && (width || !p),"invalid test frame");
        unsigned used=0, packed=0;
        output.push_back(last);
        for(unsigned i=1;i<std::min(256u,count-start);++i) {
            if(width) {
                if(!used) { packed=data.at(offset++); used=8; }
                unsigned symbol=packed&((1<<width)-1); packed>>=width; used-=width;
                int residual=width==1 ? (symbol?1:-1) : int(symbol)*2-3;
                int slope=last-before;
                int prediction=last+(mode==1?slope:mode==2?(slope>=0?slope/2:(slope-1)/2):0);
                before=last;
                last=std::clamp(prediction+residual*steps[p&15],-128,127);
            }
            output.push_back(last);
        }
        require(!packed,"test frame padding wrong");
    }
    require(offset==data.size(),"test reference length wrong");
    return output;
}
void run_stream(harness& h, std::vector<uint8_t> const& data, uint32_t address, unsigned loops=1) {
    auto pcm=reference(data);
    h.asset(address,data);
    h.command(0,address);
    require(h.c().data[status]==1,"valid music rejected");
    require(uint8_t(h.c().data[write_head]-h.c().data[read_head])<=64,"ring overfilled");
    for(unsigned pass=0;pass<loops;++pass) {
        for(unsigned i=0;i<pcm.size();++i) {
            if(h.c().data[pending]) h.elapsed(1);
            auto saved=h.c().data;
            // Native libm can borrow r2. The ISR must not assume ZERO is zero.
            h.c().data[2]=uint8_t(i*17);
            h.synth_sample();
            require(h.c().data[2]==uint8_t(i*17),"ISR changed borrowed zero register");
            h.c().data[2]=saved[2];
            if(i<256) {
                for(unsigned reg=3;reg<32;++reg)
                    require(h.c().data[reg]==saved[reg],"ISR corrupted interrupted registers");
                require(h.c().data[reg::addr::GPIOR0]==saved[reg::addr::GPIOR0],"ISR changed guest flags");
            }
            if(h.c().data[held_sample]!=pcm[i]+128) {
                std::ostringstream error;
                error<<"PCM mismatch sample "<<i<<" pass "<<pass<<": got "<<int(h.c().data[held_sample])-128<<", expected "<<pcm[i];
                throw std::runtime_error(error.str());
            }
            require(h.c().data[underruns]==0,"refilled stream underrun");
        }
    }
    if(!data[7]) {
        h.synth_sample();
        require(h.c().data[status]==0 && h.c().data[held_sample]==128,"one-shot did not stop at exact sample count");
    }
    ++h.cases;
}

void codec_cases(harness& h) {
    uint32_t random=0x971513;
    std::vector<uint8_t> payload;
    // All canonical scales, widths and predictors, with extremes as seeds.
    for(unsigned width=0;width<3;++width) for(unsigned mode=0;mode<3;++mode)
        for(unsigned step=0;step<16;++step) for(unsigned seed : {0u,127u,128u,255u}) {
            if(!width && (mode || step)) continue;
            payload.push_back(uint8_t(seed));
            payload.push_back(uint8_t((width<<6)|(mode<<4)|step));
            unsigned bytes=(255*width+7)/8;
            for(unsigned i=0;i<bytes;++i) {
                random=random*1664525+1013904223;
                auto value=uint8_t(random>>24);
                if(i+1==bytes) value&=uint8_t((1u<<((255*width-1)%8+1))-1);
                payload.push_back(value);
            }
        }
    run_stream(h,native(payload,388*256),0x1fff0);
    for(unsigned n : {1u,2u,3u,4u,7u,8u,9u,254u,255u,256u,257u,511u}) {
        for(unsigned width=0;width<3;++width) {
            std::vector<uint8_t> short_payload;
            for(unsigned at=0;at<n;at+=256) {
                short_payload.insert(short_payload.end(),{128,uint8_t(width<<6)});
                auto size=((std::min(256u,n-at)-1)*width+7)/8;
                short_payload.insert(short_payload.end(),size,0);
            }
            run_stream(h,native(short_payload,n,true),0xfffff8,3);
        }
    }
    std::cout<<"all widths/predictors/scales, saturation, 24-bit wrap and partial loops passed\n";
}

void controls_and_corruption(harness& h) {
    auto data=native({17,0},256,true);
    h.asset(0x10000,data); h.command(0,0x10000); h.synth_sample();
    h.command(3);
    auto frozen=remaining_count(h);
    for(unsigned i=0;i<100;++i) h.synth_sample();
    require(remaining_count(h)==frozen && h.c().data[status]==2 && h.c().data[held_sample]==128,"pause did not freeze decoder");
    h.command(4); h.synth_sample();
    require(remaining_count(h)==frozen-1 && h.c().data[held_sample]==145,"resume changed sample history");
    for(unsigned gain : {0u,1u,64u,128u,180u,255u}) {
        h.command(5,gain); h.synth_sample();
        require(h.c().data[held_sample]==128+17*gain/128,"volume gain wrong");
    }
    for(int sample : {-128,-127,-65,-1,0,1,64,127}) for(unsigned gain : {0u,1u,127u,128u,180u,255u}) {
        auto test=native({uint8_t(sample),0},256,true);
        h.asset(0x10000,test); h.command(0,0x10000); h.command(11,gain); h.synth_sample();
        int product=sample*int(gain), scaled=product>=0?product/128:(product-127)/128;
        require(h.c().data[held_sample]==128+std::clamp(scaled,-128,127),"signed gain/saturation wrong");
    }
    h.command(5,128);
    h.command(2); require(h.c().data[status]==0,"stop failed");
    for(unsigned command : {1u,8u,10u,12u,13u}) {
        h.command(command,0x10000); require(h.c().data[status]==0,"removed SFX/rate command still active");
    }
    h.command(7);
    require(!h.c().data[reg::addr::TIMSK1] && !h.c().data[reg::addr::TCCR4B] &&
        !(h.c().data[reg::addr::PORTC]&0xc0),"disable did not release timers/speakers");
    for(unsigned byte : {0u,1u,2u,3u,7u}) {
        auto bad=data; bad[byte]=255;
        h.asset(0x10000,bad); h.command(0,0x10000);
        require(h.c().data[status]==0,"invalid header accepted");
    }
    for(unsigned parameter : {1u,16u,48u,0x70u,0xb0u,0xc0u,0xffu}) {
        h.asset(0x10000,native({17,uint8_t(parameter)},1)); h.command(0,0x10000); h.synth_sample();
        require(h.c().data[status]==0,"invalid frame accepted");
    }
    auto truncated=native({17,0x80},256);
    h.asset(0x10000,truncated); h.command(0,0x10000); h.synth_sample();
    auto count=remaining_count(h);
    for(unsigned i=0;i<300;++i) { h.elapsed(1); h.synth_sample(); }
    require(remaining_count(h)==count && h.c().data[underruns]==255,"truncated input advanced decoder or wrapped underrun counter");
    ++h.cases;
    std::cout<<"pause/resume, gains, removed commands and malformed/truncated input passed\n";
}

void recording(harness& h,char const* path) {
    std::ifstream input(path,std::ios::binary);
    require(bool(input),"recording asset unavailable");
    std::vector<uint8_t> avax((std::istreambuf_iterator<char>(input)),{});
    std::vector<uint8_t> payload(avax.begin()+34,avax.end());
    auto data=native(payload,u32(avax,10),true);
    run_stream(h,data,0x5fff0,2);
    std::cout<<path<<": two full native loops exactly match scalar PCM8 reference\n";
}

void guest_workload(char** args,bool finish) {
    harness h(args,false);
    auto begin=h.c().cycle_count;
    unsigned minsp=0xaff, frames=0, samples=0;
    bool paused=false, resumed=false;
    while(h.c().cycle_count-begin<32000000 && !h.c().autobreaks.test(AB_BREAK)) {
        auto ms=(h.c().cycle_count-begin)/16000;
        h.c().data[reg::addr::PINB]=!finish &&
            ((ms>=500 && ms<560) || (ms>=800 && ms<860)) ? 0 : 16;
        h.c().data[reg::addr::PINE]=!finish && ms>=200 && ms<260 ? 0 : 64;
        h.c().data[reg::addr::PINF]=0xf0;
        if(h.c().pc==h.sym("sys_display_impl")) ++frames;
        if(h.c().pc==h.sym("timer1_compa_isr")) ++samples;
        paused|=h.c().data[status]==2;
        resumed|=paused && h.c().data[status]==1;
        minsp=std::min(minsp,unsigned(h.c().sp()));
        h.tick(finish);
    }
    require(minsp>=scratch_end,"music/formatter ISR collided with private workspace");
    require(!finish || h.c().autobreaks.test(AB_BREAK),"formatter guest did not finish");
    require(h.c().data[underruns]==0,"autonomous guest streaming underrun");
    if(!finish) {
        require(paused && resumed,"demo pause/resume buttons failed");
        require(frames>=110 && samples>=31000 && samples<=31250,"demo lost frame/sample deadlines");
    }
    if(!finish && h.c().data[status]!=1) {
        std::ostringstream error;
        error<<"demo music stopped: status="<<unsigned(h.c().data[status])
            <<" flags="<<unsigned(h.c().data[0xa18])<<" remaining="<<remaining_count(h)
            <<" param="<<unsigned(h.c().data[0xa30])<<" bits="<<unsigned(h.c().data[bits])
            <<" cursor="<<h.word(cursor)+(unsigned(h.c().data[cursor+2])<<16);
        throw std::runtime_error(error.str());
    }
    std::cout<<"autonomous guest workload: min native SP 0x"<<std::hex<<minsp<<std::dec<<", zero underruns\n";
}
void large_export(char** args) {
    harness h(args,false);
    h.until([&]{return h.boundary() && h.c().data[status]==1;});
    h.quiet();
    // Exercise every hold header in the exported C/C++ object; skip redundant
    // held outputs, which the full-recording tests cover without skipping.
    for(unsigned i=0;i<33000;++i) {
        if(h.c().data[pending]) h.elapsed(1);
        h.c().data[frame_left]=0;
        h.synth_sample();
        require(h.c().data[held_sample]==145 && h.c().data[underruns]==0,"large C/C++ program-space object failed");
        remaining_count(h,(33000-i-1)*256);
    }
    h.elapsed(1); h.synth_sample();
    require(h.c().data[held_sample]==145 && h.c().data[status]==1,"large exported loop failed");
    std::cout<<"C/C++ export: all 33000 frame headers beyond 64 KiB and loop passed\n";
}
}
int main(int argc,char** argv) {
    try {
        std::cout<<std::unitbuf;
        if(argc==6 && std::string(argv[1])=="--workload") {
            char* args[]{argv[0],argv[2],argv[3],argv[4]};
            if(std::string(argv[5])=="large") large_export(args);
            else guest_workload(args,std::string(argv[5])=="finish");
            return 0;
        }
        require(argc>=4 && argc<=8,"usage: avm_audio_tests hex listing idle.bin [demo.bin [c.bin [large_c.bin [large_cpp.bin]]]]");
        decimal_division(argv); cset(argv); libm_relocation(argv); format_fields(argv);
        sys_bounds(argv); float_precision(argv); hex_fraction(argv);
        harness h(argv);
        codec_cases(h); controls_and_corruption(h);
        recording(h,"projects/avm_rpg/assets/music/TownTheme.avax");
        recording(h,"projects/avm_rpg/assets/music/determined_pursuit_loop.avax");
        require(h.isrmax<1024,"decoder exceeded sample period");
        std::cout<<h.cases<<" native codec cases; Timer1 "<<h.isrmin<<".."<<h.isrmax<<" cycles including entry/vector\n";
        for(int i=4;i<argc;++i) {
            char* args[]{argv[0],argv[1],argv[2],argv[i]};
            if(i>=6) large_export(args); else guest_workload(args,i==5);
        }
        return 0;
    } catch(std::exception const& error) { std::cerr<<error.what()<<'\n'; return 1; }
}
