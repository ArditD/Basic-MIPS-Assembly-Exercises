##################################------------------------------------#
#mfhi eshte nje instruksion i cili leviz permbajtjen e regjistrit HI  #
#tek nje regjister tjeter | mfhi $regjister                           #
#Perdoret gjithmon mbas instruksioneve mult\multu		      #
#---------------------------------------------------------------------#


.globl main            
.text                  
main:                  

addiu $s0, $0, -32678                #Karikojm vleren negative decimale 13 tek $s0     
addiu $s1, $0, 32678                 #Karikojm vleren negative hexadecimale 0x13
mult  $s0, $s1                       #$s0 x $s1   /siç e dime rezultati shkon tek regjistrat LO dhe HI
mfhi  $s2                            #Levizim vleren e regjistrit HI tek $s2

#-------------------------------------------------------------------#
#				Sqarim				    #
#-------------------------------------------------------------------#

#----------------------------------------------------------------------------------#
#Po te shumezojm -32678 mr 32678 ne hex do te kemi nje vlere qe			   #
#do te duhen 64 bit per ta permbajtur, ose 2 regjistra nga 32 bit secili.	   #
#mult $s0, $s1  = HI(ffffffff) LO(c059e05c)					   #
#mfhi $s2 thote LEVZI PERMBAJTJEN E HI dmth ffffffff tek $s2			   #
#dhe realisht ne fund te programit do te shohim qe vlera e $s2 do te jete ffffffff #
#----------------------------------------------------------------------------------#

ori $2, 10                           #Un them ta mbyllim :P
syscall				     # Da end
