##
## reverse.a - reverse the character
## string "str".
##
##	t1 - points to the string
##	t0 - holds each byte from string in turn
##

#################################################
#					 	#
#		text segment			#
#						#
#################################################


	.text		
       	.globl __start 
__start:		# execution starts here
	la $t1,str	# a0 points to the string
nextCh:	lb $t0,($t1)	# get a byte from string
	beqz $t0,strEnd	# zero means end of string
	sub $sp,$sp,4	# adjust stack pointer
	sw $t0,($sp)	# PUSH the t0 register
	add $t1,1	# move pointer one character
	j nextCh	# go round the loop again

strEnd:	la $t1,str	# a0 points to the string
store:	lb $t0,($t1)	# get a byte from string
	beqz $t0,done	# zero means end of string
	lw $t0,($sp)	# POP a value from the stack
	add $sp,$sp,4	# and adjust the pointer
	sb $t0,($t1)	# store in string
	add $t1,1	# move pointer one character
	j store

done:	la $a0,str	# system call to print
	li $v0,4	# out a message
	syscall

	la $a0,endl	# system call to print
	li $v0,4	# out a newline
	syscall

	li $v0,10
	syscall		# au revoir...


#################################################
#					 	#
#     	 	data segment			#
#						#
#################################################

	.data
str:	.asciiz "hello world"
endl:	.asciiz "\n"

##
## end of file reverse.a
