[org 0x100]

jmp start

noFormatText: db 'No format was matched.',0
month0: db 'January',0
month1: db 'February',0
month2: db 'March',0
month3: db 'April',0
month4: db 'May',0
month5: db 'June',0
month6: db 'July',0
month7: db 'August',0
month8: db 'September',0
month9: db 'Octuber',0
month10: db 'November',0
month11: db 'December',0

week1: db 'Sunday',0
week2: db 'Monday',0
week3: db 'Tuesday',0
week4: db 'Wednesday',0
week5: db 'Thursday',0
week6: db 'Friday',0
week7: db 'Saturday',0


oldisr: dd 0

clearScreen:
		
	push ax
	push cx
	push di
	push es

	mov ax,0xB800
	mov es,ax
	mov cx,2000
	xor di,di
	mov ax,0x0720
	rep STOSw

	pop es
	pop di
	pop cx
	pop ax
	ret


printDay:
	cmp al,0
	jne nextDay
	mov ax,07
	push ax
	mov ax,week1
	push ax
	call printstr
    jmp exit3
	nextDay:
	cmp al,1
	jne nextDay1
	mov ax,07
	push ax
	mov ax,week2
	push ax
	call printstr
    jmp exit3
	nextDay1:
	cmp al,2
	jne nextDay2
	mov ax,07
	push ax
	mov ax,week3
	push ax
	call printstr
    jmp exit3
	nextDay2:
	cmp al,3
	jne nextDay3
	mov ax,07
	push ax
	mov ax,week4
	push ax
	call printstr
    jmp exit3
	nextDay3:
	cmp al,4
	jne nextDay4
	mov ax,07
	push ax
	mov ax,week5
	push ax
	call printstr
    jmp exit3
	nextDay4:
	cmp al,5
	jne nextDay5
	mov ax,07
	push ax
	mov ax,week6
	push ax
	call printstr
    jmp exit3
	nextDay5:
	cmp al,6
	jne nextDay6
	mov ax,07
	push ax
	mov ax,week7
	push ax
	call printstr
	nextDay6:

	exit3: 
    ret
printMonthDay:
	xor bx,bx
	mov bl,dl
	push bx
	call printnum
	ret

printYear:
	push cx
	call printnum
	ret

printMonth:
	cmp dh,1
	jne nextMonth
	mov ax,07
	push ax
	mov ax,month0
	push ax
	call printstr
    jmp exit2
	nextMonth:
	cmp dh,2
	jne nextMonth1
	mov ax,07
	push ax
	mov ax,month1
	push ax
	call printstr
    jmp exit2
	nextMonth1:
	cmp dh,3
	jne nextMonth2
	mov ax,07
	push ax
	mov ax,month2
	push ax
	call printstr
    jmp exit2
	nextMonth2:
	cmp dh,4
	jne nextMonth3
	mov ax,07
	push ax
	mov ax,month3
	push ax
	call printstr
    jmp exit2
	nextMonth3:
	cmp dh,5
	jne nextMonth4
	mov ax,07
	push ax
	mov ax,month4
	push ax
	call printstr
    jmp exit2
	nextMonth4:
	cmp dh,6
	jne nextMonth5
	mov ax,07
	push ax
	mov ax,month5
	push ax
	call printstr
    jmp exit2
	nextMonth5:
	cmp dh,7
	jne nextMonth6
	mov ax,07
	push ax
	mov ax,month6
	push ax
	call printstr
    jmp exit2
	nextMonth6:
	cmp dh,8
	jne nextMonth7
	mov ax,07
	push ax
	mov ax,month7
	push ax
	call printstr
    jmp exit2
	nextMonth7:
	cmp dh,9
	jne nextMonth8
	mov ax,07
	push ax
	mov ax,month8
	push ax
	call printstr
    jmp exit2
	nextMonth8:
	cmp dh,10
	jne nextMonth9
	mov ax,07
	push ax
	mov ax,month9
	push ax
	call printstr
    jmp exit2
	nextMonth9:
	cmp dh,11
	jne nextMonth10
	mov ax,07
	push ax
	mov ax,month10
	push ax
	call printstr
    jmp exit2
	nextMonth10:
	cmp dh,12
	jne nextMonth11
	mov ax,07
	push ax
	mov ax,month11
	push ax
	call printstr
    jmp exit2
	nextMonth11:	
	exit2:
    ret




printnum: 
	push bp 
	mov bp, sp 
	push es 
	push ax 
	push bx 
	push cx 
	push dx 
	mov ax, 0xb800 
	mov es, ax ; point es to video base 
	mov ax, [bp+4] ; load number in ax 
	mov bx, 10 ; use base 10 for division 
	mov cx, 0 ; initialize count of digits 
	nextdigit: 
		mov dx, 0 ; zero upper half of dividend 
		div bx ; divide by 10 
		add dl, 0x30 ; convert digit into ascii value 
		push dx ; save ascii value on stack 
		inc cx ; increment count of values 
		cmp ax, 0 ; is the quotient zero 
		jnz nextdigit ; if no divide it again 
	
	nextpos: pop dx ; remove a digit from the stack 
		mov dh, 0x07 ; use normal attribute 
		mov [es:di], dx ; print char on screen 
		add di, 2 ; move to next screen location 
		loop nextpos ; repeat for all digits on stack
	pop dx 
	pop cx 
	pop bx 
	pop ax 
	pop es 
	pop bp 
	ret 2


printstr: 
	push bp 
	mov bp, sp 
	push es 
	push ax 
	push cx 
	push si 
	push ds 
	pop es 
	push di
		mov di, [bp+4] 
	
	mov cx, 0xffff 
	xor al, al 
	repne scasb 
	mov ax, 0xffff
	sub ax, cx
	dec ax  
	jz exit 
	mov cx, ax 
	mov ax, 0xb800 
	mov es, ax 
	mov si, [bp+4] 
	mov ah, [bp+6]
    pop di 
	cld 
	nextchar: 
		lodsb 
		stosw 
		loop nextchar 
	exit: 
		pop si 
		pop cx 
		pop ax 
		pop es 
		pop bp 
 ret 4


printDate:	
	
	push ax
	push bx
	push cx
	push di
	push es
	push dx
	
	mov ax,0xB800
	mov es,ax

	mov di,322
	xor ax,ax
		mov ah,0x2A
		int 21h
		call printDay
		mov ax,0x072C
		STOSw
		call printMonth
		mov ax,0x0720
		STOSw
		call printMonthDay
		mov ax,0x072C
		STOSw

		call printYear

	exit1: 
		mov al,0x20
		in 0x20,al
		pop dx
		pop es
		pop di 
		pop cx
		pop bx
		pop ax

    iret
	
		
	


start:

	mov ah,0
	int 16h
	call clearScreen
                                
	mov ah,0
	int 16h

	xor ax,ax

	mov es,ax
	mov ax, [es:80h*4]
	mov [oldisr],ax
	mov ax, [es:80h*4+2]
	mov [oldisr+2],ax

	cli

	mov word [es:80h*4],printDate
	mov [es:80h*4+2],cs
	
	sti

	int 80h

	
	mov ax,[oldisr]
	mov bx,[oldisr+2]
	cli 
	mov [es:80h*4],ax
	mov [es:80h*4+2],bx

	sti


mov ax,0x4c00
int 21h