##################################-----------------------------------------#
#sra (shift right arithmetic) perdoret per te spostuar djathtas		   #
#bitet por ne ndryshim nga srl ato qe heq nga e majta i kalon ne te djatht #
#--------------------------------------------------------------------------#

main:
addiu $t0, -4
sra $t1, $t0, 2      

#Perdoret per pjestime me 2 sepse eshte me i pershtatshem dhe i shpejt se div

#shembull, te pjestojm 4 me 2
li $t0, 4
sra $t1, $t0, 1                   #tek $t1 do te gjejm vleren 2 ;)
