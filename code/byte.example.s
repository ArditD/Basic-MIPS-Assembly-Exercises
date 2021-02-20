	.data
value: 	.word 0x12345678
	.text
	.globl main
main:	la $s3, value 	# place address in $s3
	lw $t0, 0($s3)
	lb $t1, 0($s3) 	#these instructions load
	lb $t2, 1($s3) 	#the byte at that address
	lb $t3, 2($s3) 	#rather than the word
	lb $t4, 3($s3)
	
	li $v0, 10	# terminate program
	syscall