##################################
#   Program per mbledhje (addu)  #
##################################
#add(U) kujdeset dhe per overflow# 
##################################
.text
.globl main
main:
li $8, 0xab            #Vlera 0xab shkon tek $8
li $9, 16              #vlera 16 shkon tek $9
addu $10, $8, $9       #$8 + $9 = $10
