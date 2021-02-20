#--------------------------------#
#            SUBU                #
#--------------------------------#-----------------------------------------#
#Subu eshte nje instruksion qe ben zbritjen dhe injoron overflowut negativ #
#--------------------------------------------------------------------------#
.globl main
.text
main:
addiu $8, $0, -0x13         #Vlera -0x13 shkon tek $8
addiu $9, $0, -0x19         #Vlera -0x19 shkon tek $9
subu  $10, $9, $8           #$10 = $8 - $9  |  Injorohet overflow
