SET R0, 0x0005
SET R1, 0x0000 
main:
ADD R1, R0 
DEC R0 
JZ fin
JMP main
fin:
JMP fin