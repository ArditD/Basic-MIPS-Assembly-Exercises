##################################----------------------------------------------------------------------------#
#J (jump), perdoret per te 'kercyer' nga nje adres ne tjetren (gjithmon per adresa qe jane afer njera-tjetres #
#-------------------------------------------------------------------------------------------------------------#
.globl main
.text
main:
nop        #0x00400024  - adresa ne memorje
nop        #Asgje nuk ndodh, thjesht keto instruksione rrisin vleren e PC
nop        #Dhe instruksionet vazhdojn fetch - decode - execute - increment
nop        #Pra vazhdon cikli
nop
nop
nop
nop
#Kur befas :P behet nje jump dhe kalohet tek nop-i i pare (adresa 0x00400024)
#--------------------------------------------------------------------------#
j main
ori $8, $8, 1
#----------------------------------------------------------------------------------------------------------------#
#Dhe programi kalon ne cikel, pra riegzekutohen sepse mbas jump-it
#PC merr vleren e pare gjate nisjes se egzekutimit te programit dhe keshtu kalojm ne rutine.
#Ne kete rast main quhet adrese simbolike pasi nuk kemi specifikuar adres ne hex por kemi dhene vetem direktiven
#----------------------------------------------------------------------------------------------------------------#

