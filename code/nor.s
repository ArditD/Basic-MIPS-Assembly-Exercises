##################################
#NOR (NOT OR) logical operation  #
##################################
.text
.globl main
main:
li $s0, 13                   #"ngarko menjehere" 13 tek $s0
li $s1, 14                   #"ngarko menjehere" 14 tek $s1
nor $t0, $s0, $s1            #kryej nje operacion NOT OR midis $s0 dhe $s1
                             #Rezultatin depozitoje tek $t0
#mbyllim programin
ori $2, $zero, 10            # DIE
syscall

#############################################################
#                        ILUSTRIMI                          #
#############################################################
#$s0 =                        0000 0000 0000 1101           #
#$s1 =                        0000 0000 0000 1110           #
#ORI                          -------------------           #
#$t0 =                        1111 1111 1111 0000           #
#$t0 =                        0xFFF0                        #
#Ose ne Dec = 65520                                         #
#############################################################
