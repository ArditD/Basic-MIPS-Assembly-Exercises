##################################------------------------------------------#
# BLTZ (branch on less than 0) nese numri < 0 hidhu tek : diçka             #
#---------------------------------------------------------------------------#
.globl main
.text
main:
ori $8, $0, 1234            #bah, sbesoj se ka me nevoj per koment xD
nor $9, $8, $8              #nor i $8 me $8 , rezultati shkon tek $9 (numri kthehet ne negativ)
bltz $9, fund               #Nese vlera ne $9 < 0 kalo tek fund:
fund:
ori $2, $0, 10
syscall
