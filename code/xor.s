##################################
#              XOR               #
##################################
.text
.globl main

main:
ori $8, 0x0ABC         #0x0ABC shkon direkt tek $8 (sepse or me vetveten del pasqyrim)
ori $9, $0, 0x0BCD     #0x0BCD dhe kjo karikohet ne $9
xor $10, $9, $8        #Kryhet operacion XOR midis biteve qe permban $8 e biteve qe ndodhen tek $9

#Te shohim ç'fare ndodh
###############################################
#$8 = 0x0ABC =       0000 1010 1011 1100
#$9 = 0x0BCD =       0000 1011 1100 1101
#$10 = $8 xor $9  =  0000 0001 0111 0001
#1 0111 0001  = 369 ne dec ose 0x171
#Perfundimisht vlera e $10 duhet te jete 0x171
################################################
