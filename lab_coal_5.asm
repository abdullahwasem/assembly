 [org 0x0100]

jmp start
multiplicand: db 13
multiplier: db 5
result: db 0

multiply: 

checkbit:
 shr dl, 1
jnc skip
add [result], bl

skip:  shl bl, 1
sub cl, 1
jne checkbit

ret

start:

mov cl, 4
mov bl, [multiplicand]
mov dl, [multiplier]

call multiply

mov ax, 0x4c00
int 0x21
[org 0x0100]
imp start num: db 10
funl:
sub c1,1
cmp cl,1 iz end
loop:
;ax multiplied by cx
mov ch, 4; initialize bit count to four
 mov bl, al; load multiplicand in bl
 mov dl, cl; load multiplier in di checkbit:
shr d1, 1; move right most bit in carry inc skip; 
skip addition if bit is zero add al, b1; accumulate result skip:
shl b1, 1; shift multiplicand left dec ch; decrement bit count inz checkbit
sub cl,1
cmp cl, 1 inz loop
end:
ret
start:
mov c1, [num] mov al, [num] call funl
mov ax, 0x4c00
int 0x21