##################################
#            XORI                #
##################################
.text
.globl main
main:
ori $8, $zero, 0xABC           #Fusim 0xABC tek regjistri $8 pasi dihet qe OR me $zero (qe eshte gjithmon 0) jep vetveten
xori $9, $8, 0xDEF             #Meqenese kemi xor(I) atehere nuk kemi nevoj per 3 regjistra porse per 2
                               #Dhe me vleren 0xDEF (imediate) kryejm nje xor me vleren e regjistrit $8 dhe 
                               #rezultatin e depozitojm tek $9
