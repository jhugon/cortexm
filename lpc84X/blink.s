.syntax unified
.code 16

@ This is the main function
.globl _start
_start:
  @ setup everything
  @ Setup memory base register 0xA000 0000
  @ r7 is just 0xA000 0000 to help out
  movs r7, #0xA
  lsls r7, #28
  @ Now setup pin direction address in r6 0xA000 2000
  movs r6, #0x2
  lsls r6, #12
  adds r6, r7
  @ Word to write to pin direction address and write it (also good for toggle word)
  movs r5, 0x1
  lsls r5, #3 @ bit number/pin number we want output enabled
  str r5, [r6] @ write the value of r5 to address in r6
  @ Now setup the pin toggle address in r6 0xA000 2480
  movs r6, #0x24
  lsls r6, #4
  adds r6, #8
  lsls r6, #4
  adds r6, r7
  @ Set number of cycles beteween blinks
  movs r1, #0x1
  lsls r1, #16
blink:
  str r5, [r6] @ write the value of r5 to address in r6
  movs r0, #0x0
waitloop:
  adds r0, #0x1
  cmp r0, r1 @ Value flags on r0 - r1
  bhs blink @ if higher-or-same go to blink
  b waitloop
