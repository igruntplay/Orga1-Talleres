SET R1, 0x0C 
SET R2, 0x0F 
SET R3, rai
STR [0x00], R3
STR [0xF0], R2
SET R3, 0x02
STR [0xF1], R3
SET R7, 0x00
STI 

loop:
LOAD R3, [0xF0]
STR [0xF0], R3
JMP loop

rai:
LOAD R0, [0xF0]
CMP R0, R1
JZ pasoACurva
STR [0xF0], R2
INC R7
CMP R7, 0x20
JZ aumentoBocina
JMP finRet

aumentoBocina:
SET R7, 0x00
LOAD R3, [0xF1]
INC R3
STR [0xF1], R3
JMP finRet

pasoACurva:
STR [0xF0], R1
finRet:
IRET

