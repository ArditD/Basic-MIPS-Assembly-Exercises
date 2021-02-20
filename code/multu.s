##################################---------------------------------------------------------------------#
#       multu - shumezim         # Ky shumezim perdoret per numra pa shenje dhe egziston trap overflow #
#--------------------------------#---------------------------------------------------------------------#
#Ndryshe nga mult qe perdoret per numra me shenje dhe injoron overflow kete mund ta krahasojm me add   #
# ne mbledhje               									       #
#------------------------------------------------------------------------------------------------------#

.globl main            #Programi eshte global do te thote qe mund te perdoret nga programe te jashtme (nuk eshte priv8)
.text                  #Direktive qe i jepet asemblerit qe i thote se kjo eshte pjesa text ne memorjen ram dhe jane te dhenat per egzekutimin e programit
main:                  #Direktive qe jep fillimin e egzekutimit te programit

li $s0, 10             #Tek $s0 ngarkojm vleren 10
li $s1, 11             #Tek $s1 ngarkojm vleren 11
multu $s0, $s1         #Shumezojm vleren e $s1-shit me vleren e $s2 (ne te dy regjistrat kemi numra pozitiv)

#----------------------------------------------------#
# Vlera e LO do te jete 0000006e  = 110 ne Decimal   #
#----------------------------------------------------#
