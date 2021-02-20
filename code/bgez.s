#bgez (branch on greater than 0) #
#----------------------------------------#
#bgez $R, emri | Nese $R > 0 hidhu tek : #
#----------------------------------------#

.globl main
.text
fund:                 #E perdorim per perfundimin e programit
ori $2, $0, 10
syscall
main:                 #Ketu fillon te egzekutoj spim
ori $8, $zero, 0x13   #$8 = 0x13
bgez $8, bltzja        #Nese $8 > 0 kalo tek bltz
bltzja:
nor $8, $8, $8        #Kthejm permbys.
bltz $8, fund         #Nese $8 < 0 hidhu tek fund.
