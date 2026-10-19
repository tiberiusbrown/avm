#include <avm.h>
#include <math.h>
#include <stdio.h>
#include <string.h>

static const uint8_t AVM_PROGMEM song[] = {
    0xa2,15, 0,15,60,64,67,36, 24,1,62, 24,0,2
};
static const uint8_t AVM_PROGMEM effect[] = {
    0xa2,12, 0,12,84,48, 7,0,1
};

int avm_test_main(void) {
    char text[48];
    avm_audio_play(song);
    if(avm_audio_status()!=1) return 1;
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
    avm_audio_sfx(effect);
    if(avm_audio_status()!=5) return 5;
    avm_audio_pause();
    if(avm_audio_status()!=6) return 6;
    avm_audio_stop_sfx();
    if(avm_audio_status()!=2) return 7;
    avm_audio_resume();
    if(avm_audio_status()!=1) return 8;
    avm_audio_volume(16);
    avm_audio_music_volume(0);
    avm_audio_sfx_volume(255);
    if(avm_audio_status()!=1) return 11;
    avm_audio_tone(2,69,31);
    if(avm_audio_status()!=5) return 10;
    avm_audio_stop_sfx();
    avm_audio_stop();
    if(avm_audio_status()!=0) return 9;
    avm_audio_disable();
    return 0;
}
