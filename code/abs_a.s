#  #include <iostream.h>
#  
#  main() {
#    int a[] = {-36, 20, -27, 15, 1, -62, -41};
#    int n = 7;
#    int i;
#    int npos, nneg;
#  
#    for (i = npos = nneg = 0; i<n; i++)
#      if (a[i] > 0)
#        npos++;
#      else
#        nneg++;
#  
#    cout << "+: " << npos << "; -: " << nneg << endl;
#  }


	.text
	.globl main

main:
	li $t0, 0		# i in $t0
	li $t1, 0		# npos in $t1
	li $t2, 0		# nneg in $t2
	lw $s1, n		# n in $s1

m1:	bge $t0, $s1, m4
	mul $t3, $t0, 4		# scale i
	lw $t4, a($t3)		# load a[i] into $t4
	bgez $t4, m2		# if (a[i] > max)...
	addi $t2, $t2, 1	# "else part": increment nneg
	b m3			# skip over the "then part"
m2:	addi $t1, $t1, 1	# "then part": increment npos
m3:	addi $t0, $t0, 1	# i++
	b m1

m4:	move $a0, $t1		# print npos
	li $v0, 1
	syscall
	la $a0, endl
	li $v0, 4
	syscall
	move $a0, $t2		# print nneg
	li $v0, 1
	syscall
	li $v0, 10
	syscall

	.data
a:	.word -36, 20, -27, 15, 1, -62, -41
n:	.word 7
max:	.word 0
endl:	.asciiz "\n"