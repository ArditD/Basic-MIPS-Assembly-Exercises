###############################################
# SLL (instruksion logjik qe manipulon bitet  #
# dhe i sposton nga e djathta ne te majte     #
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
