file blink.elf
target sim
load
#layout asm
#layout reg
#
#break _start
break *0x0
run
