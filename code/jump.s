.data
datk:	.word	2
dati:	.word	15
datj:	.word	10
datg:	.word	17
dath:	.word	16
datf:	.word	1

	.globl	jumpTable
	.globl	L2
jumpTable:	.word	L0
		.word	L1
		.word	L2
		.word	L3
	

	.globl	__start
	.text
__start:
main:
	lw	$s1,datk		# memorizzo in s1 k -> s1 = k
	lw	$s2,dati		# memorizzo in s2 i -> s2 = i
	lw	$s3,datj		# memorizzo in s3 j-> s3 = j
	lw	$s4,datg		# memorizzo in s4 g ->s4 = g
	lw	$s5,dath		# memorizzo in s5 h-> s5 = h
	addi	$s6,$0,4		# memorizzo in s6 4-> s6 = 4
	add	$s7,$0,$0		# memorizzo in s7 0 ->s7 = 0
	addi	$t0,$0,1		# memorizzo in t0 1 -> t0 = 1

CICLO:				# ciclo per creare s7 = k * 4
	beq	$0,$s1,FINE		# if s1 = 0 goto FINE
	add	$s7,$s7,$s6		# s7 = s7 + 4
	sub	$s1,$s1,$t0		# s1 = s1 - 1 
	j	CICLO
	
FINE:				# dopo il ciclo s7 = 8
	lw	$t8, jumpTable($s7)
                               #t8=jumpTable+s7=iumpTable+8 
				# t8 e' uguale a L2 !			
	jr	$t8
L0:	add	$t9, $s2,$s3
	j	EXIT
L1:	add	$t9,$s4,$s5
	j	EXIT
L2:	sub	$t9,$s4,$s5
	j	EXIT
L3:	sub	$t9,$s2,$s3
	
EXIT:
	sw	$t9,datf
	
	li	$v0,10
	syscall
