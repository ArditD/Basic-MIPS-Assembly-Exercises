##
## vowel.a - prints out number of vowels in 
##         - the string str
##
##	a0 - points to the string
##

#################################################
#					 	#
#		text segment			#
#						#
#################################################

	.text		
       	.globl __start 
__start:		# execution starts here


	la $a0,str
	jal vcount	# call vcount

	move $a0,$v0
	li $v0,1
	syscall	 	# print answer


	la $a0,endl
	li $v0,4
	syscall 	# print newline

	li $v0,10
	syscall		# au revoir...

#------------------------------------------------
# vowelp - takes a single character as a
# parameter and returns 1 if the character 
# is a (lower case) vowel otherwise return 0.
#	a0 - holds character
#	v0 - returns 0 or 1
#------------------------------------------------

vowelp:	li $v0,0
	beq  $a0,'a',yes
	beq  $a0,'e',yes
	beq  $a0,'i',yes
	beq  $a0,'o',yes
	beq  $a0,'u',yes
	jr $ra
yes:	li $v0,1
	jr $ra


#------------------------------------------------
# vcount - use vowelp to count the vowels in a
# string.
#	a0 - holds string address
#	s0 - holds number of vowels
#	v0 - returns number of vowels
#------------------------------------------------

vcount:	
	sub $sp,$sp,16 	# save registers on stack
	sw $a0,0($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	sw $ra,12($sp)

	li $s0,0	# count of vowels
	move $s1,$a0	# address of string

nextc:	lb $a0,($s1)	# get each character
	beqz $a0,done	# zero marks end
	jal vowelp	# call vowelp 
	add $s0,$s0,$v0	# add 0 or 1 to count
	add $s1,$s1,1	# move along string
	b nextc
done:	move $v0,$s0	# use $v0 for result

	lw $a0,0($sp) 	# restore registers
	lw $s0,4($sp)
	lw $s1,8($sp)
	lw $ra,12($sp)
	add $sp,$sp,16
	jr $ra


#################################################
#					 	#
#     	 	data segment			#
#						#
#################################################


	.data
str:	.asciiz "long time ago in a galaxy far away"
endl:	.asciiz "\n"

##
## end of file vowel.a
