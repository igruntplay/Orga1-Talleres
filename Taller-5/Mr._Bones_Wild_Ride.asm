SET R0, 0x00 // 00 = no en curva - 01, en curva
SET R1, rai // set rai
SET R4, 0x00 //comparador cero
SET R5, 0x00 //store velocidades
SET R6, 0x20 // comp bocina
STR [0x00], R1


SET R2, 0x02 // intensidad inicial bocina
STR [0xF1], R2 
SET R3, 0x00  // cantidad de curvas atravesadas

STI

faseVelocidad: 
CMP R0, R4 // inicio del ciclo
JZ velocidadMax

velocidadCurva:
SET R5, 0x0C
STR[0xF0], R5
JMP faseBocina

velocidadMax:
SET R5, 0x0F
STR[0xF0], R5 

faseBocina:
CMP R3, R6
JZ aumentarBocina

reiniciarCiclo:
JMP faseVelocidad

aumentarBocina:
INC R2
STR [0xF1], R2
SET R3, 0x00
JMP faseVelocidad

fin:
CLI

halt:
JMP halt

rai: 
CMP R0, R4
JZ entrarCurva 
JMP salirCurva

entrarCurva:
INC R0
IRET

salirCurva:
DEC R0
INC R3
IRET

