.code16
.global _start


_start:
       
     mov $msg,%si #si hold adress of 1st byte og msg
    mov $0x0E, %ah
    mov $0x00, %bh

    print_msg:
     lodsb /* Load byte from %si into %al which print  on screen also lodsb incrment %si */
     cmp $0x00,%al
     je end_msg
    int $0x10
    jmp print_msg
    end_msg:
      hlt #stop loop
  #    jmp _start
msg:
   .asciz "Welcome to your Own OS aadityansha" #automatic 0 at the end dueto .asciz



/* --- Padding and Signature --- */
/* Use this formula: Pad from HERE (.) up to (_start + 510) */
. = _start + 510      
.word 0xaa55
