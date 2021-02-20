			#
#-------------------------------#----------------------------------------------#
				#
                                # This sample code illustrates the steps
                                # required to read items from the global data
				# portion of the code and perform basic I/O
				# to the console.
                                #
                                # This code may be used as a framework for
                                # your own programs. You may replace any of the
				# existing instructions and/or data with your own.
				#
#-------------------------------#----------------------------------------------#

				# This is the data segment

		.data		
string0:	.asciiz 	"This is a text string\n"
item0:		.word		99
array0:		.word		11 22 33 44 55 66 77 88 99

#-------------------------------#----------------------------------------------#

				# This is the the code ("text") segment
		.text		

# Note that the label __start designates where program execution begins, 
# i.e. to run this program, the SPIM simulator jumps to __start.  Note
# also there are two underscore characters at the beginning of the name!

             	.globl __start	
__start:			

# EXAMPLE I:  Print a string on the console.  The method is to load the
# address of the string into $a0 and then use a syscall to print the string.

	la $a0, string0		# Load the base address of the string into $a0
	li $v0, 4		# Set $v0 to 4, this tells syscall to print the
				# text string specified by $a0
	syscall			# Now print the text string to the console

# EXAMPLE II: Load an integer from the data segment and print it.

	lw $a0, item0		# Load the value of item0 into $a0
	li $v0, 1		# Set $v0 to 1, this tells syscall to print the
				# integer specified by $a0	
	syscall			# Now print the integer

# EXAMPLE III: Read an integer from the console.

	li $v0, 5		# Set $v0 to 5, this tells syscall to read an
				# integer from the console
	syscall			# Now read the integer.
				#
				# The integer is now in $v0, and we can use
				# it as we see fit.

# EXAMPLE IV: Print an element from an integer array in the data segment.

        li  $t0, 3		# Set t0 to 3, this is the index of the
				# element we are fetching from the array
        li  $t1, 4		# Set t1 to 4, this is the size in bytes of an 
				# element (this is an integer array)
        mul $t2, $t1, $t0	# t2 = t1 * t0, so t2 is the BYTE offset of the 
  				# element we are fetching from the array.
	lw  $a0, array0($t2)	# Load the element of the array; note that
				# the first element in the array has an offset 
				# of zero
	li  $v0, 1		# Set $v0 to 1, this tells syscall to print the
				# integer specified by $a0
	syscall			# Now print the integer

# EXAMPLE V:  Halt the program.

	li $v0, 10		# set $v0 to 10, this tells syscall to end 
				# execution of this program
	syscall
