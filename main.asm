.include "m8535def.inc"


ldi R16, HIGH(RAMEND)        
out SPH, R16                 
ldi R16, LOW(RAMEND) 
out SPL, R16       


ldi R16,255
out DDRA,R16
out DDRB,R16
out DDRC,R16
ldi R16,0
out PORTC,R16

rcall init


ldi R30, 0b01010111   //W
rcall transmisja

ldi R30, 0b01101111  //o
rcall transmisja

ldi R30, 0b01101010  //j
rcall transmisja

ldi R30, 0b01100100  //t
rcall transmisja

ldi R30, 0b01100101  //e
rcall transmisja

ldi R30, 0b01101011  //k
rcall transmisja

ldi R30, 0b00100000 //Spacja
rcall transmisja

ldi R30, 0b01010000  //P
rcall transmisja

ldi R30, 0b01101001  //i
rcall transmisja

ldi R30, 0b01101100  //l
rcall transmisja

ldi R30, 0b01101001  //i
rcall transmisja

ldi R30, 0b01110011  //s
rcall transmisja

ldi R30, 0b01111010  //z
rcall transmisja

ldi R30, 0b01100101 //e
rcall transmisja

ldi R30, 0b01101011 //k
rcall transmisja


ldi R30, 0b00100000 //Spacja
rcall transmisja







start:


rjmp start

transmisja:
ldi R16,0b00000010
out PORTA,R16

out PORTB,R30
ldi R16,$FF
out PORTC,R16
nop
ldi R16,0
out PORTC,R16
rcall delay_50us

ret

init:
rcall delay_100ms

ldi R16,0
out PORTA,R16
ldi R16,0b00111000
out PORTB,R16
ldi R16,$FF
out PORTC,R16
nop
ldi R16,0
out PORTC,R16
rcall delay_2ms
rcall delay_2ms
rcall delay_2ms

ldi R16,$FF
out PORTC,R16
nop
ldi R16,0
out PORTC,R16
rcall delay_50us
rcall delay_50us
rcall delay_50us


ldi R16,$FF
out PORTC,R16
nop
ldi R16,0
out PORTC,R16
rcall delay_2ms


ldi R16,$FF
out PORTC,R16
nop
ldi R16,0
out PORTC,R16
rcall delay_50us

ldi R16,0
out PORTA,R16
ldi R16,0b00001111
out PORTB,R16
ldi R16,$FF
out PORTC,R16
nop
ldi R16,0
out PORTC,R16
rcall delay_2ms

ldi R16,0
out PORTA,R16
ldi R16,0b00000001
out PORTB,R16
ldi R16,$FF
out PORTC,R16
nop
ldi R16,0
out PORTC,R16
rcall delay_2ms

ldi R16,0
out PORTA,R16
ldi R16,0b00000110
out PORTB,R16
ldi R16,$FF
out PORTC,R16
nop
ldi R16,0
out PORTC,R16
rcall delay_2ms

ret



delay_50us:

; ============================= 
;    delay loop generator 
;     50 cycles:
; ----------------------------- 
; delaying 48 cycles:
          ldi  R17, $10
WGLOOP0:  dec  R17
          brne WGLOOP0
; ----------------------------- 
; delaying 2 cycles:
          nop
          nop
; =============================

ret

delay_2ms:

; ============================= 
;    delay loop generator 
;     2000 cycles:
; ----------------------------- 
; delaying 1998 cycles:
          ldi  R17, $03
WGLOOP00:  ldi  R18, $DD
WGLOOP11:  dec  R18
          brne WGLOOP11
          dec  R17
          brne WGLOOP00
; ----------------------------- 
; delaying 2 cycles:
          nop
          nop
; ============================= 

ret

delay_100ms:

; ----------------------------- 
; delaying 99990 cycles:
          ldi  R17, $A5
WGLOOP000:  ldi  R18, $C9
WGLOOP111:  dec  R18
          brne WGLOOP111
          dec  R17
          brne WGLOOP000
; ----------------------------- 
; delaying 9 cycles:
          ldi  R17, $03
WGLOOP222:  dec  R17
          brne WGLOOP222
; ----------------------------- 
; delaying 1 cycle:
          nop
; ============================= 

ret

