.data
dat1:    .word17
dat2:    .word15
dat3:    .word1
.globl   __start
.text
__start:
main:
lw $s1,dat1
lw $s2,dat2
lw $s3,dat3
add $s4,$s1,$s2
add $s3,$s4,$s3
sub $s1,$s1,$s2
sw $s1,dat1
sw $s2,dat2
sw $s3,dat3
li $v0,10
syscall
