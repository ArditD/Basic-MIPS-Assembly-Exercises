##################################
        .data
vlera:  .word 0x12345678
        .text
main: 
la $s1, vlera  #fusim 0x12345678 tek $s0
li $v0, 10     #mbyllim programin 
syscall
