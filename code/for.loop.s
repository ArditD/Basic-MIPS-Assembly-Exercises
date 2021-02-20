# a simple couting for loop and a conditional if-then-else statement
	
	.data
L1: 	.word 0x44,22,33,55 	# array for which we will compute the sum
	
	.text
	.globl main

main:	la $t0, L1			# initialize starting address
	li $t1, 4			# initialize loop count
	add $t2, $t2, $zero	# initialize sum

loop:	lw $t3, 0($t0)		# load first element
	add $t2, $t2, $t3		# update sum
	addi $t0, $t0, 4		# point to next word
	addi $t1, $t1, -1		# decrement count
	bne $t1, $zero, loop	# check if done
	
	bgt $t2, $0, then		# if the sum >0, move sum to $s0
	move $s0, $t2	
	j exit
then:	move $s1, $t2		# else move sum to $s1

exit: li $v0, 10
	syscall
	
