.MODEL SMALL
.STACK 100H
.DATA
 MSG  DB          'Enter Your Number: $'
 MSG0 DB 0DH,0AH, 'Your Grade Is: 0.0 $'
 MSG1 DB 0DH,0AH, 'Your Grade Is: 1.0$'
 MSG2 DB 0DH,0AH, 'Your Grade Is: 2.0$'
 MSG3 DB 0DH,0AH, 'Your Grade Is: 3.0$'
 MSG4 DB 0DH,0AH, 'Your Grade Is: 4.0$'
 MSG5 DB ,0DH,0AH, 0DH,0AH, 0DH,0AH, '$' 
 NUM DB ?
.CODE

    MAIN PROC   
        MOV AX, @DATA
        MOV DS, AX
        
        MOV CX, 097
        
        GradingMethod:
        LEA DX, MSG
        MOV AH, 9
        INT 21H
        
        
        MOV BH, 0
        MOV BL, 10D
        
        INPUT:
        MOV AH, 1
        INT 21H
        CMP AL, 13D
        JNE NUMBER
        
        JMP GRADE
        
        NUMBER:
        SUB AL, 30H
        MOV CL, AL
        MOV AL, BH
        MUL BL
        ADD AL, CL
        MOV BH, AL
        
        JMP INPUT
         
      
        
        
        
        GRADE:
        CMP BH, 090
        JGE GRADE4
        CMP BH, 100
        JE GRADE4
        
        CMP BH, 080
        JGE GRADE3
        CMP BH, 089
        JE GRADE3
        
        CMP BH, 060
        JGE GRADE2
        CMP BH, 079
        JE GRADE2
        
        CMP BH, 040
        JGE GRADE1
        CMP BH, 059
        JE GRADE
        
        CMP BH, 039
        JLE GRADE0
        
        
        
        
        GRADE0:
        LEA DX, MSG0
        MOV AH, 9
        INT 21H
        JMP EXIT
        
        GRADE1:
        LEA DX, MSG1
        MOV AH, 9
        INT 21H
        JMP EXIT
        
        GRADE2:
        LEA DX, MSG2
        MOV AH, 9
        INT 21H
        JMP EXIT
        
        GRADE3:
        LEA DX, MSG3
        MOV AH, 9
        INT 21H
        JMP EXIT
        
        GRADE4:
        LEA DX, MSG4
        MOV AH, 9
        INT 21H
        JMP EXIT
         
       
        EXIT:
        
        LEA DX, MSG5
        MOV AH, 9
        INT 21H
         
        
        LOOP GradingMethod
        
        MOV AH, 4CH
        INT 21H
        MAIN ENDP
    END MAIN
        
        
        