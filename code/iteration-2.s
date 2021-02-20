# an example of iteration where the sum of every other word
# in an array is computed

	.data
start: .word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0
	.word 1,0,1,0,1,0,1, 0

.text
.globl main

main: la $t0, start		#load start address of array
	add $t1, $t0,256		# address of end of array of 64 words
	add $t2, $zero, $zero	#initialize sum
loop: lw $t3, 0($t0)		#fetch array element
	add $t2, $t2, $t3		# update sum
	addi $t0, $t0, 8		# point to next address
	bne $t1, $t0, loop	# if not done, start next iteration

	li $v0, 10
	syscall
