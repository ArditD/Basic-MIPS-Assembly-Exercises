##
## fibloop.a - looping implementation of the
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
# fib - looping implementation of the
# Fibonacci function.
#	a0 - holds parameter n
#	t0 - save second last element computed
#	t1 - used to work out each new element
#	v0 - returns result
#------------------------------------------------

fib:	move $v0,$a0	# initialise last element
	blt $a0,2,done	# fib(0)=0, fib(1)=1

	li $t0,0	# second last element
	li $v0,1	# last element

loop:	add $t1,$t0,$v0	# get next value
	move $t0,$v0	# update second last
	move $v0,$t1	# update last element
	sub $a0,1	# decrement count
	bgt $a0,1,loop	# exit loop when count=1
done:	jr $ra

#################################################
#					 	#
#     	 	data segment			#
#						#
#################################################

	.data
endl:	.asciiz "\n"

##
## end of file fibloop.a