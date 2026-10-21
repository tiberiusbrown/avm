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
constexpr unsigned pending=0xa15, volume=0xa17, controls=0xa18, duties=0xa24,
    waveform=0xa27, sfxvolume=0xa28, phases=0xa29, noise=0xa31, notes=0xa32, sfxnotes=0xa42,
    music=0xa4a, sfx=0xa54, update_controls=0xa5b, update_waveform=0xa6a, update=0xa6b,
    held_sample=0xa6c, rate=held_sample+1,
    private_end=rate+1, event_buffer=private_end+2, scratch_end=private_end+72;
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
    unsigned amplitude(unsigned channel) {
        return c().data[controls+3*channel+2];
    }
    void control(unsigned channel, unsigned amp, unsigned duty=128, unsigned wave=0) {
        c().data[controls+3*channel+2]=uint8_t(amp);
        if(channel<3) {
            c().data[duties+channel]=uint8_t(duty);
            auto bits=(wave ? 1u<<channel : 0) | (wave==2 ? 8u<<channel : 0);
            c().data[waveform]=uint8_t((c().data[waveform]&~(9u<<channel)) | bits);
        }
    }
    bool boundary() { unsigned p=c().pc; return p>=sym("primary_table") && p<sym("primary_table")+1024 && (p-sym("primary_table"))%4==0; }
    void tick(bool terminal_break=false) {
        // Isolated SYS tests inspect controls/phases without advancing oscillators.
        // Exercise their stopped-timer path; handoff tests use live interrupts.
        if(freeze_commits && c().pc==sym("audio_commit")) {
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
        require(c().data[rate]==1,"synthesis must default to 16 kHz");
        require(c().data[reg::addr::TIMSK3] == 0 && c().data[reg::addr::TCCR3B] == 0 &&
            c().data[reg::addr::TCCR3A] == 0, "unused Timer3 must release its interrupt and speaker pin");
        require(!(c().data[reg::addr::PRR0] & (reg::bit::PRR0::PRTIM0 | reg::bit::PRR0::PRTIM1)),
            "Timer0/Timer1 power gates were not cleared");
        require(c().timer4.ocrNc==255,"Timer4 TOP wrong");
        require(c().data[volume]==128 && c().data[sfxvolume]==128,"default audio masters wrong");
        require(c().data[waveform]==0 && c().data[update_waveform]==0,"waveform must default to pulse");
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
    static uint16_t increment(unsigned note) {
        return note==128 ? 0 : uint16_t(std::lround(440*std::pow(2.,(int(note)-69)/12.)*65536/15625));
    }
    unsigned note_index(unsigned channel) {
        auto pitch=word(notes+4*channel);
        if(!pitch) return 128;
        for(unsigned note=24;note<=95;++note) if(increment(note)==pitch) return note-24;
        throw std::runtime_error("desired pitch is not a fixture MIDI increment");
    }
    unsigned sfx_note_index(unsigned slot) {
        auto pitch=word(sfxnotes+4*slot);
        if(!pitch) return 128;
        for(unsigned note=24;note<=95;++note) if(increment(note)==pitch) return note-24;
        throw std::runtime_error("SFX pitch is not a fixture MIDI increment");
    }
    uint64_t tone(uint32_t argument, unsigned amplitude) {
        auto note=argument>>16;
        auto pitch=note>=24 && note<=95 ? increment(note) : 0;
        return command(10,(uint32_t(pitch)<<16)|(argument&0xffff),amplitude);
    }
    static std::vector<uint8_t> midi_fixture(std::vector<uint8_t> const& data, bool effect=false) {
        require(!data.empty() && data[0]>=1 && data[0]<=15,"MIDI fixture ownership wrong");
        auto owner=data[0];
        if(effect) owner=uint8_t((owner&8)|((owner&4)>>1));
        require(!effect || (owner && !(owner&~10)),"SFX fixture must use voices 1/3");
        std::vector<uint8_t> out{owner};
        size_t i=1;
        while(i<data.size()) {
            auto delta=data.at(i++), mask=data.at(i++);
            out.push_back(delta);
            out.push_back(effect ? uint8_t(((mask&4)>>1)|(mask&8)|((mask&64)>>1)|(mask&128)) : mask);
            if(!mask) {
                auto cmd=data.at(i++); out.push_back(cmd);
                if(cmd) { out.insert(out.end(),data.begin()+i,data.end()); break; }
            } else {
                for(unsigned ch=0;ch<4;++ch) if(mask&(1u<<ch)) {
                    auto pitch=increment(data.at(i++));
                    out.push_back(uint8_t(pitch)); out.push_back(uint8_t(pitch>>8));
                }
                for(unsigned ch=0;ch<4;++ch) if(mask&(16u<<ch)) {
                    auto packed=data.at(i++);
                    out.push_back(uint8_t((packed&31)|(ch<3 ? 128 : 0)));
                    if(ch<3) out.push_back(uint8_t(128-32*((packed>>5)&3)));
                }
            }
        }
        return out;
    }
    void play_midi(std::vector<uint8_t> data, uint32_t addr=0x20000, bool effect=false, unsigned initial_ticks=1) {
        play(midi_fixture(data,effect),addr,effect,initial_ticks);
    }
    void play(std::vector<uint8_t> data, uint32_t addr=0x20000, bool effect=false, unsigned initial_ticks=1) {
        asset(addr,data); command(effect?1:0,addr); quiet();
        if(initial_ticks) elapsed(initial_ticks);
    }
    template<class F> void test(char const* name,F f) {
        command(7); command(13,0); command(5,32); quiet();
        try { f(); } catch(std::exception const& e2) { throw std::runtime_error(std::string(name)+": "+e2.what()); }
        ++cases;
    }
};
void sequence(harness& h) {
    h.test("all nine waveform transitions on all tonal channels at both rates",[&]{
        constexpr unsigned encoded[]={0,0x20,0x60};
        for(unsigned selected=0;selected<2;++selected) {
            h.command(13,selected);
            for(unsigned ch=0;ch<3;++ch) for(unsigned from : encoded) for(unsigned to : encoded) {
                auto p=uint8_t(1u<<ch), c=uint8_t(16u<<ch);
                h.play({p,0,uint8_t(p|c),0x23,1,uint8_t(0x80|from|12),64,
                    0,c,uint8_t(to|12),0,c,uint8_t(0x80|to|12),192,0,p,0,0,0,p,0x23,1,255,0,1});
                h.word(phases+2*ch,0xf123);
                auto check=[&](unsigned wave, unsigned duty) {
                    auto bits=(wave&32 ? p : 0) | (wave&64 ? p<<3 : 0);
                    require((h.c().data[waveform]&(9u<<ch))==bits,"transition packed wrong waveform");
                    require(h.c().data[notes+4*ch+2]==(wave|12),"desired waveform bits lost");
                    require(h.c().data[duties+ch]==duty,"transition lost duty");
                    require(h.word(phases+2*ch)==0xf123,"waveform transition reset phase");
                };
                check(from,64);
                h.elapsed(1); check(to,64);
                require(h.amplitude(ch)==12,"waveform bits leaked into amplitude");
                h.elapsed(1); check(to,192); // extension still consumes exactly one byte
                h.elapsed(1); check(to,192);
                require(h.amplitude(ch)==255,"rest did not silence saw voice");
                h.elapsed(1); check(to,192);
                require(h.amplitude(ch)==12,"pitch-only update lost waveform/volume");
            }
        }
    });
    h.test("all waveform owners restore current music across hidden changes and loops",[&]{
        constexpr unsigned encoded[]={0,0x20,0x60};
        for(unsigned music_wave : encoded) for(unsigned effect_wave : encoded) {
            h.play({7,0,0x77,1,1,2,2,3,3,0xec,64,uint8_t(0x80|music_wave|12),32,0xac,192,
                0,0x20,0x6c,0,0x20,0x2c,0,0,2});
            auto music_bits=(music_wave&32 ? 2u : 0) | (music_wave&64 ? 16u : 0);
            require(h.c().data[waveform]==(13|music_bits),"foreground physical packing wrong");
            h.play({2,0,34,0,0x10,uint8_t(0x80|effect_wave|15),96,4,0,1},0x21000,true);
            auto sfx_bits=(effect_wave&32 ? 2u : 0) | (effect_wave&64 ? 16u : 0);
            auto check=[&]{require(h.c().data[waveform]==(13|sfx_bits),"hidden music leaked waveform into SFX");};
            check();
            require(h.c().data[notes+6]==0x6c,"hidden music saw update lost");
            h.elapsed(1); check();
            require(h.c().data[notes+6]==0x2c,"hidden music triangle update lost");
            h.elapsed(2); check(); // loop + initial event while overridden
            require(h.c().data[notes+6]==(music_wave|12),"hidden loop did not restore initial waveform");
            h.elapsed(2);
            require(!h.c().data[sfx+6] && h.c().data[waveform]==15 && h.c().data[duties+1]==32,
                "SFX End failed to restore latest music triangle");
            h.command(13,1); require(h.c().data[waveform]==15,"rate change lost restored waveform");
            h.command(3); h.command(4);
            require(h.c().data[waveform]==15,"pause/resume lost restored waveform");
            h.tone((69u<<16)|0,12);
            require(!(h.c().data[waveform]&9),"direct pulse tone inherited saw bits");
            h.command(8); require(h.c().data[waveform]==15,"direct tone release lost saw music");
        }
    });
    h.test("every legal tonal control encoding and extension decodes through subsequent events",[&]{
        for(unsigned ch=0;ch<3;++ch) for(unsigned control=0;control<256;++control) {
            if((control&0x60)==0x40) continue; // rejected by the compiler
            auto p=uint8_t(1u<<ch), c=uint8_t(16u<<ch);
            std::vector<uint8_t> data{p,0,uint8_t(p|c),1,1,uint8_t(control)};
            if(control&128) data.push_back(37);
            data.insert(data.end(),{0,p,2,2,255,0,1});
            h.play(data);
            require(h.c().data[music+5]==1 && h.c().data[notes+4*ch+2]==(control&127),
                "legal tonal control rejected or truncated");
            h.elapsed(1);
            require(h.word(notes+4*ch)==0x202,"extended control desynchronized following pitch");
        }
    });
    h.test("waveform changes retain duty and phase on each tonal voice and loops",[&]{
        for(unsigned ch=0;ch<3;++ch) {
            auto pitchbit=uint8_t(1u<<ch), controlbit=uint8_t(16u<<ch);
            h.play({pitchbit,0,uint8_t(pitchbit|controlbit),0x23,0x01,0x8c,64,
                0,controlbit,0x2c,0,controlbit,0xac,192,0,controlbit,12,0,0,2});
            h.word(phases+2*ch,0xf123);
            auto check=[&](unsigned flags, unsigned duty) {
                require((h.c().data[waveform]&pitchbit)==flags,"wave selection did not persist");
                require(h.c().data[duties+ch]==duty,"wave change lost retained duty");
                require(h.word(phases+2*ch)==0xf123,"wave/control/loop reset oscillator phase");
                require(h.amplitude(ch)==12,"triangle flag leaked into prepared amplitude");
            };
            check(0,64);
            h.elapsed(1); check(pitchbit,64);
            h.elapsed(1); check(pitchbit,192);
            h.elapsed(1); check(0,192);
            h.elapsed(2); check(0,64); // loop's first event explicitly restores pulse
            h.command(3); require(h.amplitude(ch)==255,"pause did not silence triangle owner");
            h.command(4); check(0,64);
        }
    });
    h.test("waveform ownership, hidden music restoration, rates and direct-tone defaults",[&]{
        h.play({7,0,0x77,1,1,2,2,3,3,0xac,64,0x8c,32,0xac,192,
            1,0x20,0x2c,255,0,2});
        require(h.c().data[waveform]==5,"independent initial waveforms wrong");
        h.play({2,0,34,0x00,0x10,0x8f,96,4,0,1},0x21000,true);
        require(h.c().data[waveform]==5,"pulse SFX changed another voice waveform");
        h.elapsed(1);
        require(h.c().data[notes+6]==0x2c && h.c().data[waveform]==5,
            "hidden music waveform did not advance independently");
        h.elapsed(4);
        require(h.c().data[waveform]==7 && h.c().data[duties+1]==32,
            "SFX End lost current music waveform or duty");
        for(unsigned selected : {1u,0u}) {
            h.command(13,selected);
            require(h.c().data[waveform]==7,"rate change lost waveform");
        }
        h.play({2,0,34,0x00,0x10,0xaf,96,255,0,1},0x21000,true);
        require(h.c().data[waveform]==7,"triangle SFX selection lost");
        h.command(3); require(h.c().data[waveform]==7 && h.amplitude(1)==15,"pause changed SFX waveform");
        h.command(4);
        for(unsigned ch=0;ch<3;++ch) {
            h.tone((69u<<16)|ch,12);
            require(!(h.c().data[waveform]&(1u<<ch)),"direct tone inherited triangle");
            h.command(8);
            require(h.c().data[waveform]==7,"direct-tone release lost music waveform");
        }
        h.command(7);
        for(unsigned ch=0;ch<4;++ch) require(h.amplitude(ch)==255,"stop left a voice audible");
    });
    h.test("music and SFX variable controls, every physical mask and cursor",[&]{
        for(unsigned owner=1;owner<=3;++owner) for(unsigned flags=1;flags<16;++flags) {
            if(((flags&3)|(flags>>2))&~owner) continue;
            h.command(8);
            h.play_midi({15,0,255,60,64,67,36,7,8,9,10,255,0,2});
            auto melody=h.word(controls), bass=h.word(controls+6);
            auto harmony=h.word(controls+3), percussion=h.word(controls+9);
            std::vector<uint8_t> bytes{uint8_t((owner&1 ? 2 : 0)|(owner&2 ? 8 : 0)),0,
                uint8_t(((flags&1)<<1)|((flags&2)<<2)|((flags&4)<<3)|((flags&8)<<4))};
            if(flags&1) bytes.insert(bytes.end(),{0x85,0x0e});
            if(flags&2) bytes.insert(bytes.end(),{0x34,0x12});
            if(flags&4) bytes.insert(bytes.end(),{0x8c,32});
            if(flags&8) bytes.insert(bytes.end(),{0x8d,37});
            bytes.push_back(3);
            auto terminal=bytes.size();
            bytes.insert(bytes.end(),{0,1,255,255});
            h.play(bytes,0x2fffa,true,0);
            auto service_cycles=h.elapsed(1);
            if(owner==3 && flags==15)
                std::cout<<"maximum extended SFX service: "<<service_cycles<<" cycles\n";
            require(h.c().data[sfx+6]==((owner&1 ? 2 : 0)|(owner&2 ? 8 : 0)),"SFX slot mask wrong");
            require(h.word(sfx)==uint16_t(0xfffa+terminal) && h.c().data[sfx+2]==3,
                "extended SFX cursor did not cross 64 KB correctly");
            require(h.word(controls)==melody && h.word(controls+6)==bass && h.amplitude(2)==9,
                "sequenced SFX stole melody or bass");
            require(h.word(controls+3)==(owner&1 ? (flags&1 ? 7434 : 0) : harmony),"tonal slot must steal voice 1");
            require(h.word(controls+9)==(owner&2 ? (flags&2 ? 9320 : 0) : percussion),"noise slot route wrong");
            if(flags&4) require(h.c().data[duties+1]==32,"SFX duty extension lost");
            if(flags&8) require(h.c().data[noise]==37 && h.word(phases+6)==0,"SFX seed extension lost");
            h.elapsed(4);
            require(h.c().data[sfx+6]==0 && h.word(controls+3)==harmony && h.word(controls+9)==percussion,
                "SFX End did not restore current music");
        }
    });
    h.test("hidden harmony advances and duty restores under SFX and gains",[&]{
        h.play({15,0,255,0x00,0x04,0x00,0x05,0x00,0x06,0x00,0x07,
            7,0x88,64,9,10,2,0x22,0x00,0x09,0x8d,192,99,0,2});
        h.play({2,0,34,0x00,0x10,0x9f,32,7,0,1},0x21000,true);
        h.command(11,64); h.command(12,96);
        require(h.amplitude(1)==93 && h.amplitude(2)==18,"independent owner gains wrong");
        h.elapsed(2);
        require(h.word(notes+4)==0x900 && h.c().data[notes+7]==192,"hidden harmony stopped advancing");
        require(h.c().data[duties+1]==32 && h.word(controls+3)==0x2000,"hidden music leaked into SFX");
        h.command(12,0);
        require(h.amplitude(1)==0 && h.c().data[sfx+6]==2,"muting SFX released the harmony");
        h.elapsed(6);
        require(h.word(controls+3)==0x1200 && h.amplitude(1)==26 && h.c().data[duties+1]==192,
            "SFX release lost current music pitch/volume/duty/gain");
        for(unsigned ch=0;ch<4;++ch) {
            h.tone((69u<<16)|ch,17);
            require(h.c().data[sfx+6]==(1u<<ch) && h.amplitude(ch)==0,"direct tone routing or SFX gain wrong");
            h.command(12,32);
            require(h.amplitude(ch)==17,"direct tone did not retain physical channel");
            if(ch<3) require(h.c().data[duties+ch]==128,"direct tone did not default to 50 percent");
            h.command(12,0);
        }
    });
    h.test("all duty values preserve pitch phase and volume-only retained duty",[&]{
        for(unsigned ch=0;ch<3;++ch) {
            h.play({uint8_t(1u<<ch),0,uint8_t(1u<<ch),0x34,0x12,255,0,1});
            for(unsigned duty=0;duty<256;++duty) {
                h.word(phases+2*ch,uint16_t(0xf321+ch));
                h.play({uint8_t(1u<<ch),0,uint8_t(17u<<ch),0x34,0x12,0x8c,uint8_t(duty),
                    0,uint8_t(16u<<ch),7,255,0,1});
                require(h.c().data[duties+ch]==duty && h.word(controls+3*ch)==0x2468,
                    "duty update lost pitch or threshold");
                h.elapsed(1);
                require(h.c().data[duties+ch]==duty && h.amplitude(ch)==7 && h.word(phases+2*ch)==0xf321+ch,
                    "volume-only change reset duty or phase");
            }
        }
    });
    h.test("maximum music extension event and loop restoration",[&]{
        h.play({15,0,255,1,0,2,0,3,0,4,0,0x87,0,0x88,255,0x89,128,0x8a,63,
            0,0x70,0x87,32,0x88,64,0x89,192,0,0,2},0x2fff8,false,0);
        std::cout<<"maximum extended music service: "<<h.elapsed(1)<<" cycles\n";
        require(h.word(music)==12 && h.c().data[music+2]==3 && h.word(music+3)==1,
            "18-byte music read-ahead or 24-bit cursor wrong");
        require(h.c().data[duties]==0 && h.c().data[duties+1]==255 && h.c().data[noise]==63,
            "simultaneous duty/seed controls lost");
        h.elapsed(1);
        require(h.c().data[duties]==32 && h.c().data[duties+2]==192,"multiple duty controls lost");
        h.elapsed(1); h.elapsed(1);
        require(h.c().data[duties]==0 && h.c().data[duties+1]==255,"loop did not restore initial duty");
    });
    h.test("music and SFX share the ownership byte and physical field masks",[&]{
        std::vector<uint8_t> bytes{2,0,0x22,0x85,0x0e,0x8c,64,0,0,1};
        for(bool effect : {false,true}) {
            h.command(7);
            h.play(bytes,0x20000,effect);
            require(h.word(controls+3)==7434 && h.amplitude(1)==12 && h.c().data[duties+1]==64,
                "common stream format lost voice-1 pitch, volume, or duty");
            auto stream=effect ? sfx : music;
            require(h.c().data[stream+6]==2 && h.word(stream)==8,
                "common ownership header or consumed cursor wrong");
            h.elapsed(1);
            require(h.c().data[stream+5]==0 && h.amplitude(1)==255,
                "common stream End failed");
        }
    });
    h.test("noise-only reseeds repeat deterministically without pitch changes",[&]{
        h.play({8,0,0x88,0x00,0x40,0x8a,37,0,0x80,0x8a,37,0,8,0x01,0x40,255,0,1});
        std::array<uint8_t,32> expected;
        for(auto& value : expected) { h.synth_sample(); value=h.c().data[held_sample]; }
        h.elapsed(1);
        require(h.c().data[noise]==37 && h.word(phases+6)==0,"seed-only update was lost");
        for(auto value : expected) { h.synth_sample(); require(h.c().data[held_sample]==value,"noise retrigger is not reproducible"); }
        auto phase=h.word(phases+6);
        h.elapsed(1);
        require(h.word(phases+6)==phase && h.word(controls+9)==0x8002,"ordinary noise pitch reset phase");
    });
    h.test("hidden music seeds never disturb SFX or replay on release",[&]{
        h.play({8,0,0x88,0x00,0x20,0x8a,37,1,0x80,0x87,41,1,0x80,0x86,43,1,0x80,0x85,47,255,0,2});
        h.play({8,0,136,0x00,0x40,0x8f,11,3,0,1},0x21000,true);
        h.word(phases+6,0x1234);
        h.elapsed(1);
        require(h.c().data[noise]==11 && h.word(phases+6)==0x1234 && h.amplitude(3)==15,
            "hidden music reseeded audible noise SFX");
        h.elapsed(3);
        require(h.c().data[sfx+6]==0 && h.amplitude(3)==6 && h.c().data[noise]==11 && h.word(phases+6)==0x1234,
            "SFX release replayed a stale music reseed");
        h.elapsed(2);
        require(h.c().data[noise]==47 && h.word(phases+6)==0 && h.amplitude(3)==5,
            "future music reseed did not resume");
    });
    h.test("tonal-only SFX End preserves simultaneous audible music reseed",[&]{
        h.play({8,0,0x88,0x00,0x20,0x8a,37,1,0x80,0x87,41,255,0,1});
        h.play({2,0,2,0x00,0x10,0,0,1},0x21000,true);
        h.c().data[noise]=11;
        h.elapsed(1);
        require(h.c().data[sfx+6]==0 && h.c().data[noise]==41 && h.amplitude(3)==7,
            "tonal-only SFX End discarded music retrigger");
    });
    h.test("raw pitch precision and phase-preserving modulation",[&]{
        h.play({1,0,0x11,0x85,0x0e,0x0c,0,1,0x91,0x0e,0,0,1});
        require(h.word(notes)==3717 && h.word(controls)==7434,"raw pitch was quantized or truncated");
        h.word(phases,0xf321);
        h.elapsed(1);
        require(h.word(controls)==7458 && h.word(phases)==0xf321 && h.amplitude(0)==12,
            "pitch-only modulation reset phase or lost control");
        h.elapsed(1);
        require(h.amplitude(0)==255,"raw-pitch stream did not terminate");
        h.command(10,(uint32_t(4567)<<16)|1u,17);
        require(h.word(controls+3)==9134 && h.amplitude(1)==17,
            "internal direct-tone entry lost the increment high byte or channel");
    });

    h.test("default gain uses nearly the complete pin amplitude",[&]{
        h.command(5,128);
        h.play_midi({1,0,0x11,60,31,255,0,1});
        require(h.amplitude(0)==124,"default gain did not prepare volume 31 as amplitude 124");
        h.word(phases,0); h.word(controls,0); h.synth_sample();
        require(h.c().data[held_sample]==251,"default gain did not approach the positive pin limit");
    });
    h.test("combined update timing",[&]{
        for(unsigned count : {1,4}) {
            auto mask=uint8_t((1u<<count)-1);
            std::vector<uint8_t> bytes{mask,0,mask};
            for(unsigned ch=0;ch<count;++ch) bytes.push_back(uint8_t(60+ch));
            bytes.insert(bytes.end(),{3,uint8_t(mask | (mask<<4))});
            for(unsigned ch=0;ch<count;++ch) bytes.push_back(uint8_t(61+ch));
            for(unsigned ch=0;ch<count;++ch) bytes.push_back(uint8_t(7+ch));
            bytes.insert(bytes.end(),{9,0,1});
            h.play_midi(bytes);
            auto cycles=h.elapsed(4);
            for(unsigned ch=0;ch<count;++ch)
                require(h.amplitude(ch)==7+ch && h.note_index(ch)==37+ch,
                    "combined note/volume update wrong");
            std::cout<<count<<"-channel note+volume service: "<<cycles<<" cycles\n";
        }
    });
    h.test("volume-only and continue timing",[&]{
        h.play_midi({15,0,15,60,64,67,36,3,0xf0,7,8,9,10,9,0,1});
        for(unsigned ch=0;ch<4;++ch) h.word(phases+2*ch,uint16_t(1234+ch));
        auto cycles=h.elapsed(4);
        for(unsigned ch=0;ch<4;++ch)
            require(h.word(phases+2*ch)==1234+ch && h.amplitude(ch)==7+ch,
                "volume-only update changed phase or lost amplitude");
        std::cout<<"4-channel volume-only service: "<<cycles<<" cycles\n";
        h.play_midi({1,0,1,60,3,0,0,9,0,1});
        h.word(phases,1234);
        cycles=h.elapsed(4);
        require(h.word(phases)==1234 && h.amplitude(0)==24,"continue changed oscillator");
        std::cout<<"continue service: "<<cycles<<" cycles\n";
    });
    h.test("progression/rest/long delta",[&]{
        h.play_midi({15,0,15,60,64,67,36,4,1,0x80,255,0,0,43,2,65,0,0,1});
        require(h.note_index(0)==36 && h.note_index(1)==40,"simultaneous notes wrong");
        require(h.word(controls)>0 && h.word(controls+3)>0 && h.word(controls+6)>0 && h.word(controls+9)>0,"four voices missing");
        auto sparse=h.elapsed(3); require(h.word(music+3)==2,"sparse countdown wrong");
        std::cout<<"sparse tick service: "<<sparse<<" cycles\n";
        auto event=h.elapsed(2); require(h.amplitude(0)==255,"note off wrong");
        std::cout<<"note-off service: "<<event<<" cycles\n";
        require(h.word(music+3)==256,"256-tick delta wrong");
        h.elapsed(255); require(h.word(music+3)==1,"large catch-up wrong");
        h.elapsed(1); require(h.word(music+3)==44 && h.note_index(0)==0x80,"continue changed state or delay");
        h.elapsed(44); require(h.note_index(1)==41 && h.c().data[music+5]==1,"long wait update wrong");
        h.elapsed(1); require(h.c().data[music+5]==0,"end of song wrong");
    });
    h.test("positive delta loop and dense catch-up",[&]{
        h.play_midi({1,0,1,60,0,1,61,0,0,2},0x20000,false,0);
        require(h.word(music+3)==1 && h.amplitude(0)==255,"first note started before its delay");
        h.elapsed(1); require(h.note_index(0)==36,"0x00 did not wait one tick");
        h.elapsed(1); require(h.note_index(0)==37,"second one-tick update wrong");
        h.elapsed(1); require(h.word(music+3)==1 && h.note_index(0)==37,"loop should retain state until next update");
        h.elapsed(255); require(h.c().data[music+5]==1 && h.word(music+3)==1,"dense positive-time loop failed");
    });
    h.test("256-tick initial delay",[&]{
        h.play_midi({1,255,1,60,0,0,1},0x20000,false,0);
        require(h.word(music+3)==256 && h.amplitude(0)==255,"initial 0xff delay wrong");
        h.elapsed(255);
        require(h.word(music+3)==1 && h.amplitude(0)==255,"maximum delay fired early");
        h.elapsed(1);
        require(h.amplitude(0)==24 && h.note_index(0)==36,"maximum delay did not fire");
        h.elapsed(1); require(h.c().data[music+5]==0,"end command did not consume one tick");
    });
    h.test("continue-only timed loop",[&]{
        h.play_midi({1,0,0,0,0,0,2});
        h.word(phases,1234);
        h.elapsed(255);
        require(h.c().data[music+5]==1 && h.word(music+3)==1,"continue/loop catch-up failed");
        require(h.word(phases)==1234 && h.note_index(0)==0x80,"continue/loop changed channel state");
    });

    h.test("pause/resume/volume/stop/change",[&]{
        h.play_midi({1,0,1,60,9,1,61,9,0,2});
        h.command(3); h.elapsed(25); require(h.word(music+3)==10 && h.amplitude(0)==255,"pause wrong");
        h.command(9); require(h.word(16)==2,"paused status wrong");
        h.command(4); h.elapsed(3); require(h.word(music+3)==7 && h.amplitude(0)==24,"resume wrong");
        h.command(5,16);
        require(h.c().data[volume]==16 && h.amplitude(0)==12 && h.c().data[notes+2]==24,
            "master gain did not prepare amplitude or changed desired volume");
        h.word(phases,0); h.word(controls,0);
        h.synth_sample();
        require(h.c().data[held_sample]==140,"master gain output wrong");
        h.command(2); require(h.amplitude(0)==255,"stop wrong");
        h.command(4); require(h.c().data[music+5]==0,"resume resurrected stopped stream");
        h.command(5,32); h.play_midi({1,0,1,70,9,0,1}); require(h.note_index(0)==46,"song change wrong");
        h.tone( (69u<<16)|2u, 31); // r4 channel, r5 note, r6 amplitude
        require(h.c().data[sfx+6]==4 && h.amplitude(2)==31,"direct tone ownership/amplitude wrong");
        require(h.word(controls+6)==2*h.increment(69),"direct tone tuning wrong");
        h.elapsed(255); require(h.word(controls+6)==2*h.increment(69),"direct tone advanced a stream");
        h.command(8); require(h.amplitude(2)==255,"direct tone did not release");
    });
    h.test("retained volume and phase across pitch updates",[&]{
        h.play_midi({1,0,0x11,60,31,3,0x10,7,3,1,60,9,0,1});
        require(h.amplitude(0)==31,"note did not retain explicit volume");
        h.word(phases,1234); h.elapsed(4); require(h.amplitude(0)==7 && h.word(phases)==1234,"volume retriggered oscillator");
        h.elapsed(4); require(h.word(phases)==1234,"pitch update reset phase");
    });



    h.test("event reads across address boundaries",[&]{
        std::vector<uint8_t> bytes{1};
        for(int i=0;i<60;++i) bytes.insert(bytes.end(),{0,1,uint8_t(36+i%60)});
        bytes.insert(bytes.end(),{255,0,2});
        for(auto address : {0xfff0u,0x1fff0u,0x7fff0u}) {
            h.play_midi(bytes,address); h.elapsed(59);
            require(h.note_index(0)==uint8_t(12+59%60),"address boundary byte corruption");
            require(h.word(music+3)==256,"max delta wrong");
            h.elapsed(255); require(h.word(music+3)==1,"max delta subtraction wrong");
            h.elapsed(1); require(h.word(music+3)==1 && h.c().data[music+5]==1,"max-delay loop wrong");
        }
    });
    h.test("all event masks consume their exact length and ignore read-ahead",[&]{
        for(unsigned mask=1;mask<256;++mask) {
            std::vector<uint8_t> bytes{15,0,uint8_t(mask)};
            for(unsigned ch=0;ch<4;++ch) if(mask&(1u<<ch)) bytes.push_back(uint8_t(60+ch));
            for(unsigned ch=0;ch<4;++ch) if(mask&(16u<<ch)) bytes.push_back(uint8_t(9+ch));
            bytes.push_back(1); // End is due two ticks after this update.
            auto terminal=unsigned(bytes.size());
            for(unsigned ch=0;ch<4;++ch) if(mask&(1u<<ch)) ++terminal;
            for(unsigned ch=0;ch<3;++ch) if(mask&(16u<<ch)) ++terminal;
            bytes.insert(bytes.end(),{0,1,0xff,96,96,96,96,255,255,255,255});
            h.c().data[event_buffer+18]=0xa5;
            h.play_midi(bytes);
            require(h.word(music+0)==uint16_t(terminal) && h.c().data[music+2]==2,
                "event read advanced by burst length instead of consumed bytes");
            require(h.word(music+3)==2,"buffered next delta is wrong");
            for(unsigned ch=0;ch<4;++ch) {
                require(h.note_index(ch)==(mask&(1u<<ch) ? 36+ch : 128),
                    "mask lost or invented a note update");
                require(h.c().data[notes+4*ch+2]==(mask&(16u<<ch) ? 9+ch : 24),
                    "mask lost or invented a control update");
            }
            h.elapsed(2);
            require(h.c().data[music+5]==0 && h.word(music+0)==terminal+2,
                "End consumed its prefetched trailing bytes");
            auto cursor=h.word(music+0);
            h.elapsed(255);
            require(h.word(music+0)==cursor && h.c().data[event_buffer+18]==0xa5,
                "event reader crossed its temporary buffer or resumed after End");
        }
    });
    h.test("streams beyond 65535 bytes terminate and rewind with 24-bit cursors",[&]{
        std::vector<uint8_t> bytes{1};
        constexpr unsigned count=22000;
        for(unsigned i=0;i<count;++i) bytes.insert(bytes.end(),{0,1,uint8_t(36+i%60)});
        bytes.insert(bytes.end(),{0,0,2});
        require(bytes.size()>65535,"large stream fixture is too small");
        for(bool loop : {true,false}) {
            bytes.back()=loop ? 2 : 1;
            h.play_midi(bytes,0xfff0);
            unsigned remaining=count-1;
            while(remaining) {
                auto elapsed=std::min(remaining,255u);
                h.elapsed(elapsed); remaining-=elapsed;
            }
            require(h.note_index(0)==12+(count-1)%60,"large stream cursor lost its high byte");
            h.elapsed(1);
            require(h.c().data[music+5]==unsigned(loop),"large stream terminal record failed");
            if(loop) {
                h.elapsed(1);
                require(h.note_index(0)==12,"large stream did not rewind to its original pointer");
            }
        }
    });
    h.test("pending saturation and Timer0 preservation",[&]{
        h.c().data[pending]=254; h.c().data[0xa05]=0;
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
        h.c().data[reg::addr::PINF]=0xf0;
        h.c().data[reg::addr::PINE]=64;
        h.c().data[reg::addr::PINB]=16;
        h.c().data[2]=0x5a;
        auto worst=h.routine("timer0_compa_isr",true)+7;
        std::cout<<"Timer0 with full millis carry and audio tick: "<<worst<<" cycles\n";
        require(worst==69,"Timer0 full-carry released-button path changed");
        h.c().data[2]=zero;
    });
    h.test("10/50/100 ms delayed servicing",[&]{
        for(unsigned ms : {10,50,100}) {
            h.play_midi({1,0,1,60,4,1,61,4,0,2});
            h.c().data[pending]=0; h.c().data[0xa05]=0;
            auto latch=h.word(controls);
            for(unsigned i=0;i<ms;++i) {
                h.routine("timer0_compa_isr",true);
                h.synth_sample();
                require(h.word(controls)==latch && h.word(music+3)==5,
                    "interrupts advanced the song instead of holding the current latch");
            }
            require(h.c().data[pending]==ms/4,"delayed pending time wrong");
            h.elapsed(ms/4);
            auto position=(1+ms/4)%11;
            require(h.word(music+3)==(position==0?1:position<6?6-position:11-position),"delayed catch-up countdown wrong");
            require(h.note_index(0)==36+(position==0 || position>=6),"delayed catch-up note wrong");
        }
    });
}
void synthesis(harness& h) {
    h.test("Timer1 wins simultaneous pending Timer0 interrupt arbitration", [&] {
        h.quiet();
        auto resume = h.c().pc;
        h.c().data[reg::addr::TIFR0] = 2;
        h.c().data[reg::addr::TIFR1] = 2;
        h.c().st(reg::addr::TIMSK0, 2);
        h.c().st(reg::addr::TIMSK1, 2);
        h.c().data[reg::addr::SREG] |= 128;
        h.c().prev_sreg |= 128;
        h.c().schedule_interrupt_check();
        h.tick();
        require(h.c().pc == 0x22 && h.c().just_interrupted,
            "Timer1 COMPA did not win interrupt arbitration");
        require((h.c().data[reg::addr::TIFR0] & 2) && !(h.c().data[reg::addr::TIFR1] & 2),
            "arbitration consumed the wrong compare flag");
        h.until([&] { return h.c().active && h.c().pc == resume; });
        h.c().st(reg::addr::TIMSK0, 0);
        h.c().st(reg::addr::TIFR0, 2);
        h.quiet();
    });
    h.test("fixed early PWM write at both synthesis rates",[&]{
        auto dest=h.sym("primary_table");
        for(unsigned selected=0;selected<2;++selected) {
            h.command(13,selected);
            h.c().push(uint8_t(dest)); h.c().push(uint8_t(dest>>8));
            h.c().pc=uint16_t(h.sym("timer1_compa_isr"));
            h.c().data[reg::addr::SREG]&=0x7f; h.c().prev_sreg&=0x7f;
            auto start=h.c().cycle_count;
            h.until([&]{return h.c().pc==h.sym("timer1_endpoint_write");});
            require(h.c().cycle_count-start+7+2==21,"rate changed the early PWM write latency");
            h.until([&]{return h.c().pc==dest;});
        }
        std::cout<<"Timer1 PWM write including entry/vector: 21 cycles at both rates\n";
    });
    h.test("held output and restart",[&]{
        h.command(6); h.quiet();
        require(h.c().data[held_sample]==128,"enable did not prime neutral duty");
        auto regs=h.c().data; auto sp=h.c().sp();
        for(unsigned next=0;next<256;++next) {
            for(unsigned ch=0;ch<4;++ch) {
                h.word(controls+3*ch,0); h.control(ch,0);
            }
            h.control(3,unsigned(std::abs(int(next)-128)));
            h.c().data[noise]=next<128 ? 1 : 2;
            h.synth_sample();
            require(h.c().data[held_sample]==next,"sample construction wrong");
            for(unsigned r=0;r<32;++r)
                require(h.c().data[r]==regs[r],"synthesis ISR corrupted registers");
            require(h.c().sp()==sp,"synthesis ISR leaked native stack");
        }
        h.command(7); h.command(6); h.quiet();
        require(h.c().data[held_sample]==128,"disable/enable retained a stale sample");
    });
    h.test("global gain command and SFX",[&]{
        h.play_midi({15,0,255,60,64,67,36,7,11,15,19,255,0,2});
        h.play_midi({4,0,0x44,69,31,255,0,1},0x21000,true);
        auto latch=h.c().data;
        auto musicwait=h.word(music+3), effectwait=h.word(sfx+3);
        for(unsigned value=0;value<256;++value) {
            for(unsigned ch=0;ch<4;++ch) h.word(phases+2*ch,0);
            h.c().data[noise]=2; // positive noise, no phase overflow
            h.command(5,value);
            require(h.c().data[volume]==value && h.c().data[sfxvolume]==value,
                "global gain did not set both full-byte masters");
            int mix=0;
            for(unsigned ch=0;ch<4;++ch) {
                unsigned desired=ch==1 ? 31 : 7+4*ch;
                auto amp=desired*value/32;
                require(h.amplitude(ch)==amp,"master gain did not prepare owner amplitude");
                require(h.word(phases+2*ch)==0,"master gain reset phase");
                for(unsigned byte=0;byte<2;++byte)
                    require(h.c().data[controls+3*ch+byte]==latch[controls+3*ch+byte],
                        "master gain changed note increment");
                if(ch<3) {
                    require(h.c().data[duties+ch]==latch[duties+ch],"master gain changed waveform");
                    mix+=int(std::floor(127.*amp/128.+0.5));
                } else mix+=int(amp);
            }
            for(unsigned byte=0;byte<24;++byte)
                require(h.c().data[notes+byte]==latch[notes+byte],"master gain changed desired state");
            require(h.word(music+3)==musicwait && h.word(sfx+3)==effectwait,
                "master gain changed sequencing time");
            h.synth_sample();
            require(h.c().data[held_sample]==std::clamp(128+mix,0,255),
                "gain did not apply to combined music and SFX");
        }
        h.command(5,0); h.tone(69u<<16,31);
        h.synth_sample();
        require(h.amplitude(0)==0 && h.c().data[sfxnotes+2]==31 && h.c().data[held_sample]==128,
            "zero global gain failed to mute direct tone");
        h.command(5,32);
    });

    h.test("prepared amplitudes for every volume and both masters",[&]{
        h.c().data[music+5]=1;
        for(bool effect : {false,true}) {
            h.c().data[sfx+6]=effect ? 10 : 0;
            for(unsigned master=0;master<256;++master) {
                h.command(effect ? 12 : 11,master);
                for(unsigned volume=0;volume<32;++volume) {
                    auto count=effect ? 2u : 4u;
                    auto bank=effect ? sfxnotes : notes;
                    for(unsigned slot=0;slot<count;++slot) {
                        h.word(bank+4*slot,274);
                        h.c().data[bank+4*slot+2]=uint8_t(volume);
                        h.c().data[bank+4*slot+3]=uint8_t(32+slot*32);
                    }
                    h.routine("audio_commit");
                    for(unsigned channel=0;channel<4;++channel) {
                        if(effect && channel!=1 && channel!=3) continue;
                        require(h.amplitude(channel)==volume*master/32,"prepared owner gain wrong");
                        if(channel<3) require(h.c().data[duties+channel]==32+(effect ? 0 : channel)*32,
                            "prepared duty wrong");
                    }
                }
            }
        }
    });
    auto sample=[](unsigned duty, unsigned position) { return position<duty ? 127 : -127; };
    h.test("every signed mix and final saturation",[&]{
        auto zero=h.c().data[2];
        h.c().data[2]=0x5a;
        h.c().data[1]=0xa5;
        h.c().data[reg::addr::SREG]=0xd5; h.c().prev_sreg=0xd5;
        auto regs=h.c().data; auto sp=h.c().sp();
        unsigned clippedlow=0, clippedhigh=0;
        std::array<std::array<unsigned,246>,2> amplitude_for{};
        for(unsigned negative=0;negative<2;++negative) for(unsigned amp=0;amp<=247;++amp) {
            int contribution=int(std::floor((negative ? -127. : 127.)*amp/128.+0.5));
            amplitude_for[negative][unsigned(std::abs(contribution))]=amp;
        }
        for(int mix=-982;mix<=982;++mix) {
            unsigned left=unsigned(std::abs(mix));
            for(unsigned ch=0;ch<4;++ch) {
                auto contribution=std::min(left,ch==3 ? 247u : 245u); left-=contribution;
                auto amp=ch==3 ? contribution : amplitude_for[mix<0][contribution];
                h.word(controls+3*ch,0); h.control(ch,amp);
                h.word(phases+2*ch,ch<3 && mix<0 ? 0x8000 : 0);
            }
            require(left==0,"mix construction exceeded capacity");
            h.c().data[noise]=mix<0 ? 1 : 2;
            auto duty=std::clamp(128+mix,0,255);
            clippedlow+=mix < -128; clippedhigh+=mix > 127;
            h.c().data[reg::addr::TC4H]=3; // ISR must clear the shared high latch
            auto t=h.synth_sample();
            h.isrmin=std::min(h.isrmin,t); h.isrmax=std::max(h.isrmax,t);
            require(h.c().data[held_sample]==duty,"saturation disagrees with signed reference");
            for(unsigned r=0;r<32;++r) require(h.c().data[r]==regs[r],"gain ISR corrupted registers");
            require(h.c().data[reg::addr::SREG]==0xd5,"gain ISR corrupted SREG");
            require(h.c().sp()==sp,"gain ISR leaked native stack");
        }
        require(clippedlow && clippedhigh,"gain test missed a saturation polarity");
        // Two loud positive tones must cancel against tone 2 and noise before clipping.
        for(unsigned ch=0;ch<4;++ch) {
            h.control(ch,247); h.word(phases+2*ch,ch==2 ? 0x8000 : 0);
        }
        h.c().data[noise]=1;
        h.synth_sample();
        require(h.c().data[held_sample]==126,"mix clipped before contributions cancelled");
        h.c().data[2]=zero;
        std::cout<<"saturation reference: 1965 signed mixes, "<<clippedlow
            <<" low and "<<clippedhigh<<" high saturations passed\n";
    });
    h.test("mixed pulse gains noise overflow and clipping",[&]{
        auto zero=h.c().data[2]; h.c().data[2]=0x5a;
        auto regs=h.c().data; auto sp=h.c().sp();
        for(unsigned amp=0;amp<=247; amp+=3) for(unsigned duty : {0u,1u,32u,64u,128u,192u,255u})
        for(unsigned pos=0;pos<256;pos+=17) for(unsigned path=0;path<3;++path) {
            int mix=0;
            for(unsigned ch=0;ch<3;++ch) {
                auto threshold=(duty+71*ch)%256, position=(pos+29*ch)%256, a=(amp+29*ch)%248;
                auto inc=uint16_t(1097+ch*997), target=uint16_t((position<<8)|255);
                h.word(controls+3*ch,inc); h.control(ch,a,threshold);
                h.word(phases+2*ch,uint16_t(target-inc));
                mix+=int(std::floor(sample(threshold,position)*int(a)/128.+0.5));
            }
            auto noiseamp=(amp+87)%248;
            h.word(phases+6,path ? 65535 : 0); h.word(controls+9,path ? 1 : 0); h.control(3,noiseamp);
            uint8_t seed=path==2 ? 2 : 1; h.c().data[noise]=seed;
            if(path) seed=uint8_t((seed>>1)^((seed&1)?0xb8:0));
            mix+=(seed&1) ? -int(noiseamp) : int(noiseamp);
            h.synth_sample();
            require(h.c().data[held_sample]==std::clamp(128+mix,0,255),"mixed pulse/noise gain incorrect");
            require(h.c().data[noise]==seed,"noise LFSR path changed");
            for(unsigned r=0;r<32;++r) require(h.c().data[r]==regs[r],"mixed ISR corrupted registers");
            require(h.c().sp()==sp,"mixed ISR leaked stack");
        }
        h.c().data[2]=zero;
    });
    h.test("pulse thresholds, every phase byte, volumes, increments and both rates",[&]{
        require(!h.symbols.count("audio_waveforms"),"obsolete waveform table remains");
        unsigned cases=0;
        for(unsigned selected=0;selected<2;++selected) {
            h.command(13,selected);
            for(unsigned ch=0;ch<4;++ch) { h.word(controls+3*ch,0); h.control(ch,0); }
            for(unsigned ch=0;ch<3;++ch) {
                for(unsigned duty : {0u,1u,32u,64u,128u,192u,224u,254u,255u})
                for(unsigned amp : {0u,1u,7u,31u,124u,247u})
                for(unsigned inc : {0u,1u,1097u,65535u})
                for(unsigned position=0;position<256;++position) {
                    auto target=uint16_t((position<<8)|((position&1)?255:0));
                    h.word(phases+2*ch,uint16_t(target-inc));
                    h.word(controls+3*ch,inc); h.control(ch,amp,duty);
                    auto expected=std::clamp(128+int(std::floor(sample(duty,position)*int(amp)/128.+0.5)),0,255);
                    h.synth_sample();
                    require(h.c().data[held_sample]==expected,"pulse comparison/scaling mismatch");
                    require(h.word(phases+2*ch)==target,"pulse phase addition mismatch");
                    if(duty==128) require(sample(duty,position)==(position/4<32 ? 127 : -127),
                        "50 percent pulse differs from old square table");
                    ++cases;
                }
                h.word(controls+3*ch,0); h.control(ch,0);
            }
        }
        std::cout<<"pulse reference: "<<cases<<" samples passed\n";
    });
    for(unsigned wave : {1u,2u}) h.test(wave==1 ? "triangle reference" : "sawtooth reference",[&]{
        unsigned cases=0;
        for(unsigned selected=0;selected<2;++selected) {
            h.command(13,selected);
            for(unsigned ch=0;ch<4;++ch) { h.word(controls+3*ch,0); h.control(ch,0); }
            for(unsigned ch=0;ch<3;++ch) {
                for(unsigned amp : {0u,1u,7u,31u,124u,247u})
                for(unsigned inc : {0u,1u,1097u,65535u})
                for(unsigned position=0;position<256;++position) {
                    auto target=uint16_t((position<<8)|((position&1)?255:0));
                    h.word(phases+2*ch,uint16_t(target-inc));
                    h.word(controls+3*ch,inc); h.control(ch,amp,(position*71)%256,wave);
                    int value=wave==1 ? int(2*std::min(position,255-position))-127 : int(position)-128;
                    int contribution=int(std::floor(value*int(amp)/128.+0.5));
                    auto regs=h.c().data; auto sp=h.c().sp();
                    h.synth_sample();
                    require(h.c().data[held_sample]==std::clamp(128+contribution,0,255),"non-pulse scaling mismatch");
                    require(h.word(phases+2*ch)==target,"non-pulse phase addition mismatch");
                    for(unsigned r=0;r<32;++r) require(h.c().data[r]==regs[r],"triangle ISR corrupted registers");
                    require(h.c().sp()==sp && h.c().data[reg::addr::SREG]==regs[reg::addr::SREG],
                        "triangle ISR corrupted stack or SREG");
                    ++cases;
                }
                h.control(ch,0);
            }
        }
        std::cout<<(wave==1 ? "triangle" : "sawtooth")<<" reference: "<<cases<<" samples passed\n";
    });
    h.test("all 27 tonal waveform mixtures with noise and clipping",[&]{
        for(unsigned waves=0;waves<27;++waves) for(unsigned amp : {0u,1u,31u,124u,247u})
        for(unsigned pos=0;pos<256;++pos) for(unsigned path=0;path<3;++path) {
            int mix=0; auto selection=waves;
            for(unsigned ch=0;ch<3;++ch) {
                auto p=(pos+71*ch)%256, duty=(29+53*ch)%256;
                auto wave=selection%3; selection/=3;
                int value=wave==2 ? int(p)-128 : wave==1 ? int(2*std::min(p,255-p))-127 : (p<duty ? 127 : -127);
                h.control(ch,amp,duty,wave);
                h.word(controls+3*ch,1097); h.word(phases+2*ch,uint16_t((p<<8)-1097));
                mix+=int(std::floor(value*int(amp)/128.+0.5));
            }
            uint8_t seed=path==2 ? 2 : 1;
            h.control(3,amp); h.word(controls+9,path ? 1 : 0); h.word(phases+6,path ? 65535 : 0);
            h.c().data[noise]=seed;
            if(path) seed=uint8_t((seed>>1)^((seed&1)?0xb8:0));
            mix+=(seed&1) ? -int(amp) : int(amp);
            h.synth_sample();
            require(h.c().data[held_sample]==std::clamp(128+mix,0,255),"mixed waveform/noise sample mismatch");
            require(h.c().data[noise]==seed,"tonal waveform altered noise behavior");
        }
    });
    h.test("tonal instruction cycle counts are phase independent",[&]{
        for(unsigned ch=0;ch<3;++ch) for(unsigned wave=0;wave<3;++wave) {
            auto begin="audio_wave_begin"+std::to_string(ch), end="audio_wave_end"+std::to_string(ch);
            require(h.sym(end.c_str())-h.sym(begin.c_str())-4<=63,"tonal sentinel branch out of range");
            // 248..254 are synthetic multiplication inputs; 247 is the reachable
            // maximum, and 255 must exercise only the stopped path.
            for(unsigned amp=0;amp<256;++amp) for(unsigned position=0;position<256;++position) {
                h.control(ch,amp,128,wave); h.word(controls+3*ch,0); h.word(phases+2*ch,uint16_t(position<<8));
                h.word(26,0x1234);
                h.c().pc=uint16_t(h.sym(begin.c_str()));
                auto cycles=h.until([&]{return h.c().pc==h.sym(end.c_str());});
                require(cycles==(amp==255 ? 5 : wave==2 ? 34 : wave==1 ? 36 : 35),"tonal synthesis cycle target changed");
                int value=wave==2 ? int(position)-128 : wave==1 ? int(2*std::min(position,255-position))-127 : (position<128 ? 127 : -127);
                auto contribution=amp==255 ? 0 : int(std::floor(value*int(amp)/128.+0.5));
                require(h.word(26)==uint16_t(0x1234+contribution),"signed multiply/rounding/16-bit accumulation mismatch");
            }
        }
        std::cout<<"tonal synthesis: pulse 35, triangle 36, sawtooth 34 cycles on all channels and phases\n";
        std::cout<<"stopped tonal synthesis: 5 cycles on all channels and waveforms\n";
    });
    h.test("noise instruction paths, every LFSR byte and non-sentinel amplitude",[&]{
        require(h.sym("audio_noise_end")-h.sym("audio_noise_begin")-4<=63,"noise sentinel branch out of range");
        uint64_t minimum=1000,maximum=0;
        for(unsigned amp=0;amp<256;++amp) for(unsigned seed=0;seed<256;++seed)
        for(bool overflow : {false,true}) {
            auto phase=uint16_t(overflow ? 65535 : 0x1234);
            h.control(3,amp); h.word(controls+9,amp==255 ? 0 : 1); h.word(phases+6,phase);
            h.c().data[noise]=uint8_t(seed); h.word(26,0x1234);
            h.c().pc=uint16_t(h.sym("audio_noise_begin"));
            auto cycles=h.until([&]{return h.c().pc==h.sym("audio_noise_end");});
            auto next=amp==255 || !overflow ? seed : (seed>>1)^((seed&1) ? 0xb8 : 0);
            auto contribution=amp==255 ? 0 : (next&1) ? -int(amp) : int(amp);
            require(h.word(26)==uint16_t(0x1234+contribution),"noise signed accumulation changed");
            require(h.word(phases+6)==uint16_t(phase+(amp==255 ? 0 : 1)),"noise phase carry changed");
            require(h.c().data[noise]==next,"noise Galois feedback changed");
            require(cycles==(amp==255 ? 5 : !overflow ? 28 : (seed&1) ? 33 : 32),"noise synthesis cycle target changed");
            if(amp!=255) { minimum=std::min(minimum,cycles); maximum=std::max(maximum,cycles); }
        }
        std::cout<<"noise synthesis: "<<minimum<<".."<<maximum<<" active, 5 stopped cycles\n";
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
            auto t=h.synth_sample();
            h.isrmin=std::min(h.isrmin,t); h.isrmax=std::max(h.isrmax,t);
            require(duty>=4 && duty<=252,"mix overflow");
            require(h.c().data[held_sample]==duty,"assembly sample disagrees with reference");
            require(h.c().data[noise]==lfsr,"LFSR mismatch");
            for(unsigned i=0;i<32;++i) require(h.c().data[i]==regs[i],"synth ISR corrupted registers");
            require(h.c().sp()==sp,"synth ISR stack leak");
        }
        for(int i=0;i<4;++i) require(h.word(phases+2*i)==phase[i],"phase wrap mismatch");
        for(int i=0;i<4;++i) h.c().data[controls+3*i+2]=0;
        h.synth_sample(); require(h.c().data[held_sample]==128,"silence wrong");
        h.c().data[2]=zero;
    });
    h.test("note tuning",[&]{
        double maxcents=0;
        for(int note=24;note<=95;++note) {
            h.play_midi({1,0,1,uint8_t(note),9,0,1});
            auto expected=440*std::pow(2.,(note-69)/12.);
            auto rounded=uint16_t(2*std::lround(expected*65536/15625));
            require(h.word(controls)==rounded,"canonical pitch rounding wrong");
            maxcents=std::max(maxcents,std::abs(1200*std::log2(rounded*7812.5/65536/expected)));
        }
        std::cout<<"maximum tuning error: "<<maxcents<<" cents\n";
    });
}
void sentinels(harness& h) {
    h.test("stopped foreground voices freeze and reactivate sample exactly",[&]{
        for(unsigned selected=0;selected<2;++selected) for(unsigned ch=0;ch<4;++ch)
        for(unsigned wave=0;wave<(ch==3 ? 1u : 3u);++wave) {
            h.command(7); h.command(13,selected); h.command(5,255);
            std::fill_n(h.c().data.begin()+notes,24,0);
            h.c().data[music+5]=1;
            h.c().data[notes+4*ch+2]=uint8_t(31|(wave ? 32 : 0)|(wave==2 ? 64 : 0));
            h.c().data[notes+4*ch+3]=71;
            h.routine("audio_commit"); // zero desired increment with nonzero volume
            std::array<uint16_t,4> expected;
            for(unsigned voice=0;voice<4;++voice) {
                require(h.amplitude(voice)==255 && h.word(controls+3*voice)==0,
                    "zero increment was not encoded as a stopped sentinel");
                expected[voice]=uint16_t(0xf123+997*voice);
                h.word(phases+2*voice,expected[voice]);
            }
            h.c().data[noise]=37;
            for(unsigned n=0;n<128;++n) {
                require(h.synth_sample()==81 && h.c().data[held_sample]==128,"stopped voice contributed to mix");
                for(unsigned voice=0;voice<4;++voice)
                    require(h.word(phases+2*voice)==expected[voice],"stopped phase changed");
                require(h.c().data[noise]==37,"stopped LFSR changed");
            }
            h.word(notes+4*ch,0x713b); h.routine("audio_commit");
            require(h.amplitude(ch)==247,"reactivation did not replace sentinel with normal gain");
            uint8_t lfsr=37;
            for(unsigned n=0;n<128;++n) {
                auto sum=uint32_t(expected[ch])+h.word(controls+3*ch);
                expected[ch]=uint16_t(sum);
                int contribution;
                if(ch==3) {
                    if(sum>65535) lfsr=uint8_t((lfsr>>1)^((lfsr&1) ? 0xb8 : 0));
                    contribution=(lfsr&1) ? -247 : 247;
                } else {
                    unsigned p=expected[ch]>>8;
                    int sample=wave==2 ? int(p)-128 : wave==1 ? int(2*std::min(p,255-p))-127 : p<71 ? 127 : -127;
                    contribution=int(std::floor(sample*247/128.+0.5));
                }
                h.synth_sample();
                require(h.word(phases+2*ch)==expected[ch] && h.c().data[noise]==lfsr,
                    "reactivation lost phase or LFSR continuity");
                require(h.c().data[held_sample]==std::clamp(128+contribution,0,255),"reactivation sample mismatch");
            }
        }
    });
    h.test("zero voice volume and zero master keep every oscillator running",[&]{
        for(unsigned selected=0;selected<2;++selected) for(unsigned ch=0;ch<4;++ch)
        for(unsigned wave=0;wave<(ch==3 ? 1u : 3u);++wave) for(bool master : {false,true}) {
            h.command(7); h.command(13,selected); h.command(5,master ? 0 : 255);
            std::fill_n(h.c().data.begin()+notes,24,0);
            h.c().data[music+5]=1;
            auto flags=unsigned((wave ? 32 : 0)|(wave==2 ? 64 : 0));
            h.word(notes+4*ch,0x713b);
            h.c().data[notes+4*ch+2]=uint8_t(flags|(master ? 31 : 0));
            h.c().data[notes+4*ch+3]=71;
            h.routine("audio_commit");
            require(h.amplitude(ch)==0 && h.word(controls+3*ch)!=0,"muted running voice became sentinel");
            uint16_t phase=0xf123; uint8_t lfsr=37;
            h.word(phases+2*ch,phase); h.c().data[noise]=lfsr;
            for(unsigned n=0;n<512;++n) {
                if(n==256) {
                    h.c().data[notes+4*ch+2]=uint8_t(flags|31);
                    h.command(5,255); // envelope/master restoration must not reset phase
                    require(h.amplitude(ch)==247,"unmute lost prepared gain");
                }
                auto sum=uint32_t(phase)+h.word(controls+3*ch); phase=uint16_t(sum);
                if(ch==3 && sum>65535) lfsr=uint8_t((lfsr>>1)^((lfsr&1) ? 0xb8 : 0));
                int amplitude=n<256 ? 0 : 247, contribution;
                if(ch==3) contribution=(lfsr&1) ? -amplitude : amplitude;
                else {
                    unsigned p=phase>>8;
                    int sample=wave==2 ? int(p)-128 : wave==1 ? int(2*std::min(p,255-p))-127 : p<71 ? 127 : -127;
                    contribution=int(std::floor(sample*amplitude/128.+0.5));
                }
                h.synth_sample();
                require(h.word(phases+2*ch)==phase && h.c().data[noise]==lfsr,"mute/unmute changed oscillator continuity");
                require(h.c().data[held_sample]==std::clamp(128+contribution,0,255),"mute/unmute sample mismatch");
            }
        }
    });
    h.test("pending explicit noise retrigger is accepted while stopped",[&]{
        for(unsigned selected=0;selected<2;++selected) {
            h.play({8,0,0x88,0,0,0x9f,37,0,0x80,0x9f,11,255,0,1});
            h.command(13,selected);
            require(h.amplitude(3)==255 && h.word(controls+9)==0,"zero-pitch retrigger became active");
            h.word(phases+6,0xf123); h.c().data[noise]=63;
            h.c().st(reg::addr::TIMSK1,2);
            h.c().data[pending]=1; h.routine("audio_service_func");
            require(h.c().data[update]==(128|11) && h.c().data[noise]==63 && h.word(phases+6)==0xf123,
                "stopped retrigger modified live state before publication");
            require(h.c().data[update_controls+11]==255,"stopped retrigger lost sentinel");
            h.synth_sample();
            require(!h.c().data[update] && h.amplitude(3)==255 && h.word(phases+6)==0 && h.c().data[noise]==11,
                "stopped sentinel suppressed pending phase reset/reseed");
            for(unsigned n=0;n<128;++n) h.synth_sample();
            require(h.word(phases+6)==0 && h.c().data[noise]==11,"stopped retrigger advanced afterward");
            h.quiet();
        }
    });
}
void rates(harness& h) {
    h.test("rate scaling, overflow, state preservation, and disabled output",[&]{
        h.play_midi({15,0,255,60,64,67,36,7,8,9,10,255,0,2});
        h.play_midi({12,0,0xcc,80,69,0x6c,13,255,0,1},0x21000,true);
        h.command(11,64); h.command(12,96);
        for(unsigned ch=0;ch<4;++ch) h.word(phases+2*ch,uint16_t(0xf321+ch));
        auto desired=h.c().data;
        for(unsigned selected : {1u,0u,1u,0u}) {
            h.command(13,selected);
            require(h.c().data[rate]==selected && h.c().timer1.ocrNa==(selected ? 127 : 255),
                "rate command did not select matching timer TOP");
            require(h.c().data[reg::addr::TIMSK1]==0 && h.c().data[reg::addr::TCCR1B]==0,
                "selecting a rate enabled stopped output");
            for(unsigned ch=0;ch<4;++ch) {
                auto source=(ch==1 || ch==3) ? sfxnotes+4*(ch==3) : notes+4*ch;
                require(h.word(controls+3*ch)==h.word(source)*(selected ? 1 : 2),
                    "rate scaling used the wrong owner or accumulated rounding");
                require(h.word(phases+2*ch)==0xf321+ch,"rate switch reset oscillator phase");
                require(h.amplitude(ch)==(ch==1 ? 36 : ch==3 ? 39 : (7+ch)*2),
                    "rate switch changed owner gain");
            }
            require(std::equal(desired.begin()+notes,desired.begin()+update_controls,h.c().data.begin()+notes),
                "rate switch changed desired pitches, ownership, cursor, wait, or status");
            require(h.c().data[noise]==desired[noise] && h.c().data[held_sample]==desired[held_sample],
                "rate switch changed noise seed or held output");
            h.command(13,selected);
            for(unsigned invalid : {2u,3u,127u,255u}) h.command(13,invalid);
            require(h.c().data[rate]==selected,"invalid rate changed the selection");
        }
        h.command(8);
        for(unsigned pitch : {0u,1u,16383u,16384u,32767u,32768u,32769u,65535u}) {
            h.word(notes,uint16_t(pitch));
            for(unsigned selected : {1u,0u}) {
                h.command(13,selected);
                require(h.word(notes)==pitch && h.word(controls)==(selected ? pitch : std::min(pitch*2,65535u)),
                    "raw pitch scaling wrapped, muted, or modified canonical state");
            }
        }
        h.command(13,1); h.command(3); h.command(2); h.command(7); h.command(6); h.quiet();
        require(h.c().data[rate]==1 && h.c().timer1.ocrNa==127,
            "pause/stop/disable/enable lost the selected rate");
    });
    h.test("live rate switch drains pending controls and publishes atomically",[&]{
        h.play_midi({15,0,255,60,64,67,36,7,8,9,10,255,0,2});
        for(unsigned selected : {1u,0u}) {
            h.c().st(reg::addr::TIMSK1,2);
            h.routine("audio_commit");
            require(h.c().data[update]==0x80,"rate fixture lacks an outstanding packet");
            h.c().st(reg::addr::TCNT1H,0); h.c().st(reg::addr::TCNT1L,0);
            h.c().st(reg::addr::TIFR1,2); h.c().st(reg::addr::TCCR1B,10);
            auto old_top=h.c().timer1.ocrNa;
            h.word(16,uint16_t(selected)); h.word(22,13);
            auto regs=h.c().data; auto sp=h.c().sp();
            h.c().pc=uint16_t(h.sym("sys_audio_impl"));
            unsigned samples=0;
            bool changed=false;
            h.tick();
            while(!h.boundary()) {
                if(h.c().timer1.ocrNa!=old_top) changed=true;
                if(h.c().pc==h.sym("timer1_compa_isr")) {
                    ++samples;
                    for(unsigned ch=0;ch<4;++ch)
                        require(h.word(controls+3*ch)==h.word(notes+4*ch)*
                            ((changed ? selected : 1-selected) ? 1 : 2),
                            "ISR saw controls scaled for a different timer rate");
                }
                h.tick();
            }
            require(samples && changed && h.c().data[update]==0,
                "rate switch lost a pending packet or failed to restart output");
            for(unsigned r=2;r<24;++r) require(h.c().data[r]==regs[r],"rate SYS corrupted guest registers");
            require(h.c().sp()==sp,"rate SYS leaked native stack");
            h.quiet();
        }
        // A running timer with global interrupts masked must not deadlock or enable IRQs.
        h.c().st(reg::addr::TIMSK1,2); h.routine("audio_commit");
        h.c().data[reg::addr::SREG]&=0x7f; h.c().prev_sreg&=0x7f;
        h.word(16,1); h.word(22,13);
        h.c().pc=uint16_t(h.sym("sys_audio_impl")); h.tick();
        h.until([&]{return h.c().pc==h.sym("seek_and_dispatch_func_disabled");});
        require(h.c().data[update]==0 && h.c().timer1.ocrNa==127 && !(h.c().data[reg::addr::SREG]&128),
            "IRQ-disabled rate switch did not drain controls or preserve IRQ state");
        h.tick(); h.until([&]{return h.boundary();});
        h.quiet();
        h.c().data[reg::addr::SREG]|=128; h.c().prev_sreg|=128;
    });
}
void handoff(harness& h) {
    h.test("every stopped mask publishes both transition directions atomically",[&]{
        for(unsigned stopped=0;stopped<16;++stopped) {
            h.quiet();
            h.c().data[music+5]=1;
            auto desired=[&](unsigned mask) {
                for(unsigned ch=0;ch<4;++ch) {
                    h.word(notes+4*ch,mask&(1u<<ch) ? 0 : 0x371b);
                    h.c().data[notes+4*ch+2]=uint8_t(31|(ch<3 ? 96 : 0));
                    h.c().data[notes+4*ch+3]=uint8_t(32+ch*29);
                }
            };
            desired(stopped); h.routine("audio_commit");
            std::array<uint8_t,16> previous;
            std::copy_n(h.c().data.begin()+controls,16,previous.begin());
            desired(stopped^15);
            h.c().st(reg::addr::TIMSK1,2);
            auto dest=h.sym("primary_table");
            h.c().push(uint8_t(dest)); h.c().push(uint8_t(dest>>8));
            h.c().pc=uint16_t(h.sym("audio_commit"));
            unsigned steps=0;
            while(h.c().pc!=h.sym("audio_commit_publish")) {
                if(++steps%7==0) {
                    auto resume=h.c().pc;
                    h.routine("timer1_compa_isr",true); h.c().pc=resume;
                }
                require(!h.c().data[update] && std::equal(previous.begin(),previous.end(),h.c().data.begin()+controls),
                    "sentinel transition exposed partial live controls");
                h.tick();
            }
            std::array<uint8_t,16> packet;
            std::copy_n(h.c().data.begin()+update_controls,16,packet.begin());
            h.tick(); h.until([&]{return h.c().pc==dest;});
            require(h.c().data[update]==128 && std::equal(previous.begin(),previous.end(),h.c().data.begin()+controls),
                "publication changed live sentinel before acceptance");
            h.routine("timer1_compa_isr",true);
            require(!h.c().data[update] && std::equal(packet.begin(),packet.end(),h.c().data.begin()+controls),
                "accepted sentinel transition lost packet bytes");
            for(unsigned ch=0;ch<4;++ch)
                require(h.amplitude(ch)==((stopped^15)&(1u<<ch) ? 255 : 31),"transition inverted stopped/muted meaning");
        }
        h.quiet();
    });
    h.test("worst pending control and reseed ISR costs",[&]{
        uint64_t copymax=0,reseedmax=0;
        std::array<uint64_t,27> ordinary_min,ordinary_max{};
        ordinary_min.fill(10000);
        std::array<uint64_t,16> mask_min,mask_max{},pending_max{};
        mask_min.fill(10000);
        unsigned initial_sp=h.c().sp(), minsp=initial_sp;
        for(unsigned waves=0;waves<27;++waves)
        for(unsigned stopped=0;stopped<16;++stopped)
        for(unsigned descriptor : {0u,0x80u,0xa4u,0xa5u})
        for(unsigned amp : {0u,31u,124u,247u})
        for(unsigned signs=0;signs<16;++signs) for(unsigned noise_path=0;noise_path<3;++noise_path) {
            for(unsigned ch=0;ch<4;++ch) {
                h.word(update_controls+3*ch,stopped&(1u<<ch) ? 0 : ch==3 ? 1 : 1097);
                h.c().data[update_controls+3*ch+2]=uint8_t(stopped&(1u<<ch) ? 255 : amp);
                if(ch<3) h.c().data[update_controls+12+ch]=128;
                auto phase=uint16_t(signs&(1u<<ch) ? 0x8000 : 0);
                h.word(phases+2*ch,ch==3 && noise_path ? 65535 : phase);
            }
            h.c().data[noise]=noise_path==2 ? 2 : 1;
            unsigned packed=0, selection=waves;
            for(unsigned ch=0;ch<3;++ch) {
                auto wave=selection%3; selection/=3;
                packed|=(wave ? 1u<<ch : 0) | (wave==2 ? 8u<<ch : 0);
            }
            h.c().data[update_waveform]=uint8_t(packed);
            if(!descriptor) std::copy_n(h.c().data.begin()+update_controls,16,h.c().data.begin()+controls);
            h.c().data[update]=uint8_t(descriptor);
            auto dest=h.sym("primary_table");
            auto before_sp=h.c().sp();
            h.c().push(uint8_t(dest)); h.c().push(uint8_t(dest>>8));
            h.c().pc=uint16_t(h.sym("timer1_compa_isr"));
            h.c().data[reg::addr::SREG]&=127; h.c().prev_sreg&=127;
            auto start=h.c().cycle_count;
            unsigned path_minsp=before_sp;
            h.until([&]{
                path_minsp=std::min(path_minsp,unsigned(h.c().sp()));
                minsp=std::min(minsp,path_minsp);return h.c().pc==dest;
            });
            auto cycles=h.c().cycle_count-start+7;
            if(!descriptor) {
                mask_min[stopped]=std::min(mask_min[stopped],cycles);
                mask_max[stopped]=std::max(mask_max[stopped],cycles);
                if(!stopped) {
                    ordinary_min[waves]=std::min(ordinary_min[waves],cycles);
                    ordinary_max[waves]=std::max(ordinary_max[waves],cycles);
                }
            } else {
                auto& maximum=descriptor==0x80 ? copymax : reseedmax;
                maximum=std::max(maximum,cycles);
                pending_max[stopped]=std::max(pending_max[stopped],cycles);
            }
            require(h.c().data[waveform]==packed,"pending waveform copy lost selection");
            require(before_sp==h.c().sp(),"pending ISR leaked native stack");
            require(before_sp-path_minsp==(!descriptor ? 9u : 11u),"ISR native stack high-water changed");
        }
        require(copymax==280 && reseedmax==281,"pending ISR cycle target changed");
        require(ordinary_min[0]==194 && ordinary_max[0]==201,"pulse ISR cycle target changed");
        require(ordinary_min[13]==197 && ordinary_max[13]==204,"triangle ISR cycle target changed");
        require(ordinary_min[26]==191 && ordinary_max[26]==198,"saw ISR cycle target changed");
        require(mask_min[15]==81 && mask_max[15]==81,"all-stopped ISR cycle target changed");
        require(initial_sp-minsp==11,"pending ISR native stack changed");
        std::cout<<"worst pending ISR: copy "<<copymax<<", reseed "<<reseedmax
            <<" cycles; native stack "<<initial_sp-minsp<<" bytes\n";
        for(unsigned index : {0u,13u,26u})
            std::cout<<"ordinary ISR waveform "<<index<<": "<<ordinary_min[index]<<".."<<ordinary_max[index]<<" cycles\n";
        for(unsigned mask=0;mask<16;++mask)
            std::cout<<"stopped mask "<<mask<<": ordinary "<<mask_min[mask]<<".."<<mask_max[mask]
                <<", pending maximum "<<pending_max[mask]<<" cycles\n";
    });
    h.test("reseed publication is atomic and preserves every ISR register",[&]{
        h.play({8,0,0x88,0x00,0x10,0x8a,37,0,0x80,0x8a,37,255,0,1},0x20000,false,0);
        h.c().data[noise]=11; h.word(phases+6,0xf123);
        h.c().st(reg::addr::TIMSK1,2);
        h.c().data[pending]=1;
        h.routine("audio_service_func");
        require(h.c().data[update]==(0x80|37) && h.c().data[noise]==11 && h.word(phases+6)==0xf123,
            "foreground modified live noise before ISR consumption");
        std::fill_n(h.c().data.begin()+private_end,72,0xa5);
        auto zero=h.c().data[2]; h.c().data[2]=0x5a;
        auto regs=h.c().data; auto sp=h.c().sp();
        auto normalmin=h.isrmin, normalmax=h.isrmax;
        auto cycles=h.synth_sample();
        h.isrmin=normalmin; h.isrmax=normalmax;
        require(h.c().data[update]==0 && h.c().data[noise]==37 && h.word(phases+6)==0x2000,
            "ISR did not reseed and reset phase before its next noise sample");
        for(unsigned r=0;r<32;++r) require(h.c().data[r]==regs[r],"reseed ISR corrupted registers");
        require(h.c().sp()==sp,"reseed ISR leaked stack");
        h.c().data[2]=zero;
        h.c().data[pending]=1;
        h.routine("audio_service_func");
        require(h.c().data[update]==(0x80|37),"repeated seed-only update was not published");
        h.routine("timer1_compa_isr",true);
        require(h.word(phases+6)==0x2000 && h.c().data[noise]==37,"repeated retrigger did not reset pattern");
        h.quiet();
        std::cout<<"noise reseed pending ISR: "<<cycles<<" cycles\n";
    });
    h.test("publish complete chords while preserving oscillator phase",[&]{
        h.c().data[music+5]=1;

        for(unsigned ch=0;ch<4;++ch) {
            h.word(notes+4*ch,h.increment(48+ch));
            h.c().data[notes+4*ch+2]=uint8_t(12+ch+(ch==0 ? 96 : ch==2 ? 32 : 0));
            h.c().data[notes+4*ch+3]=uint8_t(32+ch*16);
        }
        std::array<uint8_t,16> old_controls;
        std::copy_n(h.c().data.begin()+controls,16,old_controls.begin());
        for(unsigned ch=0;ch<4;++ch)
            require(old_controls[3*ch+2]==255 && h.word(controls+3*ch)==0,
                "stopped-to-active publication did not start from sentinels");
        // Keep the timer clock stopped while injecting interrupts into staging.
        // Its enabled mask makes commit publish asynchronously as in playback.
        h.c().st(reg::addr::TIMSK1,2);
        auto dest=h.sym("primary_table");
        h.c().push(uint8_t(dest)); h.c().push(uint8_t(dest>>8));
        h.c().pc=uint16_t(h.sym("audio_commit"));
        unsigned steps=0, injected=0;
        while(h.c().pc!=h.sym("audio_commit_publish")) {
            require(h.c().data[reg::addr::SREG]&128,"staging disabled interrupts");
            require(h.c().data[update]==0,"staging published an incomplete packet");
            if(++steps%19==0) {
                auto resume=h.c().pc;
                h.routine("timer1_compa_isr",true);
                h.c().pc=resume;
                ++injected;
            }
            require(std::equal(old_controls.begin(),old_controls.end(),h.c().data.begin()+controls),
                "ISR observed partially staged controls");
            h.tick();
        }
        require(injected>=4,"did not interrupt enough staging operations");
        std::array<uint8_t,16> packet;
        std::copy_n(h.c().data.begin()+update_controls,16,packet.begin());
        require(packet[15]==13,"staging did not pack independent waveform bits");
        auto publication=h.c().cycle_count;
        h.tick();
        require(h.c().cycle_count-publication==2 && h.c().data[update]==0x80,
            "publication is not a single two-cycle descriptor store");
        h.until([&]{return h.c().pc==dest;});
        require(std::equal(old_controls.begin(),old_controls.end(),h.c().data.begin()+controls),
            "foreground publication modified live controls");
        // Reusing the complete formatter/text workspace must not corrupt a packet.
        std::fill_n(h.c().data.begin()+private_end,72,0xa5);
        auto zero=h.c().data[2]; h.c().data[2]=0x5a;
        auto regs=h.c().data; auto sp=h.c().sp();
        std::array<uint16_t,4> previous_phase;
        for(unsigned ch=0;ch<4;++ch) previous_phase[ch]=h.word(phases+2*ch);
        auto cycles=h.routine("timer1_compa_isr",true)+7;
        require(cycles<1024,"update ISR overran the next PWM deadline");
        for(unsigned r=0;r<32;++r) require(h.c().data[r]==regs[r],"update ISR corrupted registers");
        require(h.c().sp()==sp,"update ISR leaked stack");
        require(h.c().data[update]==0 &&
            std::equal(packet.begin(),packet.end(),h.c().data.begin()+controls),
            "ISR failed to accept the complete persistent packet");
        for(unsigned ch=0;ch<4;++ch)
            require(h.word(phases+2*ch)==uint16_t(previous_phase[ch]+h.word(controls+3*ch)),"ISR reset a phase");
        h.routine("timer1_compa_isr",true); // next synthesis, no pending packet
        for(unsigned ch=0;ch<4;++ch)
            require(h.word(phases+2*ch)==uint16_t(previous_phase[ch]+2*h.word(controls+3*ch)),
                "acknowledged update changed oscillator progression");
        h.c().data[2]=zero;
        h.quiet();
        std::cout<<"four-voice handoff ISR including entry/vector: "<<cycles<<" cycles\n";
    });
    h.test("back-to-back commits acknowledge before reusing the packet",[&]{
        h.c().data[music+5]=1;

        for(unsigned ch=0;ch<4;++ch) {
            h.word(notes+4*ch,h.increment(48+ch));
            h.c().data[notes+4*ch+2]=uint8_t(12+(ch==0 || ch==2 ? 32 : 0));
        }
        h.c().st(reg::addr::TIMSK1,2);
        h.routine("audio_commit");
        std::array<uint8_t,16> first;
        std::copy_n(h.c().data.begin()+update_controls,16,first.begin());
        require(first[15]==5,"first packet lost waveform selection");
        require(h.c().data[update]==0x80,"first commit did not publish a packet");
        for(unsigned ch=0;ch<4;++ch) h.c().data[notes+4*ch+2]=uint8_t(7+(ch==1 ? 32 : 0));
        h.c().st(reg::addr::TCNT1H,0); h.c().st(reg::addr::TCNT1L,0);
        h.c().st(reg::addr::TIFR1,2);
        h.c().st(reg::addr::TCCR1B,10);
        auto elapsed=h.routine("audio_commit");
        require(elapsed>=2048,"second commit failed to wait for the pending packet");
        require(h.c().data[update]==0x80 &&
            std::equal(first.begin(),first.end(),h.c().data.begin()+controls),
            "second commit overwrote or lost the first pending update");
        h.quiet();
        auto phase=h.word(phases);
        h.routine("timer1_compa_isr",true);
        require(h.amplitude(0)==7 && h.c().data[waveform]==2 && h.word(phases)==uint16_t(phase+h.word(controls)),
            "volume update inherited the previous packet's phase reset");
        // Disable with another packet outstanding, then re-enable without replay.
        h.c().st(reg::addr::TIMSK1,2);
        h.c().data[notes+2]=19;
        h.routine("audio_commit");
        require(h.c().data[update]==0x80,"disable fixture lacks a pending packet");
        h.command(7,0,0,false);
        require(h.c().data[update]==0 && h.c().data[reg::addr::TIMSK1]==0,
            "disabled output left an unacknowledged packet");
        for(unsigned ch=0;ch<4;++ch) require(h.amplitude(ch)==255,"disable left a live voice");
        h.command(6);
        h.synth_sample();
        for(unsigned ch=0;ch<4;++ch) require(h.amplitude(ch)==255,"enable replayed a stale packet");
        h.quiet();
    });
    h.test("disabled interrupts apply pending and new controls without waiting",[&]{
        h.c().data[music+5]=1;
        h.word(notes,h.increment(60)); h.c().data[notes+2]=11|32;

        h.c().st(reg::addr::TIMSK1,2);
        h.routine("audio_commit");
        require(h.c().data[update]==0x80,"IRQ-disabled fixture lacks a pending packet");
        h.c().data[notes+2]=9;
        h.c().data[reg::addr::SREG]&=0x7f; h.c().prev_sreg&=0x7f;
        auto preserved_phase=h.word(phases);
        h.routine("audio_commit");
        require(h.c().data[update]==0 && h.amplitude(0)==9 && !(h.c().data[waveform]&1) && h.word(phases)==preserved_phase,
            "IRQ-disabled commit did not drain and replace controls");
        require(!(h.c().data[reg::addr::SREG]&128),"commit unexpectedly enabled interrupts");
        h.quiet();
        h.c().data[reg::addr::SREG]|=128; h.c().prev_sreg|=128;
    });
}
void automatic(harness& h) {
    h.test("FX bursts and buffered event timing",[&]{
        std::vector<uint8_t> bytes(96);
        for(unsigned i=0;i<bytes.size();++i) bytes[i]=uint8_t(i*13);
        h.asset(0x23000,bytes);
        for(unsigned count : {10,16,32,64}) {
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
            h.c().st(reg::addr::TCNT1H,0);
            h.c().st(reg::addr::TCNT1L,uint8_t(127-phase));
            h.c().st(reg::addr::TIFR1,2);
            h.c().st(reg::addr::TCCR1B,10); h.c().st(reg::addr::TIMSK1,2);
            auto dest=h.sym("primary_table");
            h.c().push(uint8_t(dest)); h.c().push(uint8_t(dest>>8));
            h.c().pc=uint16_t(h.sym("fx_read_program_bytes_func"));
            while(h.c().pc!=dest) {
                if(h.c().pc==h.sym("timer1_compa_isr") && h.c().spi_busy) ++interrupted_reads;
                h.tick();
            }
            require(std::equal(bytes.begin(),bytes.begin()+64,h.c().data.begin()+0x100),"interrupt corrupted FX burst");
        }
        require(interrupted_reads>0,"SPI interruption test did not interrupt an active transfer");
        h.quiet();
        std::cout<<"FX reads interrupted with SPI active: "<<interrupted_reads<<"\n";
        h.quiet();
        h.word(16,music);
        h.c().data[music+0]=0;
        h.c().data[music+1]=0x30;
        h.c().data[music+2]=2;
        h.c().data[private_end]=0x5a;
        h.c().data[event_buffer+18]=0xa5;
        auto t=h.routine("audio_read_event");
        require(std::equal(bytes.begin(),bytes.begin()+18,h.c().data.begin()+event_buffer),
            "event burst was corrupted");
        require(h.word(music+0)==0x3000 && h.c().data[music+2]==2,
            "event burst changed the logical cursor before parsing");
        require(h.word(26)==event_buffer,"event burst did not initialize the postincrement pointer");
        require(h.c().data[private_end]==0x5a && h.c().data[event_buffer+18]==0xa5,
            "event burst overwrote its scratch boundaries");
        std::cout<<"18-byte event fetch: "<<t<<" cycles\n";
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
        h.play_midi({1,0,1,60,99,0,1}); h.c().data[pending]=1;
        std::cout<<"active countdown seek overhead: "<<measure("seek_and_dispatch_func_disabled")-bare<<" cycles\n";
        h.play_midi({15,0,15,60,64,67,36,1,15,61,65,68,37,9,0,2});
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
        h.play_midi({15,0,15,60,64,67,36,4,15,61,65,68,37,4,0,2});
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
        require(h.c().data[music+5]==1,"idle music failed");
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
void phase_alignment(char** args) {
    harness h(args);
    auto& c=h.c();
    auto deadline=[&](auto const& timer,unsigned divider) {
        auto ticks=timer.ocrNa>timer.tcnt ? timer.ocrNa-timer.tcnt :
            timer.top+1+timer.ocrNa-timer.tcnt;
        return c.timer_sync.prev_update_cycle+divider-c.timer_sync.prescaler_cycle%divider+
            uint64_t(ticks-1)*divider;
    };
    unsigned minimum=128,maximum=0;
    uint64_t max_lateness=0,outputs=0;
    // Every millisecond-counter value and every sub-tick prescaler phase.
    for(unsigned selected=0;selected<2;++selected)
    for(unsigned counter=0;counter<250;++counter) for(unsigned phase=0;phase<64;++phase) {
        h.quiet();
        h.command(13,1-selected);
        c.st(reg::addr::TIMSK0,0);
        c.st(reg::addr::TCCR0B,3);
        c.update_sync_timers();
        c.timer_sync.prescaler_cycle=phase;
        c.st(reg::addr::TCNT0,uint8_t(counter));
        c.st(reg::addr::TIFR0,2);
        auto begin=c.timer_sync.prev_update_cycle;
        auto prescaler=c.timer_sync.prescaler_cycle;
        h.routine("audio_enable");
        c.update_sync_timers();
        auto startup_gap=unsigned((deadline(c.timer1,8)-deadline(c.timer0,64))&127);
        require(startup_gap>=64 && startup_gap<=120 && startup_gap%8==0,
            "startup alignment left a Timer0 collision window");
        h.command(13,selected,0,false);
        c.update_sync_timers();
        auto elapsed=c.cycle_count-begin;
        require(c.timer0.tcnt==(counter+(prescaler%64+elapsed)/64)%250,
            "audio phase alignment changed the millisecond counter");
        require(c.timer_sync.prescaler_cycle==(prescaler+elapsed)%1024,
            "audio phase alignment reset the shared prescaler");
        auto due=deadline(c.timer1,8);
        unsigned gap=unsigned((due-deadline(c.timer0,64))&127);
        minimum=std::min(minimum,gap); maximum=std::max(maximum,gap);
        if(gap<64 || gap>120 || gap%8)
            std::cerr<<"phase diagnostics: counter="<<counter<<" subphase="<<phase
                <<" gap="<<gap<<" Timer0="<<c.timer0.tcnt<<" Timer1="<<c.timer1.tcnt
                <<" prescaler="<<c.timer_sync.prescaler_cycle<<" elapsed="<<elapsed<<'\n';
        require(gap>=64 && gap<=120 && gap%8==0,
            "audio phase alignment left a Timer0 collision window");
        if(counter!=0) continue;
        // Run a complete 8 ms relative-timer pattern for each sub-tick phase.
        // The host-only NOP loop replaces waveform bytes in this isolated core.
        c.prog[0x200]=0; c.prog[0x201]=0;
        c.prog[0x202]=0xfe; c.prog[0x203]=0xcf; // RJMP back to the NOP
        c.decode(); c.pc=0x100;
        c.st(reg::addr::TIMSK0,2);
        auto end=c.cycle_count+128000;
        unsigned count=0;
        while(c.cycle_count<end) {
            if(c.pc==h.sym("timer1_compa_isr")) {
                require(c.cycle_count>=due+7,"phase sweep interrupt preceded its deadline");
                max_lateness=std::max(max_lateness,c.cycle_count-due-7);
                due+=selected ? 1024 : 2048; ++count;
            }
            h.tick();
        }
        require(count>=(selected ? 124u : 62u),"phase sweep lost synthesis interrupts");
        outputs+=count;
        h.until([&]{return c.pc==0x100 || c.pc==0x101;});
        c.st(reg::addr::TIMSK0,0);
    }
    require(max_lateness<10,"Timer0 delayed phase-aligned synthesis by ten cycles");
    std::cout<<"Timer1 startup/rate-switch phase: 32000 rate/counter/prescaler combinations, "
        <<minimum<<".."<<maximum<<" cycles modulo 128; "<<outputs
        <<" real-timer outputs, maximum extra lateness "<<max_lateness<<" cycles\n";
}
void idle_continuation(char** args) {
    for(unsigned pc : {0x7000u,0xfffeu})
    for(bool active : {false,true}) for(bool service : {false,true}) {
        harness h(args);
        if(active) h.play_midi({1,0,1,60,128,0,2});
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
void demo(char** args, bool toggle_rates=false) {
    harness h(args,false);
    auto begin=h.c().cycle_count;
    uint64_t last=begin, maxgap=0;
    unsigned frames=0, samples=0, synthesized=0, minsp=0xaff;
    bool effect=false, paused=false, resumed=false;
    bool selected_8khz=false, returned_16khz=false;
    while(h.c().cycle_count-begin<16000000) {
        auto ms=(h.c().cycle_count-begin)/16000;
        h.c().data[reg::addr::PINB]=((ms>=500 && ms<560)||(ms>=800 && ms<860))?0:16;
        h.c().data[reg::addr::PINE]=(ms>=200 && ms<260)?0:64;
        h.c().data[reg::addr::PINF]=toggle_rates &&
            ((ms>=300 && ms<360)||(ms>=700 && ms<760)) ? 0x70 : 0xf0;
        if(h.c().pc==h.sym("audio_service_func")) {
            maxgap=std::max(maxgap,h.c().cycle_count-last); last=h.c().cycle_count;
        }
        if(h.c().pc==h.sym("sys_display_impl")) ++frames;
        if(h.c().pc==h.sym("timer1_compa_isr")) ++samples;
        if(h.c().pc==h.sym("timer1_synthesis")) ++synthesized;
        minsp=std::min(minsp,unsigned(h.c().sp()));
        effect|=h.c().data[sfx+5]==1;
        paused|=h.c().data[music+5]==2;
        resumed|=paused && h.c().data[music+5]==1;
        selected_8khz|=h.c().data[rate]==0;
        returned_16khz|=selected_8khz && h.c().data[rate]==1;
        h.tick();
    }
    require(frames>=55,"demo failed to render at its configured frame rate");
    require(toggle_rates ? (samples>=12200 && samples<=13000) : (samples>=15500 && samples<=15625),
        "demo sample clock lost interrupts");
    require(synthesized==samples,"demo output and synthesis clocks differ");
    require(toggle_rates ? (selected_8khz && returned_16khz) : !selected_8khz,
        "demo did not retain 16 kHz by default or toggle both rates");
    require(effect && paused && resumed,"demo button controls failed");
    require(minsp>=scratch_end,"demo native stack collided with private workspace");
    require(h.c().data[music+5]==1,"demo music did not continue automatically");
    std::cout<<"animated demo"<<(toggle_rates ? " with rate toggles" : "")<<": "<<frames<<" frames, "<<samples<<" outputs, "
        <<synthesized<<" synthesis samples, service gap "
        <<maxgap/16000.<<" ms, native stack "<<0xb00-minsp<<" bytes; SFX/pause/resume passed\n";
}
void formatter(char** args) {
    harness h(args,false);
    unsigned minsp=0xaff, tone_calls=0;
    bool audio_entry_seen=false;
    auto begin=h.c().cycle_count;
    while(!h.c().autobreaks.test(AB_BREAK) && h.c().cycle_count-begin<32000000) {
        minsp=std::min(minsp,unsigned(h.c().sp()));
        if(h.c().pc==h.sym("seek_and_dispatch_func")) audio_entry_seen=false;
        if(h.c().pc==h.sym("sys_audio_impl") && !audio_entry_seen) {
            // An interrupt can return to this entry before its first instruction.
            audio_entry_seen=true;
            if(h.c().data[22]!=10) { h.tick(true); continue; }
            auto note=tone_calls ? (tone_calls-1)%256 : 69u;
            auto channel=tone_calls ? (tone_calls-1)/256 : 2u;
            auto pitch=note>=24 && note<=95 ? h.increment(note) : 0;
            if(h.c().data[16]!=channel || h.word(18)!=pitch || h.c().data[20]!=(tone_calls ? 17 : 31)) {
                std::ostringstream error;
                error<<"guest MIDI wrapper call "<<tone_calls<<": channel="<<h.word(16)
                    <<", pitch="<<h.word(18)<<" (expected "<<pitch<<"), amplitude="<<h.word(20);
                throw std::runtime_error(error.str());
            }
            ++tone_calls;
        }
        h.tick(true);
    }
    require(h.c().autobreaks.test(AB_BREAK),"audio formatter workload did not finish");
    require(tone_calls==1025,"guest MIDI wrapper did not cover all notes and channels");
    require(minsp>=scratch_end,"formatter/audio interrupts collided with private workspace");
    std::cout<<"libm/formatter with sample interrupts: native stack "<<0xb00-minsp<<" bytes\n";
}
void playlist(char** args) {
    harness h(args,false);
    auto begin=h.c().cycle_count;
    unsigned frames=0, minsp=0xaff;
    bool audio_entry_seen=false, switched_while_paused=false, resumed=false, rate_preserved=true;
    std::vector<uint32_t> starts;
    while(h.c().cycle_count-begin<22400000) {
        auto ms=(h.c().cycle_count-begin)/16000;
        // Left wraps to the last song. Six right presses visit all four
        // imports, return to the original, and wrap the other direction.
        unsigned pins=0xf0;
        if(ms>=100 && ms<160) pins&=~0x20u;
        if(ms>=200 && ms<260) pins&=~0x80u;
        for(unsigned time : {250u,400u,550u,700u,850u,1000u})
            if(ms>=time && ms<time+60) pins&=~0x40u;
        h.c().data[reg::addr::PINF]=uint8_t(pins);
        h.c().data[reg::addr::PINB]=((ms>=500 && ms<560)||(ms>=1150 && ms<1210))?0:16;
        h.c().data[reg::addr::PINE]=64;
        if(h.c().pc==h.sym("seek_and_dispatch_func")) audio_entry_seen=false;
        if(h.c().pc==h.sym("sys_audio_impl") && !audio_entry_seen) {
            audio_entry_seen=true;
            if(h.c().data[22]==0)
                starts.push_back(h.word(16)|(uint32_t(h.c().data[18])<<16));
        }
        if(ms>=1100 && ms<1130 && h.c().data[music+5]==2) switched_while_paused=true;
        if(ms>=1250 && h.c().data[music+5]==1) resumed=true;
        if(ms>=350 && h.c().data[rate]!=0) rate_preserved=false;
        if(h.c().pc==h.sym("sys_display_impl")) ++frames;
        minsp=std::min(minsp,unsigned(h.c().sp()));
        h.tick();
    }
    require(starts.size()==8,"playlist missed or duplicated a button-triggered song start");
    require(starts[0]==starts[2] && starts[0]==starts[7] && starts[1]==starts[6],
        "playlist did not wrap left/right to the expected songs");
    auto unique=starts;
    std::sort(unique.begin(),unique.end());
    unique.erase(std::unique(unique.begin(),unique.end()),unique.end());
    require(unique.size()==5,"playlist did not visit all five independent music assets");
    require(switched_while_paused && resumed,"playlist did not preserve pause across song switches");
    require(rate_preserved,"playlist did not preserve the selected synthesis rate");
    require(frames>=75,"playlist failed to maintain animated frames");
    require(minsp>=scratch_end,"playlist native stack collided with private workspace");
    std::cout<<"audio playlist: all five songs, both wraps, pause/switch/resume, rate retained; "
        <<frames<<" frames, native stack "<<0xb00-minsp<<" bytes\n";
}
// Optional listening/analysis capture uses the actual timers, sequencer and
// emulator PWM audio path. Optional rate selection supports A/B captures.
void capture(char** args, bool select_rate) {
    char* firmware_args[]{args[0],args[2],args[3],args[4]};
    harness h(firmware_args,true,0);
    std::ifstream song_file(args[5],std::ios::binary);
    require(bool(song_file),"capture song unavailable");
    std::vector<uint8_t> song((std::istreambuf_iterator<char>(song_file)),{});
    if(select_rate) h.command(13,std::stoul(args[8]));
    h.command(11,64);
    h.play(song,0x20000,false,0);
    h.command(6);
    h.c().st(reg::addr::TCCR0B,3); h.c().st(reg::addr::TIMSK0,2);
    h.c().data[pending]=0; h.c().data[0xa16]=0;
    h.routine("interp_delay_17");
    h.c().pc=uint16_t(h.sym("seek_and_dispatch_func"));
    auto begin=h.c().cycle_count;
    h.c().sound_buffer.clear();
    h.c().sound_prev_cycle=begin;
    h.c().sound_cycle=0;
    auto seconds=std::stoul(args[7]);
    require(seconds>0 && seconds<=60,"capture duration must be 1..60 seconds");
    unsigned interrupts=0;
    // Independent logical endpoint trace, before PWM reconstruction/gain.
    // The endpoint written by this ISR is the previous held sample.
    std::ofstream logical(std::string(args[6])+".logical.csv");
    require(bool(logical),"cannot create logical capture trace");
    logical<<"cycle,endpoint\n";
    while(h.c().cycle_count-begin<seconds*16000000ull) {
        if(h.c().pc==h.sym("timer1_compa_isr")) ++interrupts;
        if(h.c().pc==h.sym("timer1_output_done"))
            logical<<h.c().cycle_count-begin<<','<<unsigned(h.c().data[held_sample])<<'\n';
        h.tick();
    }
    h.c().update_sound();
    auto const& samples=h.c().sound_buffer;
    std::ofstream out(args[6],std::ios::binary);
    require(bool(out),"cannot create capture WAV");
    auto u16=[&](unsigned value) {
        out.put(char(value)); out.put(char(value>>8));
    };
    auto u32=[&](unsigned value) { u16(value); u16(value>>16); };
    unsigned bytes=unsigned(samples.size()*2);
    out.write("RIFF",4); u32(36+bytes); out.write("WAVEfmt ",8);
    u32(16); u16(1); u16(1); u32(50000); u32(100000); u16(2); u16(16);
    out.write("data",4); u32(bytes);
    // Identical fixed gain for both captures; no per-file normalization.
    for(auto sample : samples) u16(unsigned(std::clamp(int(sample)*16,-32768,32767)));
    require(bool(out),"capture WAV write failed");
    std::cout<<args[6]<<": "<<samples.size()<<" samples at 50000 Hz, "
        <<interrupts<<" output interrupts\n";
}
// Deterministic oracle: the real audio sequencer/foreground preparation and AVR
// synthesis ISR, with event publication at exact logical 4ms boundaries.
// Timer0 scheduling/PWM are intentionally isolated; --capture covers those.
void render_logical(char** args) {
    char* firmware_args[]{args[0],args[2],args[3],args[4]};
    harness h(firmware_args,true,0);
    std::ifstream input(args[5],std::ios::binary);
    require(bool(input),"logical song unavailable");
    std::vector<uint8_t> song((std::istreambuf_iterator<char>(input)),{});
    unsigned selected=std::stoul(args[8]);
    require(selected<=1,"logical rate must be 0 or 1");
    unsigned samples=std::stoul(args[7]);
    require(samples && samples<=1000000,"logical sample count must be 1..1000000");
    h.command(13,selected);
    h.command(11,128);
    h.play(song,0x20000,false,0);
    for(unsigned ch=0;ch<4;++ch) h.word(phases+2*ch,0);
    h.c().data[noise]=1;
    std::ofstream out(args[6],std::ios::binary);
    require(bool(out),"cannot create logical PCM");
    unsigned previous=0;
    for(unsigned n=0;n<samples;++n) {
        // n / rate / .004, kept rational at both supported rates.
        unsigned ticks=unsigned(uint64_t(n)* (selected ? 2 : 4)/125);
        if(ticks>previous) { h.elapsed(ticks-previous); previous=ticks; }
        h.synth_sample();
        out.put(char(h.c().data[held_sample]));
    }
    require(bool(out),"logical PCM write failed");
    std::cout<<args[6]<<": "<<samples<<" logical samples\n";
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

void exported_large_asset(char** args) {
    harness h(args,false);
    h.c().st(reg::addr::TIMSK0,0); h.c().st(reg::addr::TCCR0B,0);
    h.until([&]{return h.boundary() && h.c().data[music+5]==1 && h.c().data[music+6]==1;});
    h.elapsed(1);
    require(h.note_index(0)==36 && h.amplitude(0)==96,"large C/C++ export did not start at its declared pointer");
    unsigned remaining=21999;
    while(remaining) {
        auto elapsed=std::min(remaining,255u);
        h.elapsed(elapsed); remaining-=elapsed;
        require(h.c().data[music+5]==1,"large exported asset ended before its final record");
    }
    h.elapsed(1);
    require(h.c().data[music+5]==0 && h.amplitude(0)==255,"large exported asset did not reach End beyond 64 KB");
    std::cout<<"large exported C/C++ asset: all 22000 attacks and terminal record beyond 64 KB passed\n";
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
}
int main(int argc,char** argv) {
    try {
        if(argc==5 && std::string(argv[1])=="--stopped-profile") {
            harness h(argv+1);
            auto amplitude=h.symbols.count("audio_noise_begin") ? 255u : 0u;
            for(unsigned selected=0;selected<2;++selected) for(unsigned wave=0;wave<3;++wave) {
                h.command(7); h.command(13,selected);
                for(unsigned ch=0;ch<4;++ch) {
                    h.word(controls+3*ch,0); h.control(ch,amplitude,128,wave);
                    h.word(phases+2*ch,uint16_t(0xf123+ch));
                }
                std::cout<<"all-stopped rate "<<selected<<", waveform "<<wave<<": "<<h.synth_sample()<<" cycles\n";
            }
            return 0;
        }
        if(argc==9 && std::string(argv[1])=="--render-logical") {
            render_logical(argv);
            return 0;
        }
        if(argc==5 && std::string(argv[1])=="--playlist") {
            playlist(argv+1);
            return 0;
        }
        if(argc==5 && std::string(argv[1])=="--formatter") {
            formatter(argv+1);
            return 0;
        }
        if(argc==5 && std::string(argv[1])=="--phase-alignment") {
            phase_alignment(argv+1);
            return 0;
        }
        if((argc==8 || argc==9) && std::string(argv[1])=="--capture") {
            capture(argv,argc==9);
            return 0;
        }
        require(argc>=4 && argc<=8,"usage: avm_audio_tests interpreter.hex interpreter.lst audio.bin [audio_demo.bin [audio_c_test.bin [large_c.bin [large_cpp.bin]]]]");
        decimal_division(argv);
        cset(argv);
        libm_relocation(argv);
        format_fields(argv);
        sys_bounds(argv);
        float_precision(argv);
        hex_fraction(argv);
        phase_alignment(argv);
        idle_continuation(argv);
        harness h(argv); sequence(h); synthesis(h); sentinels(h); rates(h); handoff(h); automatic(h);
        std::cout<<h.cases<<" native audio cases passed\n"
            <<"Timer1 including entry/vector: "<<h.isrmin<<".."<<h.isrmax<<" cycles; CPU "
            <<100.*h.isrmax/2048<<"%\n"
            <<"observed idle service gap: "<<h.latencymax/16000.<<" ms\n";
        if(argc>=5) {
            char* demoargs[]{argv[0],argv[1],argv[2],argv[4]};
            demo(demoargs);
            demo(demoargs,true);
            playlist(demoargs);
        }
        if(argc>=6) {
            char* formatargs[]{argv[0],argv[1],argv[2],argv[5]};
            formatter(formatargs);
        }
        for(int index=6;index<argc;++index) {
            char* largeargs[]{argv[0],argv[1],argv[2],argv[index]};
            exported_large_asset(largeargs);
        }
        return 0;
    } catch(std::exception const& e) { std::cerr<<e.what()<<'\n';return 1; }
}
