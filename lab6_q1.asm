[org 0x0100]

jmp start

num: dw 5

array: dw  0, 0,0,0,0


FillArray: cmp num,1
je return
mov [array], bx 
add bi , 2

dec num 
mov bx ,[array + bi]
call FillArray

return: ret

start:
mov bi , 0
mov bx, [array + bi] 
call FillArray

mov ax ,0x4c00
int 0x21