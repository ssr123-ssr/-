;2022/10/11 ʵ��1��100��ѭ�����,����Loopѭ��ʵ��1+2+...+100,��������ŵ����ڴ��ַ3000:0000��
STKSEG SEGMENT STACK	
	DW 32 DUP(0)		;�������ڴ���Ԥ��32��4�ֽڣ���ȫ�����Ϊ0
STKSEG ENDS 

DATASEG SEGMENT
	MYDATA DD 0
DATASEG ENDS

codeseg segment			
	assume cs:codeseg
MAIN PROC FAR
		mov ax,3000h	
		mov ds,ax
		mov bx,0000h	;���õ�ַds:[bx]=3000:0000
		
        mov ax,0
        mov dx,1
        mov cx,100     ;����ѭ��100��
      s:add ax,dx
        inc dx
        loop s
     
        mov ds:[bx],ax
		xor ax,ax
		mov ah,2
		int 21h
     
        mov ah,4ch
        int 21h
MAIN ENDP
CODESEG ENDS
	END MAIN