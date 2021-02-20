##
## hanoi.a - recursive implementation of the
##	     towers of hanoi
##
##

#################################################
#					 	#
#		text segment			#
#						#
#################################################

	.text
	.globl __start
__start:

  	la $a0,tower1	# source
  	la $a1,tower2	# destination
      	la $a2,tower3	# temporary
	lw $a3,numRings

	jal moveStack 	# call procedure

  	jal PrintTowers # Print answer

	li $v0,10
	syscall		# au revoir...


#------------------------------------------------
# moveStack - recursive implementation of the
# towers of hanoi
#	a0 - source tower
#	a1 - destination tower
#	a2 - spare tower
#	a3 - number of rings
#	s0 - source tower
#	s1 - destination tower
#	s2 - spare tower
#------------------------------------------------
moveStack:
	sub $sp,$sp,32 	# save registers on stack
	sw $a0,0($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
        sw $a3,12($sp)
        sw $s0,16($sp)
        sw $s1,20($sp)
        sw $s2,24($sp)
        sw $ra,28($sp)

	beq $a3,1,moveOne
			# Move one ring only

	move $s0,$a0	# keep copy of source tower
	move $s1,$a1	# keep copy of destination
	move $s2,$a2	# keep copy of spare tower

	move $a0,$s0	# step 1:
	move $a1,$s2	# destination = spare tower
	move $a2,$s1
	sub $a3,$a3,1	# move n-1 rings
	jal moveStack
	
	move $a0,$s0	# step 2:
	move $a1,$s1
	jal moveRing	# move a ring to destination

	move $a0,$s2	# step 3:
	move $a1,$s1
	move $a2,$s0	# source = spare
	jal moveStack

	j end
moveOne:
	jal moveRing	# Move one ring only

end:	lw $a0,0($sp) 	# restore registers
	lw $a1,4($sp)
	lw $a2,8($sp)
        lw $a3,12($sp)
        lw $s0,16($sp)
        lw $s1,20($sp)
        lw $s2,24($sp)
        lw $ra,28($sp)
	add $sp,$sp,32
	jr $ra

#------------------------------------------------
# moveRing - move one ring from source to dest
#	a0 - source
#	a1 - dest
#	t0 - holds the value removed
#------------------------------------------------
moveRing:
	sub $sp,$sp,12 	# save registers on stack
	sw $a0,0($sp)
	sw $a1,4($sp)
	sw $ra,8($sp)

  	jal PrintTowers	# print out state of towers

finds:	sub $a0,$a0,4	# get the top ring
	lw $t0,($a0)
	beqz $t0,founds
	j finds		# find source
founds:	add $a0,$a0,4

	lw $t0,($a0)	# t0 holds the value removed
	sw $0,($a0)	# set place to zero
	
findd:	sub $a1,$a1,4	# find destination
	lw $t1,($a1)
	beqz $t1,foundd
	j findd
foundd:	sw $t0,($a1)	# destination found

	lw $a0,0($sp) 	# restore registers
	lw $a1,4($sp)
	lw $ra,8($sp)
	add $sp,$sp,12

	jr $ra

#------------------------------------------------
# PrintTowers - print out state of towers
#	s0 - number of rings
#	s1 - tower1
#	s2 - tower2
#	s3 - tower3
#------------------------------------------------
PrintTowers:	
	sub $sp,$sp,28 	# save registers on stack
	sw $v0,0($sp)
	sw $a0,4($sp)
	sw $s0,8($sp)
        sw $s1,12($sp)
        sw $s2,16($sp)
        sw $s3,20($sp)
        sw $ra,24($sp)

  	la $s1,tower1	# set up the registers
  	la $s2,tower2	# from the data segment
  	la $s3,tower3
        lw $s0,numRings

	mul $s0,$s0,4	# each word four bytes
	sub $s1,$s1,$s0 # get stacks ready
	sub $s2,$s2,$s0
	sub $s3,$s3,$s0

Loop:	beqz $s0,exit  	# if at level -n done
	la $a0,Blanks
	li $v0,4	# system call to print
	syscall		# out a string
  
	lw $a0,($s1)	# read number on stack 1
	jal printOne	# print blank or ring
	lw $a0,($s2)	# read number on stack 2
	jal printOne	# print blank or ring
	lw $a0,($s3)	# read number on stack 3
	jal printOne	# print blank or ring

	la $a0,endl	# end line
	li $v0,4	# system call to print
	syscall		# out a string

	sub $s0,$s0,4	# move up to next level
	add $s1,$s1,4
	add $s2,$s2,4
	add $s3,$s3,4
	j Loop		# repeat until $s0=0

exit:	la $a0,Base	# print Tower names and lines
	li $v0,4	# system call to print
	syscall		# out a string

	lw $v0,0($sp) 	# restore registers
	lw $a0,4($sp)
	lw $s0,8($sp)
        lw $s1,12($sp)
        lw $s2,16($sp)
        lw $s3,20($sp)
        lw $ra,24($sp)
	add $sp,$sp,28
	jr $ra


#------------------------------------------------
# printOne - print blank or ring number
#	a0 - holds ring number or 0
#	v0 - parameter for system call
#------------------------------------------------

printOne:
	sub $sp,$sp,12 	# save registers on stack
	sw $a0,0($sp)
	sw $v0,4($sp)
	sw $ra,8($sp)

	bnez $a0,ring	# if not zero then print it
	la $a0,Blank
	li $v0,4	# system call to print
	syscall		# out a string

	j spaces
ring:	li $v0,1	# print number
	syscall

spaces:	la $a0,Blanks	# space output out
	li $v0,4	# system call to print
	syscall		# out a string
		  
	lw $a0,0($sp) 	# restore registers
	lw $v0,4($sp)
	lw $ra,8($sp)
	add $sp,$sp,12
	jr $ra

#################################################
#					 	#
#     	 	data segment			#
#						#
#################################################

	.data
Blanks:	.asciiz	"       "
Blank:	.asciiz	" "
endl:	.asciiz	"\n"
Base:	.ascii	"     ____    ____    ____\n"
	.asciiz	"      T1      T2      T3\n\n\n"


	.align 2
notused:
	.word 0,0,0,0,0,0,0,1,2,3
tower1: .word 0,0,0,0,0,0,0,0,0,0
tower2: .word 0,0,0,0,0,0,0,0,0,0
tower3: .word 0
numRings:
	.word 3

##
## end of file hanoi.a
