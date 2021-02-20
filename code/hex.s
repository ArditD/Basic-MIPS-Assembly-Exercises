##
## hex.a ask user for decimal number,
##  convert to hex, print the result.
##
##	t0 - count for 8 digits in word
##	t1 - each hex digit in turn
##	t2 - number read in
##	t3 - address of area used to set up
##	     answer string
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
	move $t2,$v0	# $t2 holds hex number

	la $a0,ans1	# print string before result
	li $v0,4
	syscall

	li $t0,8	# eight hex digits in word
	la $t3,result	# answer string set up here

loop:	rol $t2,$t2,4	# start with leftmost digit
	and $t1,$t2,0xf	# mask one digit
	ble $t1,9,print	# check if 0 to 9
	add $t1,$t1,7	# 7 chars between '9' and 'A'
print:	add $t1,$t1,48	# ASCII '0' is 48
	sb $t1,($t3)	# save in string
	add $t3,$t3,1	# advance destination pointer
	add $t0,$t0,-1	# decrement counter
	bnez $t0,loop	# and continue if counter>0
	
	la $a0,result	# print result on terminal
	li $v0,4
	syscall

	li $v0,10
	syscall		# au revoir...


#################################################
#					 	#
#     	 	data segment			#
#						#
#################################################

	.data
result:	.space 8
	.asciiz "\n"
prompt:	.asciiz "Enter decimal number: "
ans1:	.asciiz "Hexadecimal is "

##
## end of file hex.a
