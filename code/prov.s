.data
dati:	            .word   	17
datj:	            .word   	15
datf:	            .word   	10
datg:	            .word   	2
dath:	            .word   	1
.globl	__start
.text
__start:
main:
lw	$s1, dati
lw	$s2, datj
lw	$s3, datg
lw	$s4, dath
bne	$s1, $s2, ELSE
add	$s5, $s3, $s4
j	EXIT
ELSE:	sub	$s5, $s3, $s4
EXIT:
sw	$s5, datf

li	$v0, 10
syscall

