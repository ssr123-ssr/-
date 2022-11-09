PUBLIC IPP,BUF0,YEAR,MONTH,DAY

EXTRN DISP:FAR
EXTRN GETINFO:FAR

STKSEG SEGMENT STACK
DW 32 DUP(0)
STKSEG ENDS

DATASEG SEGMENT para 'dat'
	MSG DB "WHAT IS THE DATE(MM/DD/YY)?,LIKE: 10252022",'$'
	MSG1 DB "PLEASE INPUT THE DATE : ",'$'
	MSG2 DB "THE DATE(YY-MM-DD) IS:",'$'
	PR DB "-$" ;结果
	LINE DB 0DH,0AH,'$'   ;换行
	IPP DW 0000H   ;IP
	BUF0 DB 9
	DB ?
	DB 9 DUP (?)
	P DW ?  
	YEAR DW ?
	MONTH DW ?
	DAY DW ?
DATASEG ENDS

CODE SEGMENT
	ASSUME CS:CODE,DS:DATASEG,SS:STKSEG
	
PUT MACRO REG   ;关于输出的宏调用，输出值存放在reg中
	LEA DX,REG
	MOV AH,09H
	INT 21H
ENDM

MAIN PROC FAR
START:
	MOV AX,DATASEG
	MOV DS,AX	;段寄存器和堆栈初始化
		
	PUT MSG
	PUT LINE
	PUT MSG1
	MOV DL,07H	;响铃一次
	MOV AH,2
	INT 21H		
	CALL GETNUM	;调用GetNum，接受键入的月、日、年值
	PUT LINE
	PUT MSG2
	
	CALL GETINFO	;调用子模版，获得MONTH,DAY,YEAR
	
	MOV DX,YEAR
	CALL DISP		;调用Disp显示年值
	PUT PR
	MOV DX,MONTH	
	CALL DISP		;调用Disp显示月值
	PUT PR
	MOV DX,DAY		
	CALL DISP		;调用Disp显示日值
	
	MOV AX,4C00H	;返回DOS
	INT 21H
	HLT
MAIN ENDP

GETNUM PROC  		;获取函数没能通过子模版实现
	POP IPP
	PUSH AX
	LEA DX,BUF0
	MOV AH,10
	INT 21H		;把输入的日期数据保存到缓存区BUF0中
	POP AX
	PUSH IPP
	RET
GETNUM ENDP

CODE ENDS
END START
	
	