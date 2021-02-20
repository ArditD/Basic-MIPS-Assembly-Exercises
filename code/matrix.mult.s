##############################
# Geoge P. Burdell
# CmpE 2510 Section GPB
# Program 4 Solution
##############################

.data
my_name:	.asciiz "George P. Burdell\n2510 Section GPB\nProg 4\n\n"
strA:		.asciiz "Matrix A:\n"
strB:		.asciiz "Matrix B:\n"
strC:		.asciiz "\nMatrix C = A*B:\n"
newline:	.asciiz "\n"
space:		.asciiz "  "
ov_error:	.asciiz "\n!Overflow Error!\n"
.align 2

A0:	.word 1, 2, 3, 4
A1:	.word 5, 6, 7, 8
A2:	.word 5, 6, 7, 8
A3:	.word 1, 2, 3, 4

B0:	.word 5, 1, 2, 3
B1:	.word 3, 2, 1, 0
B2:	.word 4, 5, 6, 7
B3:	.word 1, 2, 3, 4

C0:	.space 64

N:	.word 4
.align 2

.globl main
.text

main:
	# Do the stack stuff
	subu $sp, $sp, 64	# allocate new frame
	sw $fp, 60($sp)		# push the frame pointer
	addu $fp, $sp, 64	# update frame pointer

	#display my name, section info
	la $a0, my_name
	li $v0, 4
	syscall

	# Display matrix A
	la $a0, strA
	li $v0, 4
	syscall
	# prepare aurguments for printing procedure
	la $a0 A0	# start of array to print
	la $t0, N
	lw $t0, 0($t0)
	move $a1, $t0	# size of array
	jal print_array	# call printing procedure

	# Display matrix B
	la $a0, strB
	li $v0, 4
	syscall
	#prepare aurguments for printing procedure
	la $a0 B0	# start of array to print
	move $a1, $t0	# size of array
	jal print_array	# call printing procedure

	# Calculate matrix C = A * B
	la $a0, A0	# Start of array A
	la $a1, B0	# Start of array B
	la $a2, C0	# Start of array B
	la $a3, N
	lw $a3, 0($a3)	# size of array
	jal mmult

	# Print the resulting matrix C
	la $a0, strC
	li $v0, 4
	syscall
	#prepare aurguments for printing procedure
	la $a0 C0	# start of array to print
	la $t0, N
	lw $a1, 0($t0)	# size of array
	jal print_array	# call printing procedure

	# Do the stack stuff
	lw $fp, 60($sp)		# pop the frame pointer
	addu $sp, $sp, 64	# pop the frame

	#syscall to end the program
	li $v0, 10
	syscall


########################
# Procedure to display an array to the screen
# $a0 is starting address of the array
# $a1 is N, the size of the NxN array
# Uses $t1 - $t5
print_array:
	# Notice that since this procedure uses no $s registers
	# and never calls any other procedures it doesn't have
	# to do anything with the stack!
	move $t4, $a0	#save the starting address
	move $t1, $0	#init i
pa_outerloop:
	move $t2, $0	#init j
pa_innerloop:
		lw $a0, 0($t4)	# read value from array
		li $v0, 1
		syscall		# print the value

		la $a0, space	# print a blank space
		li $v0, 4
		syscall

		addi $t4, $t4, 4	# move to the next element
		addi $t2, $t2, 1	# increment j
		# check to see if we should continue the inner loop
		slt $t5, $t2, $a1
		bne $t5, $0, pa_innerloop
		###### End inner loop

	#print a newline
	la $a0, newline
	li $v0, 4
	syscall

	addi $t1, $t1, 1	#increment i
	# check to see if we should continue the outer loop
	slt $t5, $t1, $a1
	bne $t5, $0, pa_outerloop
	###### End outer loop

	jr $ra	# return to caller


########################
# Procedure to multiply two matrices
# Uses $s0-$s7

mmult:
	# Do the stack stuff
	subu $sp, $sp, 64	# allocate new frame
	sw $s0, 60($sp)		# push $s0 starting address of B
	sw $s1, 56($sp)		# push $s1 outer loop counter
	sw $s2, 52($sp)		# push $s2 inner loop counter
	sw $s3, 48($sp)		# push $s3 address of row in A
	sw $s4, 44($sp)		# push $s4 address of column in B
	sw $s5, 40($sp)		# push $s5 address of element in C
	sw $s6, 36($sp)		# push $s6 size of matrix N
	sw $s7, 32($sp)		# push $s7 4*N
	sw $fp, 28($sp)		# push the frame pointer
	sw $ra, 24($sp)		# push the return address
	addu $fp, $sp, 64	# update frame pointer

	# Calculate matrix C = A * B
	move $s6, $a3	# s6 = N
	sll $s7, $s6, 2	# s7 = 4 * N
	move $s3, $a0	# init address A
	move $s0, $a1	# init address B
	move $s5, $a2	# init address C
	move $s1, $0	# init i
