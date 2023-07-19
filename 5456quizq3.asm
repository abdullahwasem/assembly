[org 0x100]

jmp start :
array_1 : dw 1,2,3,4,5
size : dw 4
num_rot : dw 2 ; cant be more than size in any case 



start:
mov ax , [num_rot]
mov bi , 0 
mov bx , [array_1 + bi]
mov cx , 0

l1:
mov bx , [array_1 + bi]
rol bx , 1
add bi , 2
add cx , 1
cmp cx , ax
jne l1

mov ax , 0x4c00
int 0x21
