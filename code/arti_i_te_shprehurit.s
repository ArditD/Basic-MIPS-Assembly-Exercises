#####################################
#Te kryejm te njejtin veprim me     #
#shprehi (instruksione) te ndryshme #
#####################################
.text
.globl main
main:
li $t0, 19             #Ngarko vleren e menjhershme 19 tek $t0
ori $9, $zero, 19      #kryej nje OR me bitet e $0 rezultatin fute tek $9
addi $10, 19           #Shtoi ne menyre te menjehershme $10 (qe ne ket rast eshte 0) vleren 19
add $11, $0, 19        #Shtoi 19 regjistrit 0, dhe vleren depozitoje tek $11

#######################################################
#Ne te gjitha rastet rezultati eshte i njejte,        #
#regjistrat marin vleren 0x13 (19 ne dec).            #
#$t0 = 13, $t1 = 13, $t2 = 13, $t3 = 13               #
#######################################################
