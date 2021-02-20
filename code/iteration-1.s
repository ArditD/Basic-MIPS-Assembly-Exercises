# example of iteration to compute the sum
# and count of the number of words in an array	

	.data
first:.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1,
last:	.word 0			#last points to last element of the array

.text
.globl main

main: la $t0, first		#load start address of array
	la $t1, last		#load end address of the array
	addi $t1, $t1, 4		#point to first word after the array
	li $t2, 0			#initialize count using immediate
	add $t3, $zero, $zero	#initialize sum using another approach
loop: lw $t4, 0($t0)		#fetch array element
	add $t3, $t3, $t4		#update sum
	addi $t0, $t0, 4		#point to next word
	addi $t2, $t2, 1		#increment count
	bne $t1, $t0, loop	#if not done, start next iteration

	li $v0, 10
	syscall
