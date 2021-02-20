##
## temp.a ask user for temperature in Celsius,
##  convert to Fahrenheit, print the result.
##
##	v0 - reads in celsius
##	t0 - holds Fahrenheit result
##	a0 - points to output strings
##

#################################################
#					 	#
#		text segment			#
#						#
#################################################

	.text		
       	.globl __start	
__start:
	la $a0,prompt	# print prompt on terminal
	li $v0,4
	syscall

	li $v0,5	# syscall 5 reads an integer
	syscall

	mul $t0,$v0,9	# to convert,multiply by 9,
	div $t0,$t0,5	# divide by 5,then
	add $t0,$t0,32	# add 32

	la $a0,ans1	# print string before result
	li $v0,4
	syscall

	move $a0,$t0	# print  result
	li $v0,1
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
prompt:	.asciiz "Enter temperature (Celsius): "
ans1:	.asciiz "The temperature in Fahrenheit is "
endl:	.asciiz "\n"

##
## end of file temp.a
