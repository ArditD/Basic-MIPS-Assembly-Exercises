##################################
#            andi                #
##################################
main:
li $t0, 132             #Karikojm vleren 132 tek $t0
andi $s0, $t0, 0x1      #Vleren Imediate 0x1 e fusim te kryej nje AND
                        #me vleren qe permbahet ne regjistrin $t0 dhe 
                        #Perfundimin e fusim ne $s0 (ne kete rast 0) /vlera e $s0 nuk do ndryshoj.
