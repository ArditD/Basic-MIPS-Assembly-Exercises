# UNTITLED PROGRAM

	.data		# Data declaration section

fp1:	.float 	0.0
fp2:	.float	0.0

pt1:	.asciiz	"Enter a Float: "
pt2:	.asciiz	"The number as a float is "
pt3:	.asciiz	"The number as a int is "
pt4:	.asciiz	"The number converted to an int is "
pt5:	.asciiz	"The number in hex is "

hexdigits:	.asciiz 	"0123456789abcdef" 
hexword: 	.asciiz 	"00000000" 

newline:	.asciiz	"\n"

	.text

main:			# Start of code section
	
	
	li $v0, 4			# system call code for printing string = 4
	la $a0, pt1		# load address of string to be printed into $a0
	syscall			# call operating system to perform print operation
	

	li $v0, 6		# get ready to read in float
	syscall		# system waits for input
	s.s $f0, fp1		# store the result of the read (returned in $f0) in num1

	mfc1		$t0, $f0
# test comment

      #mtc1	$f2, $t0
	#cvt.w.s	$t1, $f0

	li $v0, 4			# system call code for printing string = 4
	la $a0, pt2		# load address of string to be printed into $a0
	syscall			# call operating system to perform print operation
	
	l.s	$f12, fp1
	li $v0, 2		# system call code for printing float = 2
	syscall		# print float stored in $f12


	li $v0, 4			# system call code for printing string = 4
	la $a0, newline	# load address of string to be printed into $a0
	syscall			# call operating system to perform print operation
		
	li $v0, 4			# system call code for printing string = 4
	la $a0, pt3		# load address of string to be printed into $a0
	syscall			# call operating system to perform print operation
	
	li $v0, 1        # system call code for print_int
	move $a0, $t0        # integer to print
	syscall          # print it
	
	li $v0, 4			# system call code for printing string = 4
	la $a0, newline	# load address of string to be printed into $a0
	syscall			# call operating system to perform print operation

	# initialize values for the inner loop
	move	$t2, $t0
	la	$t6, hexdigits	
	la	$t7, hexword		
	li	$t3, 15			# the mask value
	sll	$t3, $t3, 28
	li 	$t4, 28			# loop3i counter and shift amount

	# mask off the correct 4 bits for a hex digit 
	# and shift for bit positions 0-3
loop3i:	and	$t5, $t2, $t3
	srl	$t5, $t5, $t4

	# get proper hex digit
	add	$t5, $t5, $t6
	lb	$t8, ($t5)
	sb	$t8, ($t7)

	# process loop values and branch
	srl	$t3, $t3, 4
	addi	$t7, $t7, 1
	addi	$t4, $t4, -4
	bgez	$t4, loop3i

	# output the hex word
	li 	$v0, 4
        la	$a0, pt5
	syscall

        li      $v0, 4
        la  	$a0, hexword
	syscall

        li 	$v0, 4
        la	$a0, newline
	syscall

		
	li $v0, 10		# exits program
	syscall
		

# END OF PROGRAM