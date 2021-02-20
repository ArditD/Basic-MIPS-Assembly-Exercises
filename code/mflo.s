#---------------------------------------------------------------#
# mflo komand qe perdoret gjithmon mbas komandes mult\multu dhe #
# sherben per te spostuar rezultatin nga regjistri Lo tek       #
# tek regjistri i destinacionit.                                #
#---------------------------------------------------------------#
#po vazhdojm programin qe e pame tek mult.s			#
#---------------------------------------------------------------#

.globl main
.text
main:
ori $8, $0, 2      # $8 merr vleren 2
ori $9, $0, 2      # $9 merr vleren 2
mult $8, $9        # Shumezo $8 me $9
mflo $9            # Kopjojm permbajtjen e LO-s tek $9

#---------------------------------------------------------------#
# Te shohim nje rast tjeter                                     #
#---------------------------------------------------------------#

ori $8, $0, 17
ori $9, $0, 4023
mult $8, $9
mflo $9

ori $2, 10          #Mbyllim programin
syscall             #thirrja e sistemit
