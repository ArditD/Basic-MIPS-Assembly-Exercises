##################################
# div - instruksioni i pjestimit #
#-----------------------------------------#
# Perdoret per numra komplement te 2-shit #
#-----------------------------------------#
.globl main
.text
main:
addiu $8, $8, -50                 # Menyre tjeter per te karikuar vleren 50
addiu $9, $0, -25                 # $9 = 25
div   $8, $9                      # Pjesto vleren qe gjendet tek $8 me ate qe gjendet tek $9
mflo  $10                         # Rezultati shkon tek $10


#-----------------------------------------------------------------#
#Egzekutojm programin dhe shohim qe $10 = 2, si eshte e mundur?   #
#Nese pjestojm -50 me -25 vlera eshte 2 apo JO? - Po		  #
#me div $8, $9 beri pjestimin dhe automatikisht rezultati vajti te#
#HI dhe regjistri LO i cili mjafton pasi ne kete rast vlera nuk   #
# i kalon 32 bitet.						  #
#Vijm tek mflo $10 - kopjo vleren e regjistrit LO (ne kete rast 2)#
#dhe çojet tek $10 keshtu qe $10 do mari vleren 2                 #
#-----------------------------------------------------------------#
