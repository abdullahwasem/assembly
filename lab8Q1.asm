[org 0x0100]
jmp start

mess1: db '                                   '
l1: dw 35
xpos: dw 2
ypos: dw 0
clrscr: 
 push es 
 push ax 
 push cx 
 push di 
 mov ax, 0xb800 
 mov es, ax  
 xor di, di 
 mov ax, 0720h
 mov cx, 2000  
 cld 
 rep stosw 
 pop di 
 pop cx 
 pop ax 
 pop es 
 ret 
 printstr: push bp 
 mov bp, sp 
 push es 
 push ax 
 push cx 
 push si 
 push di 
 mov ax, 0xb800 
 mov es, ax 
 mov al, 80 
 mul byte [bp+10] 
 add ax, [bp+12] 
 shl ax, 1 
 mov di,ax
 mov si, [bp+6] 
 mov cx, [bp+4] 
 mov ah, [bp+8] 
 cld
nextchar: lodsb
 stosw 
 loop nextchar 
 pop di 
 pop si 
 pop cx 
 pop ax 
 pop es 
 pop bp 
 ret 10

start:
call clrscr
mov cx, 13
looop1:
mov ax, 0
push ax
mov ax, [ypos]
push ax
mov ax, 40h
push ax
mov ax, mess1
push ax
push word[l1]
call printstr
mov ax, [ypos]
inc ax
mov [ypos], ax
loop looop1


mov cx, 13
looop2:
mov ax, 35
push ax
mov ax, [ypos]
push ax
mov ax, 20h
push ax
mov ax, mess1
push ax
push word[l1]
call printstr
mov ax, [ypos]
inc ax
mov [ypos], ax
loop looop2


mov cx, 13
looop4:
mov ax, 0
push ax
mov ax, [ypos]
push ax
mov ax, 70h
push ax
mov ax, mess1
push ax
push word[l1]
call printstr
mov ax, [ypos]
inc ax
mov [ypos], ax
loop looop4

mov ax, 0x4c00
int 21h



