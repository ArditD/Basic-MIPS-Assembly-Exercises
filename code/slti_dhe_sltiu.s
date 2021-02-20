##################################
#        slti - sltiu            #
#--------------------------------------------------------------------------------#
#Set on less than immediate							 #
#slti - perdoret per numra komplement te 2-shit (pranon negativ)		 #
#sltiu - perdoret per numra pozitiv (u eshte per unsigned)			 #
#Sintaksa eshte e njejte me slt perveç se ketu shtohet imm (vlera e menjhershme) #
#--------------------------------------------------------------------------------#
.globl main
.text
main:
ori $8, $8, 0x14                     #$8 merr vleren 0x14
sltiu $9, $8, 0x15 		     #Nese $8 < 0x15 (ne kete rast eshte me i vogel) $9 = 1
nor $9, $9, $9                       #$9 nor $9 / kthejm me koke posht gjithçka (e kthejm ne numer negativ)
slti $10, $9, 0xf                    #Nese $9 < se 0xf $10 = 1 ndryshe 0
ori $2, $2, 10
syscall
