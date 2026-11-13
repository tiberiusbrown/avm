#include <avm.h>
#include <math.h>
#include <stdio.h>
#include <string.h>

static const uint8_t AVM_PROGMEM song[] = {
    15, 0,15,0x49,0x04,0x66,0x05,0x6c,0x06,0x12,0x01, 24,1,0xd0,0x04, 24,0,1
};
static const uint8_t AVM_PROGMEM effect[] = {
    10, 0,10,0x25,0x11,0x25,0x02, 7,0,1
};
static const uint8_t AVM_PROGMEM short_song[] = {1, 0, 0, 1};

int avm_test_main(void) {
    char text[48];
    if(avm_audio_get_rate()!=AVM_AUDIO_RATE_16KHZ || avm_audio_get_music_loop()!=0 ||
       avm_audio_get_lowpass()!=AVM_AUDIO_LOWPASS_DEFAULT ||
       avm_audio_get_fade_volume()!=0 || avm_audio_get_fade_song()!=0) return 19;
    avm_audio_lowpass(AVM_AUDIO_LOWPASS_MILD);
    avm_audio_music_loop(3);
    if(avm_audio_get_lowpass()!=AVM_AUDIO_LOWPASS_MILD || avm_audio_get_music_loop()!=3) return 20;
    avm_audio_play_fade(song); /* An inactive stream starts immediately at nonzero gain. */
    if(avm_audio_status()!=1) return 1;
    if(avm_audio_get_music()!=song || avm_audio_get_volume()!=128 ||
       avm_audio_get_music_volume()!=255 || avm_audio_get_sfx_volume()!=255) return 14;
    uint16_t start=avm_millis();
    for(unsigned i=0;i<100;++i) {
        /* Native libm borrows the usual zero register. Timer ISRs must work
           while it is nonzero and the formatter workspace must stay safe. */
        volatile float angle=0.25f;
        float value=sinf(angle);
        if(value<0.24f || value>0.25f) return 2;
        snprintf(text,sizeof(text),"%lu %.2f",(unsigned long)i,(double)value);
        size_t length=strlen(text);
        if(length<4 || memcmp(text+length-4,"0.25",4)!=0) return 3;
    }
    if(avm_audio_status()!=1 || avm_millis()==start) return 4;
    avm_audio_rate(AVM_AUDIO_RATE_16KHZ);
    avm_audio_sfx(effect);
    if(avm_audio_status()!=5) return 5;
    avm_audio_pause();
    if(avm_audio_status()!=6) return 6;
    if(avm_audio_get_music()!=song) return 15;
    avm_audio_play_fade(song);
    if(avm_audio_get_fade_volume()!=255 || avm_audio_get_fade_song()!=song) return 21;
    avm_audio_music_loop(0);
    avm_audio_play(short_song);
    uint8_t restore=avm_audio_get_music_volume();
    avm_audio_play_fade(song);
    start=avm_millis();
    while((uint16_t)(avm_millis()-start)<8) avm_idle();
    if(avm_audio_get_music()!=0 || avm_audio_get_music_volume()>=restore) return 25;
    avm_audio_play_fade(effect);
    avm_audio_play_fade(effect); /* Repeated requests retain gain and fade progress. */
    if(avm_audio_get_fade_volume()!=restore || avm_audio_get_fade_song()!=effect ||
       avm_audio_get_music()!=0 || avm_audio_get_music_volume()>=restore) return 26;
    avm_audio_play(song); /* Cancel the pending fade; its stored pointer is now stale. */
    avm_audio_music_loop(3);
    if(avm_audio_get_fade_volume()!=0 || avm_audio_get_fade_song()!=0) return 22;
    avm_audio_pause();
    avm_audio_stop_sfx();
    if(avm_audio_status()!=2) return 7;
    avm_audio_rate(AVM_AUDIO_RATE_8KHZ);
    if(avm_audio_get_rate()!=AVM_AUDIO_RATE_8KHZ ||
       avm_audio_get_lowpass()!=AVM_AUDIO_LOWPASS_MILD) return 23;
    avm_audio_resume();
    if(avm_audio_status()!=1) return 8;
    avm_audio_volume(16);
    avm_audio_music_volume(0);
    avm_audio_sfx_volume(255);
    if(avm_audio_get_volume()!=16 || avm_audio_get_music_volume()!=0 ||
       avm_audio_get_sfx_volume()!=255) return 16;
    avm_audio_play_fade(song); /* Zero gain starts immediately, through the public ABI. */
    if(avm_audio_get_music()!=song || avm_audio_get_music_volume()!=0) return 18;
    if(avm_audio_status()!=1) return 11;
    avm_audio_tone(69,31);
    if(avm_audio_status()!=5) return 10;
    /* Exercise the guest program-space MIDI table and its bounds. */
    for(unsigned note=0;note<256;++note)
        avm_audio_tone((uint8_t)note,17);
    avm_audio_tone_triangle(69,20);
    if(avm_audio_status()!=5) return 12;
    avm_audio_tone_pulse(69,20,64);
    if(avm_audio_status()!=5) return 13;
    avm_audio_stop_sfx();
    avm_audio_stop();
    if(avm_audio_status()!=0) return 9;
    if(avm_audio_get_music()!=0) return 17;
    avm_audio_disable();
    avm_audio_lowpass(AVM_AUDIO_LOWPASS_DEFAULT);
    if(avm_audio_get_music_loop()!=3 || avm_audio_get_lowpass()!=AVM_AUDIO_LOWPASS_DEFAULT) return 24;
    return 0;
}
