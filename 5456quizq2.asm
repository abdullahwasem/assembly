[org 0x100]

jmp  start 
 num1 : dw 101000110101b


start:
mov ax , [num1]
mov cx , 0 ;counting 1s
mov dx , 0 ;counting 0s
mov si , 11

l1 :
ror ax , 1
jc l2
add cx , 1 
jmp end 

l2:
add dx , 1


end :
sub si , 1
cmp si , 0
jne l1



mov ax , 0x4c00
int 0x21