#include <absim.hpp>
#include <absim_regs.hpp>
#include <algorithm>
#include <array>
#include <cmath>
#include <fstream>
#include <iostream>
#include <map>
#include <memory>
#include <sstream>
#include <stdexcept>
#include <vector>

using namespace absim;
namespace {
constexpr unsigned pending=0xa15, volume=0xa17, controls=0xa18, phases=0xa24,
    noise=0xa2c, notes=0xa2d, sfxnotes=0xa35, music=0xa3d, sfx=0xa4c,
    cache=0xa5b, index=0xa7b, length=0xa7c;
void require(bool c, char const* m) { if(!c) throw std::runtime_error(m); }
struct harness {
    std::unique_ptr<arduboy_t> e = std::make_unique<arduboy_t>();
    std::map<std::string,unsigned> symbols;
    unsigned cases=0;
    uint64_t isrmin=10000,isrmax=0,atomicmax=0,latencymax=0;
    atmega32u4_t& c() { return e->core_state.cpu; }
    unsigned sym(char const* name) { return symbols.at(name)/2; }
    uint16_t word(unsigned a) { return uint16_t(c().data[a] | c().data[a+1]<<8); }
    void word(unsigned a, uint16_t v) { c().data[a]=uint8_t(v); c().data[a+1]=uint8_t(v>>8); }
    bool boundary() { unsigned p=c().pc; return p>=sym("primary_table") && p<sym("primary_table")+1024 && (p-sym("primary_table"))%4==0; }
    void tick(bool terminal_break=false) {
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
    harness(char** args, bool isolated=true) {
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
        c().pc=0; // test firmware reset vector, independently of bootloader fuses
        until([&]{return boundary();},2000000);
        require(c().data[reg::addr::PLLFRQ]==0x6a,"PLL must clock Timer4 at 64 MHz");
        require(c().pll_num12==48,"emulator PLL frequency wrong");
        require(c().timer3.ocrNa==255,"Timer3 TOP wrong");
        require(c().timer4.ocrNc==255,"Timer4 TOP wrong");
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
    void quiet() {
        c().st(reg::addr::TIMSK3,0); c().st(reg::addr::TCCR3B,0);
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
    uint64_t command(unsigned command, uint32_t ptr=0, unsigned size=0) {
        quiet();
        word(16,uint16_t(ptr)); word(18,uint16_t(ptr>>16)); word(20,uint16_t(size)); word(22,uint16_t(command));
        auto regs=c().data; auto flags=c().data[reg::addr::GPIOR0]; auto sp=c().sp();
        c().pc=uint16_t(sym("sys_audio_impl")); tick();
        auto t=until([&]{return boundary();});
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
    void play(std::vector<uint8_t> data, uint32_t addr=0x20000, bool effect=false, unsigned initial_ticks=1) {
        asset(addr,data); command(effect?1:0,addr,unsigned(data.size())); quiet();
        if(initial_ticks) elapsed(initial_ticks);
    }
    template<class F> void test(char const* name,F f) {
        command(7); quiet();
        try { f(); } catch(std::exception const& e2) { throw std::runtime_error(std::string(name)+": "+e2.what()); }
        ++cases;
    }
};
void sequence(harness& h) {
    h.test("combined update timing",[&]{
        for(unsigned count : {1,4}) {
            auto mask=uint8_t((1u<<count)-1);
            std::vector<uint8_t> bytes{0xa2,mask,0,mask};
            for(unsigned ch=0;ch<count;++ch) bytes.push_back(uint8_t(60+ch));
            bytes.insert(bytes.end(),{3,uint8_t(mask | (mask<<4))});
            for(unsigned ch=0;ch<count;++ch) bytes.push_back(uint8_t(61+ch));
            for(unsigned ch=0;ch<count;++ch) bytes.push_back(uint8_t(7+ch));
            bytes.insert(bytes.end(),{9,0,1});
            h.play(bytes);
            auto cycles=h.elapsed(4);
            for(unsigned ch=0;ch<count;++ch)
                require(h.c().data[controls+3*ch+2]==7+ch && h.c().data[notes+2*ch]==37+ch,
                    "combined note/volume update wrong");
            std::cout<<count<<"-channel note+volume service: "<<cycles<<" cycles\n";
        }
    });
    h.test("volume-only and continue timing",[&]{
        h.play({0xa2,15,0,15,60,64,67,36,3,0xf0,7,8,9,10,9,0,1});
        for(unsigned ch=0;ch<4;++ch) h.word(phases+2*ch,uint16_t(1234+ch));
        auto cycles=h.elapsed(4);
        for(unsigned ch=0;ch<4;++ch)
            require(h.word(phases+2*ch)==1234+ch && h.c().data[controls+3*ch+2]==7+ch,
                "volume-only update changed phase or lost amplitude");
        std::cout<<"4-channel volume-only service: "<<cycles<<" cycles\n";
        h.play({0xa2,1,0,1,60,3,0,0,9,0,1});
        h.word(phases,1234);
        cycles=h.elapsed(4);
        require(h.word(phases)==1234 && h.c().data[controls+2]==24,"continue changed oscillator");
        std::cout<<"continue service: "<<cycles<<" cycles\n";
    });
    h.test("progression/rest/long delta",[&]{
        h.play({0xa2,15,0,15,60,64,67,36,4,1,0x80,255,0,0,43,2,65,0,0,1});
        require(h.c().data[notes]==36 && h.c().data[notes+2]==40,"simultaneous notes wrong");
        require(h.word(controls)>0 && h.word(controls+3)>0 && h.word(controls+6)>0 && h.word(controls+9)>0,"four voices missing");
        auto sparse=h.elapsed(3); require(h.word(music+10)==2,"sparse countdown wrong");
        std::cout<<"sparse tick service: "<<sparse<<" cycles\n";
        auto event=h.elapsed(2); require(h.c().data[controls+2]==0,"note off wrong");
        std::cout<<"note-off service: "<<event<<" cycles\n";
        require(h.word(music+10)==256,"256-tick delta wrong");
        h.elapsed(255); require(h.word(music+10)==1,"large catch-up wrong");
        h.elapsed(1); require(h.word(music+10)==44 && h.c().data[notes]==0x80,"continue changed state or delay");
        h.elapsed(44); require(h.c().data[notes+2]==41 && h.c().data[music+12]==1,"long wait update wrong");
        h.elapsed(1); require(h.c().data[music+12]==0,"end of song wrong");
    });
    h.test("positive delta loop and dense catch-up",[&]{
        h.play({0xa2,1,0,1,60,0,1,61,0,0,2},0x20000,false,0);
        require(h.word(music+10)==1 && h.c().data[controls+2]==0,"first note started before its delay");
        h.elapsed(1); require(h.c().data[notes]==36,"0x00 did not wait one tick");
        h.elapsed(1); require(h.c().data[notes]==37,"second one-tick update wrong");
        h.elapsed(1); require(h.word(music+10)==1 && h.c().data[notes]==37,"loop should retain state until next update");
        h.elapsed(255); require(h.c().data[music+12]==1 && h.word(music+10)==1,"dense positive-time loop failed");
    });
    h.test("256-tick initial delay",[&]{
        h.play({0xa2,1,255,1,60,0,0,1},0x20000,false,0);
        require(h.word(music+10)==256 && h.c().data[controls+2]==0,"initial 0xff delay wrong");
        h.elapsed(255);
        require(h.word(music+10)==1 && h.c().data[controls+2]==0,"maximum delay fired early");
        h.elapsed(1);
        require(h.c().data[controls+2]==24 && h.c().data[notes]==36,"maximum delay did not fire");
        h.elapsed(1); require(h.c().data[music+12]==0,"end command did not consume one tick");
    });
    h.test("continue-only timed loop",[&]{
        h.play({0xa2,1,0,0,0,0,0,2});
        h.word(phases,1234);
        h.elapsed(255);
        require(h.c().data[music+12]==1 && h.word(music+10)==1,"continue/loop catch-up failed");
        require(h.word(phases)==1234 && h.c().data[notes]==0x80,"continue/loop changed channel state");
    });
    h.test("SFX priority/release",[&]{
        h.play({0xa2,15,0,15,60,64,67,36,3,2,66,19,0,2});
        auto musicinc=h.word(controls+3);
        h.play({0xa2,2,0,2,80,7,0,1},0x21000,true);
        require(h.word(controls+3)!=musicinc && h.word(controls)>0,"SFX did not coexist");
        h.elapsed(3); require(h.c().data[notes+2]==42 && h.c().data[sfxnotes+2]==56,"music did not progress beneath SFX");
        h.elapsed(5); require(h.c().data[sfx+12]==0 && h.c().data[sfx+13]==0,"SFX did not release");
        require(h.word(controls+3)==uint16_t(std::lround(440*std::pow(2.,(66-69)/12.)*65536/7812.5)),"music state not restored");
    });
    h.test("pause/resume/volume/stop/change",[&]{
        h.play({0xa2,1,0,1,60,9,1,61,9,0,2});
        h.command(3); h.elapsed(25); require(h.word(music+10)==10 && h.c().data[controls+2]==0,"pause wrong");
        h.command(9); require(h.word(16)==2,"paused status wrong");
        h.command(4); h.elapsed(3); require(h.word(music+10)==7 && h.c().data[controls+2]==24,"resume wrong");
        h.command(5,16); require(h.c().data[controls+2]==12,"master volume wrong");
        h.command(2); require(h.c().data[controls+2]==0,"stop wrong");
        h.command(4); require(h.c().data[music+12]==0,"resume resurrected stopped stream");
        h.command(5,32); h.play({0xa2,1,0,1,70,9,0,1}); require(h.c().data[notes]==46,"song change wrong");
        h.command(10, (69u<<16)|2u, 31); // r4 channel, r5 note, r6 amplitude
        require(h.c().data[sfx+13]==4 && h.c().data[controls+8]==31,"direct tone ownership/amplitude wrong");
        require(h.word(controls+6)==3691,"direct tone tuning wrong");
        h.elapsed(255); require(h.word(controls+6)==3691,"direct tone advanced a stream");
        h.command(8); require(h.c().data[controls+8]==0,"direct tone did not release");
    });
    h.test("retained volume/retrigger",[&]{
        h.play({0xa2,1,0,0x11,60,31,3,0x10,7,3,1,60,9,0,1});
        require(h.c().data[controls+2]==31,"note did not retain explicit volume");
        h.word(phases,1234); h.elapsed(4); require(h.c().data[controls+2]==7 && h.word(phases)==1234,"volume retriggered oscillator");
        h.elapsed(4); require(h.word(phases)==0,"same-note retrigger missing");
    });
    h.test("malformed headers/values/control/truncation",[&]{
        for(auto const& bytes : std::vector<std::vector<uint8_t>>{
                {},{0xa2},{0xa2,0},{0xa2,16},{0xa1,1,0,1,60,9,0x40},
                {0xa2,1,0},{0xa2,1,0,2,60,9,0,1},{0xa2,1,0,0x20,7,9,0,1},
                {0xa2,1,0,1,10,9,0,1},{0xa2,1,0,1,96,9,0,1},
                {0xa2,1,0,1,0xc0,9,0,1},{0xa2,1,0,0x10,32,9,0,1},
                {0xa2,1,0,0},{0xa2,1,0,0,3,9,0,1},
                {0xa2,1,0,0x11,60},{0xa2,1,0,1,60}}) {
            h.play(bytes); require(h.c().data[music+12]==0,"malformed stream stayed active");
        }
    });
    h.test("cache/address boundaries/multiple transactions",[&]{
        std::vector<uint8_t> bytes{0xa2,1};
        for(int i=0;i<60;++i) bytes.insert(bytes.end(),{0,1,uint8_t(36+i%60)});
        bytes.insert(bytes.end(),{255,0,2});
        for(auto address : {0xfff0u,0x1fff0u,0x7fff0u}) {
            h.play(bytes,address); h.elapsed(59);
            require(h.c().data[notes]==uint8_t(12+59%60),"cache boundary byte corruption");
            require(h.word(music+10)==256,"max delta wrong");
            h.elapsed(255); require(h.word(music+10)==1,"max delta subtraction wrong");
            h.elapsed(1); require(h.word(music+10)==1 && h.c().data[music+12]==1,"max-delay loop wrong");
        }
    });
    h.test("pending saturation and Timer0 preservation",[&]{
        h.c().data[pending]=254; h.c().data[0xa16]=0;
        auto zero=h.c().data[2]; h.c().data[2]=0x5a;
        auto regs=h.c().data;
        uint64_t min=1000,max=0;
        for(int i=0;i<12;++i) { auto t=h.routine("timer0_compa_isr",true)+7; min=std::min(min,t); max=std::max(max,t); }
        require(h.c().data[pending]==255,"pending counter wrapped");
        for(unsigned i=0;i<32;++i) require(h.c().data[i]==regs[i],"Timer0 corrupted registers");
        std::cout<<"Timer0 total including entry/vector: "<<min<<".."<<max<<" cycles\n";
        h.c().data[2]=zero; // normal-context safe points restore ZERO first
        h.elapsed(255); require(h.c().data[pending]==0,"pending snapshot not cleared");
        for(unsigned i=0;i<4;++i) h.c().data[0xa05+i]=255;
        h.c().data[0xa16]=3;
        h.c().data[2]=0x5a;
        auto worst=h.routine("timer0_compa_isr",true)+7;
        std::cout<<"Timer0 with full millis carry and audio tick: "<<worst<<" cycles\n";
        require(worst==63,"Timer0 worst path changed");
        h.c().data[2]=zero;
    });
    h.test("10/50/100 ms delayed servicing",[&]{
        for(unsigned ms : {10,50,100}) {
            h.play({0xa2,1,0,1,60,4,1,61,4,0,2});
            h.c().data[pending]=0; h.c().data[0xa16]=0;
            auto latch=h.word(controls);
            for(unsigned i=0;i<ms;++i) {
                h.routine("timer0_compa_isr",true);
                h.routine("timer3_compa_isr",true);
                require(h.word(controls)==latch && h.word(music+10)==5,
                    "interrupts advanced the song instead of holding the current latch");
            }
            require(h.c().data[pending]==ms/4,"delayed pending time wrong");
            h.elapsed(ms/4);
            auto position=(1+ms/4)%11;
            require(h.word(music+10)==(position==0?1:position<6?6-position:11-position),"delayed catch-up countdown wrong");
            require(h.c().data[notes]==36+(position==0 || position>=6),"delayed catch-up note wrong");
        }
    });
}
void synthesis(harness& h) {
    h.test("sample reference and register preservation",[&]{
        std::array<uint16_t,4> phase{{65520,0x7fff,1234,65500}},inc{{100,3691,257,8000}};
        std::array<uint8_t,4> amp{{31,31,31,31}};
        uint8_t lfsr=1;
        for(int i=0;i<4;++i) { h.word(phases+2*i,phase[i]); h.word(controls+3*i,inc[i]); h.c().data[controls+3*i+2]=amp[i]; }
        h.c().data[noise]=lfsr;
        auto zero=h.c().data[2];
        h.c().data[2]=0x5a; // direct floating-point paths borrow r2
        auto regs=h.c().data; auto sp=h.c().sp();
        for(unsigned n=0;n<1024;++n) {
            int duty=128;
            for(int i=0;i<4;++i) {
                auto sum=uint32_t(phase[i])+inc[i]; phase[i]=uint16_t(sum);
                if(i==3) { if(sum>65535) lfsr=uint8_t((lfsr>>1)^((lfsr&1)?0xb8:0)); duty+=(lfsr&1)?-amp[i]:amp[i]; }
                else duty+=(phase[i]&0x8000)?-amp[i]:amp[i];
            }
            auto t=h.routine("timer3_compa_isr",true)+7;
            h.isrmin=std::min(h.isrmin,t); h.isrmax=std::max(h.isrmax,t);
            require(duty>=4 && duty<=252,"mix overflow");
            require(h.c().timer4.ocrNa_next==duty,"assembly sample disagrees with reference");
            require(h.c().data[noise]==lfsr,"LFSR mismatch");
            for(unsigned i=0;i<32;++i) require(h.c().data[i]==regs[i],"synth ISR corrupted registers");
            require(h.c().sp()==sp,"synth ISR stack leak");
        }
        for(int i=0;i<4;++i) require(h.word(phases+2*i)==phase[i],"phase wrap mismatch");
        for(int i=0;i<4;++i) h.c().data[controls+3*i+2]=0;
        h.routine("timer3_compa_isr",true); require(h.c().timer4.ocrNa_next==128,"silence wrong");
        h.c().data[2]=zero;
    });
    h.test("note tuning",[&]{
        double maxcents=0;
        for(int note=24;note<=95;++note) {
            h.play({0xa2,1,0,1,uint8_t(note),9,0,1});
            auto expected=440*std::pow(2.,(note-69)/12.);
            auto rounded=uint16_t(std::lround(expected*65536/7812.5));
            require(h.word(controls)==rounded,"note table rounding wrong");
            maxcents=std::max(maxcents,std::abs(1200*std::log2(rounded*7812.5/65536/expected)));
        }
        std::cout<<"maximum tuning error: "<<maxcents<<" cents\n";
    });
}
void automatic(harness& h) {
    h.test("FX burst and atomic commit timing",[&]{
        std::vector<uint8_t> bytes(96);
        for(unsigned i=0;i<bytes.size();++i) bytes[i]=uint8_t(i*13);
        h.asset(0x23000,bytes);
        for(unsigned count : {16,32,64}) {
            h.c().data[24]=0; h.c().data[25]=0x30; h.c().data[26]=2;
            h.c().data[0]=uint8_t(count); h.c().data[1]=0;
            h.word(30,0x100);
            auto t=h.routine("fx_read_program_bytes_func");
            require(std::equal(bytes.begin(),bytes.begin()+count,h.c().data.begin()+0x100),"FX burst corrupted data");
            std::cout<<count<<" byte FX burst: "<<t<<" cycles\n";
        }
        unsigned interrupted_reads=0;
        for(unsigned phase=0;phase<32;++phase) {
            h.quiet();
            h.c().data[24]=0; h.c().data[25]=0x30; h.c().data[26]=2;
            h.c().data[0]=64; h.c().data[1]=0; h.word(30,0x100);
            h.c().st(reg::addr::TCNT3H,0);
            h.c().st(reg::addr::TCNT3L,uint8_t(255-phase));
            h.c().st(reg::addr::TIFR3,2);
            h.c().st(reg::addr::TCCR3B,10); h.c().st(reg::addr::TIMSK3,2);
            auto dest=h.sym("primary_table");
            h.c().push(uint8_t(dest)); h.c().push(uint8_t(dest>>8));
            h.c().pc=uint16_t(h.sym("fx_read_program_bytes_func"));
            while(h.c().pc!=dest) {
                if(h.c().pc==h.sym("timer3_compa_isr") && h.c().spi_busy) ++interrupted_reads;
                h.tick();
            }
            require(std::equal(bytes.begin(),bytes.begin()+64,h.c().data.begin()+0x100),"interrupt corrupted FX burst");
            require(!h.c().autobreaks.test(AB_SPI_WCOL),"SPI collision during audio interrupt");
        }
        require(interrupted_reads>0,"SPI interruption test did not interrupt an active transfer");
        h.quiet();
        std::cout<<"FX reads interrupted with SPI active: "<<interrupted_reads<<"\n";
        h.play({0xa2,15,0,15,60,64,67,36,0,15,61,65,68,37,9,0,2});
        h.quiet(); h.c().data[pending]=1;
        auto dest=h.sym("primary_table");
        h.c().push(uint8_t(dest)); h.c().push(uint8_t(dest>>8));
        h.c().pc=uint16_t(h.sym("audio_service_func"));
        h.until([&]{return h.c().pc==h.sym("audio_commit_atomic_begin");});
        auto t=h.until([&]{return h.c().pc==h.sym("audio_commit_atomic_end");});
        require(t<=107,"global commit exceeded cycle bound");
        h.atomicmax=std::max(h.atomicmax,t+1);
        h.until([&]{return h.c().pc==dest;});
        std::cout<<"global chord commit, including SREG restore: "<<t+1<<" cycles\n";
    });
    h.test("seek overhead and SPI continuation",[&]{
        auto measure=[&](char const* name){h.quiet();h.c().pc=uint16_t(h.sym(name));auto start=h.c().cycle_count;h.tick();h.until([&]{return h.boundary();});return h.c().cycle_count-start;};
        h.c().data[pending]=0;
        auto bare=measure("seek_and_dispatch_no_audio");
        auto hooked=measure("seek_and_dispatch_func_disabled");
        require(hooked-bare==4,"seek hook overhead changed");
        h.c().data[pending]=1;
        auto inactive=measure("seek_and_dispatch_func_disabled");
        std::cout<<"inactive pending-tick seek overhead: "<<inactive-bare<<" cycles\n";
        h.play({0xa2,1,0,1,60,99,0,1}); h.c().data[pending]=1;
        std::cout<<"active countdown seek overhead: "<<measure("seek_and_dispatch_func_disabled")-bare<<" cycles\n";
        h.play({0xa2,15,0,15,60,64,67,36,1,15,61,65,68,37,9,0,2});
        auto pc=h.word(4)|(uint32_t(h.c().data[6])<<16);
        h.c().data[pending]=3;
        measure("seek_and_dispatch_func_disabled");
        require((h.word(4)|(uint32_t(h.c().data[6])<<16))==pc,"seek changed continuation PC");
        auto flashpc=(uint32_t(h.word(0xa00))<<8)+pc;
        auto& flash=h.e->peripherals.fx;
        auto opcode=(*flash.sectors[flashpc/4096])[flashpc%4096];
        require(h.c().pc==h.sym("primary_table")+4*opcode,"wrong opcode after song SPI reads");
        std::cout<<"inactive seek hook: "<<hooked-bare<<" cycles\n";
    });
    h.test("autonomous idle/timer coincidence/SPI",[&]{
        h.play({0xa2,15,0,15,60,64,67,36,4,15,61,65,68,37,4,0,2});
        h.command(6);
        h.c().st(reg::addr::TCCR0B,3); h.c().st(reg::addr::TIMSK0,2);
        h.c().data[pending]=0; h.c().data[0xa16]=0;
        h.routine("interp_delay_17");
        h.c().pc=uint16_t(h.sym("seek_and_dispatch_func"));
        auto end=h.c().cycle_count+1600000;
        uint64_t last=h.c().cycle_count;
        while(h.c().cycle_count<end) {
            if(h.c().pc==h.sym("audio_service_func")) { h.latencymax=std::max(h.latencymax,h.c().cycle_count-last); last=h.c().cycle_count; }
            h.tick();
        }
        require(h.c().data[music+12]==1,"idle music failed");
        if(h.c().data[pending]>1) {
            std::cerr<<"idle diagnostics: pending="<<unsigned(h.c().data[pending])<<" nativePC="<<std::hex<<h.c().pc*2<<" guestPC="<<(h.word(4)|(uint32_t(h.c().data[6])<<16))<<std::dec<<" serviceGap="<<h.latencymax<<"\n";
            require(false,"idle sequencer starvation");
        }
        require(h.c().data[noise]!=0,"noise stuck during interrupts");
        h.c().st(reg::addr::TIMSK0,0); h.c().st(reg::addr::TCCR0B,0); h.quiet();
    });
}
void demo(char** args) {
    harness h(args,false);
    auto begin=h.c().cycle_count;
    uint64_t last=begin, maxgap=0;
    unsigned frames=0, samples=0, minsp=0xaff;
    bool effect=false, paused=false, resumed=false;
    while(h.c().cycle_count-begin<16000000) {
        auto ms=(h.c().cycle_count-begin)/16000;
        h.c().data[reg::addr::PINB]=((ms>=500 && ms<560)||(ms>=800 && ms<860))?0:16;
        h.c().data[reg::addr::PINE]=(ms>=200 && ms<260)?0:64;
        h.c().data[reg::addr::PINF]=0xf0;
        if(h.c().pc==h.sym("audio_service_func")) {
            maxgap=std::max(maxgap,h.c().cycle_count-last); last=h.c().cycle_count;
        }
        if(h.c().pc==h.sym("sys_display_impl")) ++frames;
        if(h.c().pc==h.sym("timer3_compa_isr")) ++samples;
        minsp=std::min(minsp,unsigned(h.c().sp()));
        effect|=h.c().data[sfx+12]==1;
        paused|=h.c().data[music+12]==2;
        resumed|=paused && h.c().data[music+12]==1;
        h.tick();
    }
    require(frames>=55,"demo failed to render at its configured frame rate");
    require(samples>=7750 && samples<=7820,"demo sample clock lost interrupts");
    require(effect && paused && resumed,"demo button controls failed");
    require(minsp>=0xac6,"demo native stack collided with private workspace");
    require(!h.c().autobreaks.test(AB_SPI_WCOL),"demo SPI collision");
    require(h.c().data[music+12]==1,"demo music did not continue automatically");
    std::cout<<"animated demo: "<<frames<<" frames, "<<samples<<" samples, service gap "
        <<maxgap/16000.<<" ms, native stack "<<0xb00-minsp<<" bytes; SFX/pause/resume passed\n";
}
void formatter(char** args) {
    harness h(args,false);
    unsigned minsp=0xaff;
    auto begin=h.c().cycle_count;
    while(!h.c().autobreaks.test(AB_BREAK) && h.c().cycle_count-begin<32000000) {
        minsp=std::min(minsp,unsigned(h.c().sp()));
        h.tick(true);
    }
    require(h.c().autobreaks.test(AB_BREAK),"audio formatter workload did not finish");
    require(minsp>=0xac6,"formatter/audio interrupts collided with private workspace");
    require(!h.c().autobreaks.test(AB_SPI_WCOL),"formatter/audio SPI collision");
    std::cout<<"libm/formatter with sample interrupts: native stack "<<0xb00-minsp<<" bytes\n";
}
}
int main(int argc,char** argv) {
    try {
        require(argc>=4 && argc<=6,"usage: avm_audio_tests interpreter.hex interpreter.lst audio.bin [audio_demo.bin [audio_c_test.bin]]");
        harness h(argv); sequence(h); synthesis(h); automatic(h);
        std::cout<<h.cases<<" native audio cases passed\n"
            <<"Timer3 including entry/vector: "<<h.isrmin<<".."<<h.isrmax<<" cycles; CPU "
            <<100.*h.isrmax/2048<<"%\n"
            <<"observed idle service gap: "<<h.latencymax/16000.<<" ms\n";
        if(argc>=5) {
            char* demoargs[]{argv[0],argv[1],argv[2],argv[4]};
            demo(demoargs);
        }
        if(argc==6) {
            char* formatargs[]{argv[0],argv[1],argv[2],argv[5]};
            formatter(formatargs);
        }
        return 0;
    } catch(std::exception const& e) { std::cerr<<e.what()<<'\n';return 1; }
}