mmult_outer:
	move $s2, $0	# init j
	move $s4, $s0	# reset B counter to start of B
mmult_inner:
		move $a0, $s3  # $a0 = starting address of the row i
		move $a1, $s4  # $a1 = starting address of the column j
		move $a2, $s6  # $a2 = size of the matrix N
		jal ip		# find Cij
		sw $v0, 0($s5)	# store Cij
		addi $s5, $s5, 4	# move to next element of C
		addi $s4, $s4, 4	# move to next column of B
		addi $s2, $s2, 1	# increment j
		
		# See if we should repeat the inner loop
		slt $t0, $s2, $s6	# if j < N...
		bne $t0, $0, mmult_inner	# repeat inner
		###### End mmult inner loop

	add $s3, $s3, $s7	# move to next row of A
	addi $s1, $s1, 1	# increment i

	# See if we should repeat the outer loop
	slt $t0, $s1, $s6	# if i < N...
	bne $t0, $0, mmult_outer	# repeat outer

	# Do the stack stuff
	lw $s0, 60($sp)		# pop $s0
	lw $s1, 56($sp)		# pop $s1
	lw $s2, 52($sp)		# pop $s2
	lw $s3, 48($sp)		# pop $s3
	lw $s4, 44($sp)		# pop $s4
	lw $s5, 40($sp)		# pop $s5
	lw $s6, 36($sp)		# pop $s6
	lw $s7, 32($sp)		# pop $s7
	lw $fp, 28($sp)		# pop the frame pointer
	lw $ra, 24($sp)		# pop the return address
	addu $sp, $sp, 64	# pop the frame

	jr $ra	# return to caller


########################
# Procedure to multiply two integers
# $a0, $a1 are the multiplicands
# $v0 is the product
nmult:
	# No stack stuff is needed because this procedure
	# doesn't use any memory or $s registers!

	# Multiply the two numbers
	mult $a0, $a1

	# Check the HI register for overflow
	mfhi $v0
	bne $v0, $0, overflow

	# no error, save the product and return to caller
	mflo $v0
	jr $ra	

overflow:
	# print error message
	la $a0, ov_error
	li $v0, 4
	syscall
	
	# halt the program
	li $v0, 10
	syscall


########################
# Procedure to find the inner product of two vectors
# $a0 is the starting address of the row
# $a1 is the starting address of the column
# $a2 is the size of the matrix N
# $v0 is the inner product
ip:
	# Do the stack stuff
	subu $sp, $sp, 64	# allocate new frame
	sw $s0, 60($sp)		# push $s0 row address
	sw $s1, 56($sp)		# push $s1 column address
	sw $s2, 52($sp)		# push $s2 i
	sw $s3, 48($sp)		# push $s3 result
	sw $s5, 40($sp)		# push $s5 N
	sw $s6, 36($sp)		# push $s6 4*N
	sw $fp, 32($sp)		# push the frame pointer
	sw $ra, 28($sp)		# push the return address
	addu $fp, $sp, 64	# update frame pointer

	# Initializations
	move $s5, $a2		# $s5 = N
	sll $s6, $a2, 2		# $s6 = 4*N
	move $s2, $0		# initialize i
	move $s3, $0		# initialize the result
	move $s0, $a0		# init row address
	move $s1, $a1		# init col address
	
ip_loop:
	# load the row and column values
	lw $a0, 0($s0)	# row value
	lw $a1, 0($s1)	# col value
	# mult the two values
	jal nmult	# mult row * column
	add $s3, $s3, $v0	# add product to the result

	addi $s0, $s0, 4	# row addr += 4
	add  $s1, $s1, $s6	# col addr += 4*N
	addi $s2, $s2, 1	# increment i

	# Check to see if we should repeat the loop
	slt $t0, $s2, $s5	# If i < N...
	bne $t0, $0, ip_loop	# repeat 
	##### End ip loop

	move $v0, $s3	# send result to caller

	# Do the stack stuff
	lw $s0, 60($sp)		# pop $s0
	lw $s1, 56($sp)		# pop $s1
	lw $s2, 52($sp)		# pop $s2
	lw $s3, 48($sp)		# pop $s3
	lw $s5, 40($sp)		# pop $s5
	lw $s6, 36($sp)		# pop $s6
	lw $fp, 32($sp)		# pop the frame pointer
	lw $ra, 28($sp)		# pop the return address
	addu $sp, $sp, 64	# pop the frame

	jr $ra	# return to caller



