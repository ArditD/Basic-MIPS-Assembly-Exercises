#############################################################################
#Jo - Pseudoinstruksione - ketu po shkruajm realisht ne assembly te paster  #
#############################################################################

.text
.globl main
main:
ori $8, $0, 0x1            #Fusim 1-shin tek 0 dhe nga aty tek regjistri 8
ori $9, $0, 0x2            #Fusim 2-shin tek 0 e nga aty tek rregjistri 9
addu $10, $8, $9           #Mbledhim permbajtjen e 8-tes me ate te 9-ntes dhe e fusim tek regjistri 10
#Ne vend te ori jemi mesuar te shkruam li dhe ne vend te $8 jemi mesuar te shkruajm emrin e regjistrit
