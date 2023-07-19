[org 0x100]

jmp start


array : 0,0,0,0,0
num1 : 0xABCD
conversion:
push bp
push ax
push bx
push cx
push dx



mov ax , [bp+4]
mov bx , 10 ; the binary conversion
mov cx , 0 

nextdigit:
mov dx , 0 
div bx
add dl , 0x30
push dx
inc cx 
cmp ax , 0 
jnz nextdigit

mov di , 0 

start:
mov cx , 5
mov bp , 0
mov ax , num1
mov bx , array

looper :
pop dx
mov dx , [array+bp]
add bp , 2
dec cx 
cmp cx , 0 
jne looper

mov ax , 0x4c00
int 0x21c
pop dx
mov array , dx
add 2 
