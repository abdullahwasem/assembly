[org 0x0100]
jmp start

Date1: db '30/03/2017'
Date2: db '30, March 2017'
Date3: db 'Thursday, March 30, 2017'

lenDate1: dw 10
lenDate2: dw 14
lenDate3: dw 24

clrscr: 
 push es 
 push ax 
 push cx 
 push di 
 mov ax, 0xb800 
 mov es, ax  
 xor di, di 
 mov ax, 7020h
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
 mov ax, 45
 push ax
 mov ax, 21
 push ax
 mov ax, 47h
 push ax
 mov ax, Date1 
 push ax
 push word[lenDate1]
 call printstr

 mov ax, 22
 push ax
 mov ax, 5
 push ax
 mov ax, 97h
 push ax
 mov ax, Date3
 push ax
 push word[lenDate3]
 call printstr

 mov ax, 30
 push ax
 mov ax, 15
 push ax
 mov ax, 67h
 push ax
 mov ax, Date2
 push ax
 push word[lenDate2]
 call printstr

 mov ax, 0x4c00
 int 21h
