##
## fib.a - recursive implementation of the
##         Fibonacci function.
##
##	a0 - value to test function
##

#################################################
#					 	#
#		text segment			#
#						#
#################################################

	.text		
       	.globl __start 
__start:		# execution starts here
	li $a0,9
	jal fib		# call fib
	move $a0,$v0	# print result
	li $v0, 1
	syscall

	la $a0,endl
	li $v0,4
	syscall

	li $v0,10
	syscall		# au revoir...

#------------------------------------------------
# fib - recursive implementation of the
# Fibonacci function.
#	a0 - holds parameter n
#	s0 - holds fib(n-1)
#	v0 - returns result
#------------------------------------------------

fib:	sub $sp,$sp,12 	# save registers on stack
	sw $a0,0($sp)
	sw $s0,4($sp)
	sw $ra,8($sp)

	bgt $a0,1,notOne
	move $v0,$a0	# fib(0)=0, fib(1)=1
	b fret		# if n<=1

notOne:	sub $a0,$a0,1	# param = n-1
	jal fib		# compute fib(n-1)
	move $s0,$v0	# save fib(n-1)

	sub $a0,$a0,1	# set param to n-2
	jal fib		# and make recursive call
	add $v0,$v0,$s0	# add fib(n-2)

fret:	lw $a0,0($sp) 	# restore registers
	lw $s0,4($sp)
	lw $ra,8($sp)
	add $sp,$sp,12
	jr $ra

#################################################
#					 	#
#     	 	data segment			#
#						#
#################################################

	.data
endl:	.asciiz "\n"

##
## end of file fib.a