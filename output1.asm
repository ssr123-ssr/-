assume cs:code, ds:data, ss:stack
 
data segment
    db 'Tongji University!'
    db 2                                            
data ends
 
stack segment stack
    db 16 dup(0)
stack ends
 
code segment
start:
    mov ax,data
    mov ds,ax
    mov bx,0
    mov di,18
    
    mov ax,stack
    mov ss,ax
    mov sp,0  
    
    mov ax,0b800h
    mov es,ax
	
	mov ah,06H			;BIOS清屏
    mov al,0
    mov ch,0  ;(0,0)
    mov cl,0
    mov dh,24  ;(24,79)
    mov dl,79
	int 10H
	
	
	; mov cx,4000
; L1:	mov dl,00H		;输出满屏的空格以实现清屏
	; mov dh,00H
	; mov es:[bx],dx
	; add bx,2
	; loop L1
	
	
	mov bx,0
    mov si,160*13+31*2;将字符输出到屏幕中央
                      ;(显示器可以显示25行，每行80个字符，每个字符两个字节)
	mov dh,ds:[di]
	mov cx,18
L2:	mov dl,ds:[bx] 		;依次填入输出字符
	mov es:[si],dx
	add si,2
	inc bx
	loop L2
    
    mov ax,4c00h
    int 21h
code ends
end start