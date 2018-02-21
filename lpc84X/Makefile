GCCFLAGS=-mcpu=cortex-m0plus -mthumb -g -gdwarf-2
ASFLAGS=${GCCFLAGS} --fatal-warnings
CFLAGS=${GCCFLAGS} -std=gnu11
LDFLAGS=-nostdlib -nodefaultlibs -nostartfiles

blink.elf: blink.o
	arm-none-eabi-ld ${LDFLAGS} -T blink.ld blink.o -o blink.elf

blink.o: blink.s
	arm-none-eabi-as ${ASFLAGS} blink.s -o blink.o
