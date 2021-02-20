	.data
str1: .asciiz "Enter the number:"
	.align 2 		#move to a word boundary
res: 	.space 4 		# reserve space to store result
	.text
	.globl main
	
main:	li $v0, 4	# code to print string
	la $a0, str1
	syscall
	
	li $v0, 5 	# code to read integer
	syscall
	
	move $t0, $v0 		# move the value read to $t0
	add $t1, $t0, $t0 	# multiply by 2
	sw $t1, res($0) 		# store result in memory
	li $v0, 1 			# code to print integer
	move $a0, $t1 		# the value to be printed in $a0
	syscall 			# print to the screen
	
	li $v0, 10 		# code for program end
	syscall