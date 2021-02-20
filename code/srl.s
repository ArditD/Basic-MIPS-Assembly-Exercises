##################################
#SRL (shift right logical)       #
##################################
.text
.globl main
main:
ori $8, $0, 0xABC            #$8 = 0xABC
srl $9, $8, 1                #Spostojm djathtas me 1 tek bitet e $8, rezultatin e depozitojm tek $9
srl $9, $9, 2                #Spostojm djathtas me 2 tek $9, rezultatin e ruajm ne te njejtin vend
li $v0, 10                   #Nese v0 = 10 /syscall == Programi ne egzekutim mbyllet
syscall
#################################
#          ILUSTRIM             #
###########################################
#$8 = 0xABC = 0000 1010 1011 1100         #
#srl me 1  ==>0000 0101 0101 1110         #
#Siç e shohim bitet jane spostuar         #
#me 1 djathtas                            #
#srl me 2 tek $9 duke marre vetveten ($9) #
#ishte :      0000 0101 0101 1110         #
#behet :      0000 0001 0101 0111         #
#Humbet njeri 1-sh                        #
###########################################
