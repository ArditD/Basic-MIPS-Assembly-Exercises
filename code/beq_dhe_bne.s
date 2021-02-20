##################################----------------------------------------------#
# beq (branch on equal) kalo nese eshte e barabart eshte nje instruksion i cil  #
# emulon "nese x = y  ..."							#
#-------------------------------------------------------------------------------#
# bne (branch on not equal) kalo ne X pjese te programit nese nuk               #
# eshte e barabart                                                              #
#-------------------------------------------------------------------------------#
.globl main
.text
main:
#---------------------------BEQ-----------------------------#
ori $8, $0, 0x13                        #$8 merr vleren 0x13
ori $9, $0, 0x13			#$9 merr vleren 0x13
beq $8, $9, ivertet      		#Nese $8 = $9 kalo tek "ivertet" (i cili vjen menjeher mbrapa)
ivertet:
#---------------------------BNE-----------------------------#
ori $10, $zero, 0x14              	#$10 merr vleren 0x14
bne $10, $9, joivertet                  #Nese $10 nuk eshte i vertet me $9 hidhu tek "joivertet"
joivertet:
j vdis                                  #jump (hidhu tek vdis) [mbyllja e programit]
vdis:
ori $2, $0, 10
syscall 
