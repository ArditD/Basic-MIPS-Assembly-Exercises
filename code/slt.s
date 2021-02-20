##################################
#    SLT (SET ON LESS THAN)	 #
#--------------------------------#----------------------------#
#Ky eshte nje instruksion pak me specifik dhe ka nje format   #
#slt d, $s, $t ku nese $s < $t d --> 1 ndryshe d --> 0	      #
#Me poshte do ti shohim te dy rastet			      #
#-------------------------------------------------------------#

.globl main
.text
main:

li $8, 15
li $9, 16
slt $10, $8, $9             #Nese $8 < $9  $10 = 1
sltu $10, $9, $8             #Nese $9 < $8  $10 = 1 Ndryshe 0 (ne kete rast duhet te behet 0)
#mbyllim programin
li $v0, 2
syscall

#U shtua dhe sltu pasi eshte e njejta gje, perdoret me numra pa shenje (pozitiv)
