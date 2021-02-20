###############################################
#SLLFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF#
###############################################
.text
.globl main
main:
ori $8, $0, 0xF         #Vlera 0xF shkon tek regjistri $8
sll $9, $8, 3           #Ky instruksion thote: "Tek regjistri $8 kushdo qofte vlera do kryesh
                        #nje spostim bitesh nga e djathta ne te majte prej 3, rezultatin
                        #do e fusesh tek $9
#Vazhdojm me nje spostim direkt ne bite
sll $9, $9, 1           #Ne kete rast kryejm nje spostim "brenda per brenda" me 1
sll $10, $9, 4
sll $11, $10, 2
sll $11, $11, 2
sll $12, $11, 3
sll $12, $12, 1
sll $13, $12, 4
sll $14, $13, 1
sll $14, $14, 3
sll $15, $14, 4
sll $zero, $0, 0        #LoL, kjo duhet tu bej per te qeshur :D :?
ori $v0, $zero, 10              #mbyllim programin 
syscall
##################################################
#0000000f
#000000f0
#00000f00  ----------------
#0000f000  ----------------        REZULTATI :D
#000f0000  ----------------
#00f00000
#0f000000
#f0000000
##################################################
