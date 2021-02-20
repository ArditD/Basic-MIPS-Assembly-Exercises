##################################
#          nop  (:               #
##################################
.text
.globl main
main:           
                                # Adresat ne Memorje
li $t0, 14                      # 0x00400024
nop                             # 0x00400028   
li $t1, 14                      # 0x0040002c
nop                             # 0x00400030
li $t2, 14                      # 0x00400034
nop                             # 0x00400038
li $t3, 14                      # 0x0040003c
nop                             # 0x00400040
li $v0, 10                      #mbyllim programin 
syscall

###############################
#        Shpjegimi            #
###################################################################
#Jo pa qellim tek komentimi vendosa qelite e memorjes             #
#sepse kur egzekutohet instruksioni nop ne fjale te tjera         #
#"nuk ndodh asgje" porse ne realitet egzekutohet nje instruksion  #
#dhe memorja mbushet me 000000000000000000000000                  #
#dhe kalohet ne qelin e ardhshme                                  #
###################################################################
