[org 0x100]

jmp start

; printing on top left corner 
printnum:
push bp
move bp , sp
push es
push ax
push bx
push cx
push dx
push di

mov ax , 0xb800
mov es , ax 
mov ax , [bp+4]
mov bx , 2 ; the binary conversion
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

nextpos:
pop dx
mov dh , 0x07
mov [es:di] , dx
add di , 2
loop nextpos
pop di
pop dx
pop cx
pop bx
pop ax
pop es
pop bp
ret 2

start:
call clrscr ; calling clr screen func
mov ax , 4529
push ax
call printnum

mov ax , 0x4c00
int 0x21