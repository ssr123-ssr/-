;2022/10/11 实现1到100的循环相加,利用Jnz跳转指令实现1+2+...+100,将最后结果放到了内存地址3000:0000上
STKSEG SEGMENT STACK	
	DW 32 DUP(0)		;编译器内存中预留32个4字节，并全部填充为0
STKSEG ENDS 

DATASEG SEGMENT
	MYDATA DD 0
DATASEG ENDS

codeseg segment			
	assume cs:codeseg
MAIN PROC FAR
		mov ax,3000h	
		mov ds,ax
		mov bx,0000h	;设置地址ds:[bx]=3000:0000
	
        mov ax,0
        mov dx,1
        mov cx,0    	;设置循环100次
	L:
		add ax,dx
        inc dx
		inc cx
		cmp cx,100
		jnz	L
        mov ds:[bx],ax
     
        mov ah,4ch
        int 21h
MAIN ENDP
CODESEG ENDS
	END MAIN