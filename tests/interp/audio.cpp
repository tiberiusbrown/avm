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
constexpr unsigned pending=0xa15, volume=0xa17, controls=0xa18, banks=0xa24,
    sfxvolume=0xa27, phases=0xa28, noise=0xa30, notes=0xa31, sfxnotes=0xa39,
    music=0xa41, sfx=0xa50, cache=0xa5f, index=0xa7f, length=0xa80;
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
    unsigned amplitude(unsigned channel) {
        return c().data[controls+3*channel+2];
    }
    void control(unsigned channel, unsigned amp, unsigned wave=0) {
        c().data[controls+3*channel+2]=uint8_t(amp);
        if(channel<3) c().data[banks+channel]=uint8_t(wave<<6);
    }
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
        require(c().data[volume]==32 && c().data[sfxvolume]==32,"default audio masters wrong");
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
        command(7); command(5,32); quiet();
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
                require(h.amplitude(ch)==7+ch && h.c().data[notes+2*ch]==37+ch,
                    "combined note/volume update wrong");
            std::cout<<count<<"-channel note+volume service: "<<cycles<<" cycles\n";
        }
    });
    h.test("volume-only and continue timing",[&]{
        h.play({0xa2,15,0,15,60,64,67,36,3,0xf0,7,8,9,10,9,0,1});
        for(unsigned ch=0;ch<4;++ch) h.word(phases+2*ch,uint16_t(1234+ch));
        auto cycles=h.elapsed(4);
        for(unsigned ch=0;ch<4;++ch)
            require(h.word(phases+2*ch)==1234+ch && h.amplitude(ch)==7+ch,
                "volume-only update changed phase or lost amplitude");
        std::cout<<"4-channel volume-only service: "<<cycles<<" cycles\n";
        h.play({0xa2,1,0,1,60,3,0,0,9,0,1});
        h.word(phases,1234);
        cycles=h.elapsed(4);
        require(h.word(phases)==1234 && h.amplitude(0)==24,"continue changed oscillator");
        std::cout<<"continue service: "<<cycles<<" cycles\n";
    });
    h.test("progression/rest/long delta",[&]{
        h.play({0xa2,15,0,15,60,64,67,36,4,1,0x80,255,0,0,43,2,65,0,0,1});
        require(h.c().data[notes]==36 && h.c().data[notes+2]==40,"simultaneous notes wrong");
        require(h.word(controls)>0 && h.word(controls+3)>0 && h.word(controls+6)>0 && h.word(controls+9)>0,"four voices missing");
        auto sparse=h.elapsed(3); require(h.word(music+10)==2,"sparse countdown wrong");
        std::cout<<"sparse tick service: "<<sparse<<" cycles\n";
        auto event=h.elapsed(2); require(h.amplitude(0)==0,"note off wrong");
        std::cout<<"note-off service: "<<event<<" cycles\n";
        require(h.word(music+10)==256,"256-tick delta wrong");
        h.elapsed(255); require(h.word(music+10)==1,"large catch-up wrong");
        h.elapsed(1); require(h.word(music+10)==44 && h.c().data[notes]==0x80,"continue changed state or delay");
        h.elapsed(44); require(h.c().data[notes+2]==41 && h.c().data[music+12]==1,"long wait update wrong");
        h.elapsed(1); require(h.c().data[music+12]==0,"end of song wrong");
    });
    h.test("positive delta loop and dense catch-up",[&]{
        h.play({0xa2,1,0,1,60,0,1,61,0,0,2},0x20000,false,0);
        require(h.word(music+10)==1 && h.amplitude(0)==0,"first note started before its delay");
        h.elapsed(1); require(h.c().data[notes]==36,"0x00 did not wait one tick");
        h.elapsed(1); require(h.c().data[notes]==37,"second one-tick update wrong");
        h.elapsed(1); require(h.word(music+10)==1 && h.c().data[notes]==37,"loop should retain state until next update");
        h.elapsed(255); require(h.c().data[music+12]==1 && h.word(music+10)==1,"dense positive-time loop failed");
    });
    h.test("256-tick initial delay",[&]{
        h.play({0xa2,1,255,1,60,0,0,1},0x20000,false,0);
        require(h.word(music+10)==256 && h.amplitude(0)==0,"initial 0xff delay wrong");
        h.elapsed(255);
        require(h.word(music+10)==1 && h.amplitude(0)==0,"maximum delay fired early");
        h.elapsed(1);
        require(h.amplitude(0)==24 && h.c().data[notes]==36,"maximum delay did not fire");
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
        h.command(3); h.elapsed(25); require(h.word(music+10)==10 && h.amplitude(0)==0,"pause wrong");
        h.command(9); require(h.word(16)==2,"paused status wrong");
        h.command(4); h.elapsed(3); require(h.word(music+10)==7 && h.amplitude(0)==24,"resume wrong");
        h.command(5,16);
        require(h.c().data[volume]==16 && h.amplitude(0)==12 && h.c().data[notes+1]==24,
            "master gain did not prepare amplitude or changed desired volume");
        h.word(phases,0); h.word(controls,0);
        h.routine("timer3_compa_isr",true);
        require(h.c().timer4.ocrNa_next==140,"master gain output wrong");
        h.command(2); require(h.amplitude(0)==0,"stop wrong");
        h.command(4); require(h.c().data[music+12]==0,"resume resurrected stopped stream");
        h.command(5,32); h.play({0xa2,1,0,1,70,9,0,1}); require(h.c().data[notes]==46,"song change wrong");
        h.command(10, (69u<<16)|2u, 31); // r4 channel, r5 note, r6 amplitude
        require(h.c().data[sfx+13]==4 && h.amplitude(2)==31,"direct tone ownership/amplitude wrong");
        require(h.word(controls+6)==3691,"direct tone tuning wrong");
        h.elapsed(255); require(h.word(controls+6)==3691,"direct tone advanced a stream");
        h.command(8); require(h.amplitude(2)==0,"direct tone did not release");
    });
    h.test("retained volume/retrigger",[&]{
        h.play({0xa2,1,0,0x11,60,31,3,0x10,7,3,1,60,9,0,1});
        require(h.amplitude(0)==31,"note did not retain explicit volume");
        h.word(phases,1234); h.elapsed(4); require(h.amplitude(0)==7 && h.word(phases)==1234,"volume retriggered oscillator");
        h.elapsed(4); require(h.word(phases)==0,"same-note retrigger missing");
    });
    h.test("all packed controls and ignored high bit",[&]{
        h.command(5,32);
        std::vector<uint8_t> bytes{0xa2,15,0,255,60,64,67,36,0,0,0,0};
        for(unsigned value=0;value<256;++value)
            bytes.insert(bytes.end(),{0,0xf0,uint8_t(value),uint8_t(value),uint8_t(value),uint8_t(value)});
        bytes.insert(bytes.end(),{255,0,1});
        h.play(bytes);
        for(unsigned ch=0;ch<4;++ch) h.word(phases+2*ch,uint16_t(1234+ch));
        for(unsigned value=0;value<256;++value) {
            h.elapsed(1);
            require(h.c().data[music+12]==1,"packed control incorrectly rejected");
            for(unsigned ch=0;ch<4;++ch) {
                require(h.amplitude(ch)==(value&31),"packed control volume/high bit wrong");
                if(ch<3) require(h.c().data[banks+ch]==(value&0x60)<<1,
                    "packed control waveform/high bit wrong");
                require(h.word(phases+2*ch)==1234+ch,"waveform/volume update reset phase");
            }
        }
    });
    h.test("full initial state across loops",[&]{
        h.play({0xa2,3,0,0x33,60,128,0x6c,24,
            0,0x33,70,65,0x41,0x23,0,0,2});
        require(h.amplitude(0)==12 && h.c().data[banks]==0xc0 && h.amplitude(1)==0,
            "first event initialization wrong");
        h.elapsed(1); require(h.amplitude(0)==1 && h.c().data[banks]==0x80 && h.amplitude(1)==3,
            "later state wrong");
        h.elapsed(1); h.word(phases,1234); h.elapsed(1);
        require(h.amplitude(0)==12 && h.c().data[banks]==0xc0 && h.c().data[notes]==36,
            "loop did not restore starting waveform/volume/note");
        require(h.amplitude(1)==0 && h.c().data[notes+2]==128 && h.word(phases)==0,
            "loop did not silence late channel and retrigger first note");
    });
    h.test("SFX waveform ownership and restoration",[&]{
        h.play({0xa2,1,0,0x11,60,0x6c,3,0x10,0x27,99,0,2});
        h.play({0xa2,1,0,0x11,80,0x5f,7,0,1},0x21000,true);
        require(h.amplitude(0)==31 && h.c().data[banks]==0x80,"SFX waveform did not override music");
        h.elapsed(3); require(h.c().data[notes+1]==0x27,"hidden music waveform did not advance");
        h.elapsed(5); require(h.amplitude(0)==7 && h.c().data[banks]==0x40,"SFX release lost music waveform");
    });
    h.test("malformed headers/values/control/truncation",[&]{
        for(auto const& bytes : std::vector<std::vector<uint8_t>>{
                {},{0xa2},{0xa2,0},{0xa2,16},{0xa1,1,0,1,60,9,0x40},
                {0xa2,1,0},{0xa2,1,0,2,60,9,0,1},{0xa2,1,0,0x20,7,9,0,1},
                {0xa2,1,0,1,10,9,0,1},{0xa2,1,0,1,96,9,0,1},
                {0xa2,1,0,1,0xc0,9,0,1},
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
    h.test("global gain command and SFX",[&]{
        h.play({0xa2,15,0,255,60,64,67,36,7,11,15,19,255,0,2});
        h.play({0xa2,4,0,0x44,69,31,255,0,1},0x21000,true);
        auto latch=h.c().data;
        auto musicwait=h.word(music+10), effectwait=h.word(sfx+10);
        for(unsigned value=0;value<256;++value) {
            for(unsigned ch=0;ch<4;++ch) h.word(phases+2*ch,0);
            h.c().data[noise]=2; // positive noise, no phase overflow
            h.command(5,value);
            require(h.c().data[volume]==value && h.c().data[sfxvolume]==value,
                "global gain did not set both full-byte masters");
            int mix=0;
            for(unsigned ch=0;ch<4;++ch) {
                unsigned desired=ch==2 ? 31 : 7+4*ch;
                auto amp=desired*value/32;
                require(h.amplitude(ch)==amp,"master gain did not prepare owner amplitude");
                require(h.word(phases+2*ch)==0,"master gain reset phase");
                for(unsigned byte=0;byte<2;++byte)
                    require(h.c().data[controls+3*ch+byte]==latch[controls+3*ch+byte],
                        "master gain changed note increment");
                if(ch<3) {
                    require(h.c().data[banks+ch]==latch[banks+ch],"master gain changed waveform");
                    mix+=int(std::floor(127.*amp/128.+0.5));
                } else mix+=int(amp);
            }
            for(unsigned byte=0;byte<16;++byte)
                require(h.c().data[notes+byte]==latch[notes+byte],"master gain changed desired state");
            require(h.word(music+10)==musicwait && h.word(sfx+10)==effectwait,
                "master gain changed sequencing time");
            h.routine("timer3_compa_isr",true);
            require(h.c().timer4.ocrNa_next==std::clamp(128+mix,0,255),
                "gain did not apply to combined music and SFX");
        }
        h.command(5,0); h.command(10,69u<<16,31);
        h.routine("timer3_compa_isr",true);
        require(h.amplitude(0)==0 && h.c().data[sfxnotes+1]==31 && h.c().timer4.ocrNa_next==128,
            "zero global gain failed to mute direct tone");
        h.command(5,32);
    });
    h.test("independent gains, ownership, pause, and direct tones",[&]{
        h.play({0xa2,15,0,255,60,64,67,36,0x27,0x4b,0x6f,19,
            3,0x11,62,0x6d,255,0,2});
        h.play({0xa2,5,0,0x55,80,69,0x5f,0x2f,7,0,1},0x21000,true);
        h.command(11,16); h.command(12,96);
        require(h.c().data[volume]==16 && h.c().data[sfxvolume]==96,"independent masters wrong");
        for(unsigned ch=0;ch<4;++ch) h.word(phases+2*ch,uint16_t(4321+ch));
        h.command(11,0);
        require(h.amplitude(0)==93 && h.amplitude(1)==0 && h.amplitude(2)==45 && h.amplitude(3)==0,
            "music mute changed SFX or failed to mute music");
        h.command(12,0);
        require(h.amplitude(0)==0 && h.c().data[sfx+13]==5,"SFX mute released ownership");
        h.command(11,64);
        require(h.amplitude(0)==0 && h.amplitude(1)==22 && h.amplitude(2)==0 && h.amplitude(3)==38,
            "muted SFX leaked underlying music");
        for(unsigned ch=0;ch<4;++ch)
            require(h.word(phases+2*ch)==4321+ch,"gain change retriggered phase");
        h.elapsed(3);
        require(h.c().data[notes]==38 && h.c().data[notes+1]==0x6d,
            "music stopped advancing under muted SFX");
        h.command(3); h.command(11,255); h.command(12,32);
        require(h.amplitude(0)==31 && h.amplitude(1)==0,"paused music or SFX gain wrong");
        h.command(4);
        require(h.amplitude(0)==31 && h.amplitude(1)==11*255/32,"resume lost music master");
        h.elapsed(5); // SFX ends, restore the current music state and its own master.
        require(h.amplitude(0)==13*255/32 && h.c().data[banks]==0xc0 &&
            h.c().data[sfx+13]==0,"SFX release lost current music gain/waveform");
        h.command(10,(69u<<16)|2u,31);
        require(h.amplitude(2)==31,"direct tone did not use SFX master");
        h.command(12,64);
        require(h.amplitude(2)==62,"SFX gain edit did not update direct tone");
        h.command(8);
        require(h.amplitude(2)==15*255/32 && h.c().data[banks+2]==0xc0,
            "direct-tone release lost music gain/waveform");
        h.command(7); h.command(6);
        require(h.c().data[volume]==255 && h.c().data[sfxvolume]==64,
            "disable/enable reset master preferences");
    });
    h.test("prepared amplitudes for every control and both masters",[&]{
        h.c().data[music+12]=1; h.c().data[sfx+13]=0;
        for(bool effect : {false,true}) {
            h.c().data[sfx+13]=effect ? 15 : 0;
            for(unsigned master=0;master<256;++master) {
                h.command(effect ? 12 : 11,master);
                require(h.c().data[effect ? sfxvolume : volume]==master,"independent gain byte wrong");
                for(unsigned packed=0;packed<256;++packed) {
                    for(unsigned channel=0;channel<4;++channel) {
                        auto bank=effect ? sfxnotes : notes;
                        h.c().data[bank+2*channel]=0;
                        h.c().data[bank+2*channel+1]=uint8_t(packed);
                    }
                    h.routine("audio_commit");
                    for(unsigned channel=0;channel<4;++channel) {
                        require(h.amplitude(channel)==(packed&31)*master/32,
                            "prepared amplitude disagrees with volume*master/32");
                        if(channel<3) require(h.c().data[banks+channel]==(packed&0x60)<<1,
                            "prepared waveform/ignored bit wrong");
                    }
                }
            }
        }
        h.c().data[sfx+13]=5;
        for(unsigned master=0;master<256;++master) {
            h.command(11,255-master); h.command(12,master);
            for(unsigned channel=0;channel<4;++channel) {
                h.c().data[notes+2*channel+1]=31;
                h.c().data[sfxnotes+2*channel+1]=15;
            }
            h.routine("audio_commit");
            for(unsigned channel=0;channel<4;++channel)
                require(h.amplitude(channel)==(channel%2==0 ? 15*master/32 : 31*(255-master)/32),
                    "ownership selected wrong master");
        }
        std::cout<<"prepared gains: 65536 music and 65536 SFX controls, 256 mixed-owner cases passed\n";
    });
    auto sample=[](unsigned wave, unsigned position) {
        constexpr double pi=3.14159265358979323846;
        switch(wave) {
        case 0: return position<32 ? 127 : -127;
        case 1: return int(std::lround(127.*(position<=16 ? position/16. :
            position<=48 ? (32.-position)/16. : (int(position)-64)/16.)));
        case 2: return int(std::lround(127.*(2.*position/63.-1)));
        default: return int(std::lround(127.*std::sin(2*pi*position/64.)));
        }
    };
    h.test("every signed mix and final saturation",[&]{
        auto zero=h.c().data[2];
        h.c().data[2]=0x5a;
        h.c().data[1]=0xa5;
        h.c().data[reg::addr::SREG]=0xd5; h.c().prev_sreg=0xd5;
        auto regs=h.c().data; auto sp=h.c().sp();
        unsigned clippedlow=0, clippedhigh=0;
        std::array<std::array<unsigned,254>,2> amplitude_for{};
        for(unsigned negative=0;negative<2;++negative) for(unsigned amp=0;amp<256;++amp) {
            int contribution=int(std::floor((negative ? -127. : 127.)*amp/128.+0.5));
            amplitude_for[negative][unsigned(std::abs(contribution))]=amp;
        }
        for(int mix=-1014;mix<=1014;++mix) {
            unsigned left=unsigned(std::abs(mix));
            for(unsigned ch=0;ch<4;++ch) {
                auto contribution=std::min(left,ch==3 ? 255u : 253u); left-=contribution;
                auto amp=ch==3 ? contribution : amplitude_for[mix<0][contribution];
                h.word(controls+3*ch,0); h.control(ch,amp);
                h.word(phases+2*ch,ch<3 && mix<0 ? 0x8000 : 0);
            }
            require(left==0,"mix construction exceeded capacity");
            h.c().data[noise]=mix<0 ? 1 : 2;
            auto duty=std::clamp(128+mix,0,255);
            clippedlow+=mix < -128; clippedhigh+=mix > 127;
            h.c().data[reg::addr::TC4H]=3; // ISR must clear the shared high latch
            auto t=h.routine("timer3_compa_isr",true)+7;
            h.isrmin=std::min(h.isrmin,t); h.isrmax=std::max(h.isrmax,t);
            require(h.c().timer4.ocrNa_next==duty,"saturation disagrees with signed reference");
            for(unsigned r=0;r<32;++r) require(h.c().data[r]==regs[r],"gain ISR corrupted registers");
            require(h.c().data[reg::addr::SREG]==0xd5,"gain ISR corrupted SREG");
            require(h.c().sp()==sp,"gain ISR leaked native stack");
        }
        require(clippedlow && clippedhigh,"gain test missed a saturation polarity");
        // Two loud positive tones must cancel against tone 2 and noise before clipping.
        for(unsigned ch=0;ch<4;++ch) {
            h.control(ch,255); h.word(phases+2*ch,ch==2 ? 0x8000 : 0);
        }
        h.c().data[noise]=1;
        h.routine("timer3_compa_isr",true);
        require(h.c().timer4.ocrNa_next==126,"mix clipped before contributions cancelled");
        h.c().data[2]=zero;
        std::cout<<"saturation reference: 2029 signed mixes, "<<clippedlow
            <<" low and "<<clippedhigh<<" high saturations passed\n";
    });
    h.test("mixed waveform gain and noise paths",[&]{
        unsigned cases=0;
        auto zero=h.c().data[2];
        h.c().data[2]=0x5a; h.c().data[1]=0xa5;
        h.c().data[reg::addr::SREG]=0xd5; h.c().prev_sreg=0xd5;
        auto regs=h.c().data; auto sp=h.c().sp();
        for(unsigned amp=0;amp<256;++amp) for(unsigned wave=0;wave<4;++wave)
        for(unsigned pos=0;pos<64;++pos) for(unsigned path=0;path<3;++path) {
            int mix=0;
            for(unsigned ch=0;ch<3;++ch) {
                auto w=(wave+ch)%4, index=(pos+11*ch)%64;
                auto target=uint16_t((index<<10)|1023);
                auto inc=uint16_t(1097+ch*997);
                auto a=(amp+29*ch)%256;
                h.word(phases+2*ch,uint16_t(target-inc));
                h.word(controls+3*ch,inc); h.control(ch,a,w);
                mix+=int(std::floor(sample(w,index)*int(a)/128.+0.5));
            }
            auto noiseamp=(amp+87)%256;
            h.word(phases+6,path ? 65535 : 0);
            h.word(controls+9,path ? 1 : 0); h.control(3,noiseamp);
            uint8_t seed=path==2 ? 2 : 1;
            h.c().data[noise]=seed;
            if(path) seed=uint8_t((seed>>1)^((seed&1)?0xb8:0));
            mix+=(seed&1) ? -int(noiseamp) : int(noiseamp);
            auto duty=std::clamp(128+mix,0,255);
            auto t=h.routine("timer3_compa_isr",true)+7;
            h.isrmin=std::min(h.isrmin,t); h.isrmax=std::max(h.isrmax,t);
            require(h.c().timer4.ocrNa_next==duty,"mixed waveform gain/saturation wrong");
            require(h.c().data[noise]==seed,"gain changed LFSR update");
            for(unsigned r=0;r<32;++r) require(h.c().data[r]==regs[r],"mixed ISR corrupted registers");
            require(h.c().data[reg::addr::SREG]==0xd5,"mixed ISR corrupted SREG");
            require(h.c().sp()==sp,"mixed ISR leaked native stack");
            ++cases;
        }
        h.c().data[2]=zero;
        std::cout<<"mixed waveform gain reference: "<<cases<<" samples passed\n";
    });
    h.test("every waveform sample and amplitude on every tonal voice",[&]{
        require(h.symbols.at("audio_waveforms")==0x100 &&
            h.symbols.at("audio_waveforms_end")==0x200,"waveform page layout wrong");
        for(unsigned ch=0;ch<4;++ch) { h.word(controls+3*ch,0); h.control(ch,0); }
        for(unsigned ch=0;ch<3;++ch) {
          h.word(controls+3*ch,1097);
          for(unsigned wave=0;wave<4;++wave) {
            for(unsigned amp=0;amp<32;++amp) {
              h.control(ch,amp,wave);
              for(unsigned position=0;position<64;++position) {
                // Exercise the low-phase bits and carry into the sample index.
                auto target=uint16_t((position<<10)|((position&1)?1023:0));
                h.word(phases+2*ch,uint16_t(target-1097));
                auto contribution=int(std::floor((sample(wave,position)*2*int(amp)+128.)/256.));
                auto t=h.routine("timer3_compa_isr",true)+7;
                h.isrmin=std::min(h.isrmin,t); h.isrmax=std::max(h.isrmax,t);
                require(h.c().timer4.ocrNa_next==128+contribution,"table sample/scaling mismatch");
                require(h.word(phases+2*ch)==target,"phase/sample indexing mismatch");
              }
            }
          }
          h.word(controls+3*ch,0); h.control(ch,0);
        }
        std::cout<<"waveform reference: 24576 samples across four shapes, 32 levels, three voices passed\n";
    });
    h.test("sample reference and register preservation",[&]{
        std::array<uint16_t,4> phase{{65520,0x7fff,1234,65500}},inc{{100,3691,257,8000}};
        std::array<uint8_t,4> amp{{31,31,31,31}};
        uint8_t lfsr=1;
        for(int i=0;i<4;++i) { h.word(phases+2*i,phase[i]); h.word(controls+3*i,inc[i]); h.control(i,amp[i]); }
        h.c().data[noise]=lfsr;
        auto zero=h.c().data[2];
        h.c().data[2]=0x5a; // direct floating-point paths borrow r2
        h.c().data[1]=0xa5; // FMULSU must preserve the interrupted r1 value too
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
        require(t<=119,"global commit exceeded cycle bound");
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
        // Finish a real wakeup/dispatch before replacing PC in quiet(); the
        // elapsed-time cutoff can land inside SLEEP or an interrupt handler.
        h.until([&]{return h.boundary();});
        h.c().st(reg::addr::TIMSK0,0); h.c().st(reg::addr::TCCR0B,0); h.quiet();
    });
}
void idle_continuation(char** args) {
    for(unsigned pc : {0x7000u,0xfffeu})
    for(bool active : {false,true}) for(bool service : {false,true}) {
        harness h(args);
        if(active) h.play({0xa2,1,0,1,60,128,0,2});
        h.asset(pc,{0xd7,0x2a,0x00}); // SYS IDLE, then MOV r4,r4.
        h.word(4,uint16_t(pc)); h.c().data[6]=uint8_t(pc>>16);
        h.c().pc=uint16_t(h.sym("seek_and_dispatch_func")); h.tick();
        h.until([&]{return h.boundary();});
        for(unsigned i=8;i<24;++i) h.c().data[i]=uint8_t(0x31+i*7);
        h.c().data[reg::addr::GPIOR0]=5;
        auto regs=h.c().data; auto sp=h.c().sp();
        h.c().data[pending]=0; h.c().data[0xa16]=service?3:0;
        h.word(0xa05,40000);
        h.c().st(reg::addr::TCCR0B,3); h.c().st(reg::addr::TIMSK0,2);
        h.tick(); h.until([&]{return h.boundary();});
        require((h.word(4)|(uint32_t(h.c().data[6])<<16))==pc+2,
            "SYS IDLE dispatched its service operand instead of the following opcode");
        for(unsigned i=8;i<24;++i)
            require(h.c().data[i]==regs[i],"SYS IDLE corrupted guest registers");
        require(h.c().data[reg::addr::GPIOR0]==5,"SYS IDLE corrupted guest flags");
        require(h.c().sp()==sp,"SYS IDLE leaked native stack");
        require(h.c().data[pending]==0,"SYS IDLE failed to service pending audio ticks");
    }
    std::cout<<"SYS IDLE continuation: eight audio/wakeup/PC-carry cases passed\n";
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
    require(minsp>=0xaca,"demo native stack collided with private workspace");
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
    require(minsp>=0xaca,"formatter/audio interrupts collided with private workspace");
    require(!h.c().autobreaks.test(AB_SPI_WCOL),"formatter/audio SPI collision");
    std::cout<<"libm/formatter with sample interrupts: native stack "<<0xb00-minsp<<" bytes\n";
}
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
void sys_bounds(char** args) {
    harness h(args);
    auto table=h.sym("sys_dispatch_table"), trap=h.sym("invalid_syscall_func");
    require(h.sym("sys_dispatch_table_end")-table==57,"SYS table has wrong size");
    for(unsigned id=0;id<256;++id) {
        h.c().data[24]=uint8_t(id); h.word(30,uint16_t(table));
        auto flags=h.c().data[reg::addr::GPIOR0]; auto sp=h.c().sp();
        auto regs=h.c().data;
        h.c().pc=uint16_t(h.sym("sys_dispatch_func"));
        h.until([&]{return h.c().pc==(id<57?table+id:trap);},32);
        if(id>=57) {
            for(unsigned i=0;i<10;++i) h.tick();
            require(h.c().pc==trap,"invalid SYS escaped trap");
        }
        for(unsigned r=2;r<24;++r) require(h.c().data[r]==regs[r],"SYS guard changed guest register");
        require(h.c().data[reg::addr::GPIOR0]==flags,"SYS guard changed guest flags");
        require(h.c().sp()==sp,"SYS guard changed native stack");
    }
    std::cout<<"SYS dispatch: all 57 services and 199 invalid IDs passed\n";
}
void float_precision(char** args) {
    harness h(args);
    constexpr unsigned value_address=0xabc;
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
}
int main(int argc,char** argv) {
    try {
        require(argc>=4 && argc<=6,"usage: avm_audio_tests interpreter.hex interpreter.lst audio.bin [audio_demo.bin [audio_c_test.bin]]");
        decimal_division(argv);
        sys_bounds(argv);
        float_precision(argv);
        idle_continuation(argv);
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
