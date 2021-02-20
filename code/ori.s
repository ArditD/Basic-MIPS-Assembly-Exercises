##################################
#  li - pseudo instruksion
#  ori - instruksioni real
##################################
.text
.globl main
main:
li $t0, 0x3  #karikojm vleren e menjehershme 3 ne $s0
ori $t0, $zero, 0x3 #kryejm nje operacion "bitwise" (krahasojm bitet) 
                    #dhe vleren 3 e depozitojm tek $s0 [e njejta gje]
ori $t1, $0, 0x3  #e njejta gje ne regjister tjeter 
############################################################################
#Siç e dime regjistri $0 ka 32 bite (si ç'do regjister) dhe ne 
#ndryshim nga regjistrat e tjere te 32 bitet jane 0 atehere ç'fare ndodh
#kur ne bejm nje ori me 0x3?
#3 ne binar ne form 32 bit mund te shkruhet edhe si:
#               0000 0000 0000 0011  ==>> 0x3
#0000 0000 0000 0000 0000 0000 0000 0000  ==>> $0
#-----------------------------------------------------  ORI (OSE)
#0000 0000 0000 0000 0000 0000 0000 0011  ==>> Rezultati
############################################################################
#Pyetje:
#Pse tek 0x3 kemi shenuar vetem 16 bite dhe jo 32?
#Pergjigje:
#Sepse ori eshte i formatit I, dhe lejon qe konstantja te kete vetem 16 bit vler
#Nese ka me shume atehere na SPIM na jep Error, (gabim)
############################################################################
