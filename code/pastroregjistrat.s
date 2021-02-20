##################################
#     Pastro Regjistrin          #
##################################
# Metod per te pastruar regjistra

main:
################----------Rasti 1------------#########################
li $t1, 0xFFFF                       #"bejm pis" regjistrin $t1
                                     # E Pastrojm regjistrin me addi duke kryer oepracionin tek $0
andi $t1, $0, 0xABCD                 #0xABCD AND 0000000000000 do japi perher 0 keshtu qe 
                                     #$t1 do te pastrohet dhe do te mari vleren 0
################----------Rasti 2------------#########################

li $t1, 0xABCDEF               #E ngarkojm me vleren 0xABCDEF
or $t1, $0, $0                 #Ori midis 2 regjistrave me 0 jep gjithmon 0 keshtu qe $t1 = 0

#Perpiqu qe te krijosh raste te tjera me instruksione te tjera (:
