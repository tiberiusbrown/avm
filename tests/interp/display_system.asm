.section .text,"ax",@progbits
.globl _start, command_site, width_site, height_site, type_site, display_site
_start:
    ldi16 r4, 0
    ldi16 r5, 0
command_site:
    sys send_display_command
    mov r0, r7
width_site:
    sys get_system_width
    mov r0, r7
height_site:
    sys get_system_height
    mov r0, r7
type_site:
    sys get_system_display_type
    mov r0, r7
    ldi16 r4, 0
display_site:
    sys display
    mov r0, r7
    jmp _start
