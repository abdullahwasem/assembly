[org 0x100]

jmp start

top : dw 20
bottom : dw 30
left : dw 40
right : dw 70

top2 : dw 22
bottom2 : dw 28
left2 : dw 42
right2 : dw 68

top3 : dw 24
bottom3 : dw 26
left3 : dw 44
right3 : dw 66

start :
call clrscr
push word [top]
push word [bottom]
push word [left]
push word [right]

call makingrectangle

end :
mov ax , 0x4c00
int 0x21

clrscr : 
mov ax , 0xb800
mov es , ax
 

xor di , di
mov ax , 0x0720
moc cx , 2000

cld
rep stosw

ret


makingrectangle:

push bp
mov bp ,  sp
push ax

mov al , 80
mul byte [bp+10]
add ax , [bp+6]
shl ax , 1
mov di , ax 

push di 

mov ah , 0x04 ; red color

mov cx , [bp+4]
sub cx , [bp+6]

push cx


mov al, '*'

loop1:
rep stosw
pop bx
pop di 
push bx
dec bx 
shl bx , 1
add di , 160

mov cx , [bp+8]
sub cx , [bp+10]

sub cx , 2 

mov al , '*'

loop2:
mov si ,di
mov word [es:si] , ax
add si , bx
mov word [es:si] , ax
sub si ,bx
add di , 160
loop loop2

pop cx 
mov al , '*'

loop3: rep stosw
return:
pop ax 
pop bp
ret 8

call clrscr2
push word [top2]
push word [bottom2]
push word [left2]
push word [right2]

call makingrectangle2

end :
mov ax , 0x4c00
int 0x21

clrscr2 : 
mov ax , 0xb800
mov es , ax
 

xor di , di
mov ax , 0x0720
moc cx , 2000

cld
rep stosw

ret


makingrectangle2:

push bp
mov bp ,  sp
push ax

mov al , 80
mul byte [bp+10]
add ax , [bp+6]
shl ax , 1
mov di , ax 

push di 

mov ah , 0x03 ;  color

mov cx , [bp+4]
sub cx , [bp+6]

push cx


mov al, '*'

loop12:
rep stosw
pop bx
pop di 
push bx
dec bx 
shl bx , 1
add di , 160

mov cx , [bp+8]
sub cx , [bp+10]

sub cx , 2 

mov al , '*'

loop22:
mov si ,di
mov word [es:si] , ax
add si , bx
mov word [es:si] , ax
sub si ,bx
add di , 160
loop2 loop22

pop cx 
mov al , '*'

loop32: rep stosw
return:
pop ax 
pop bp
ret 8

call clrscr3
push word [top3]
push word [bottom3]
push word [left3]
push word [right3]

call makingrectangle3

end :
mov ax , 0x4c00
int 0x21

clrscr3 : 
mov ax , 0xb800
mov es , ax
 

xor di , di
mov ax , 0x0720
moc cx , 2000

cld
rep stosw

ret


makingrectangle3:

push bp
mov bp ,  sp
push ax

mov al , 80
mul byte [bp+10]
add ax , [bp+6]
shl ax , 1
mov di , ax 

push di 

mov ah , 0x07 ;  color

mov cx , [bp+4]
sub cx , [bp+6]

push cx


mov al, '*'

loop13:
rep stosw
pop bx
pop di 
push bx
dec bx 
shl bx , 1
add di , 160

mov cx , [bp+8]
sub cx , [bp+10]

sub cx , 2 

mov al , '*'

loop23:
mov si ,di
mov word [es:si] , ax
add si , bx
mov word [es:si] , ax
sub si ,bx
add di , 160
loop3 loop23

pop cx 
mov al , '*'

loop33: rep stosw
return:
pop ax 
pop bp
ret 8

