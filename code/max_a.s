#  #include <iostream.h>
#  
#  main() {
#    int a[] = {36, 20, 27, 15, 1, 62, 41};
#    int n = 7;
#    int max, i;
#  
#    for (max = i = 0; i<n; i++)
#      if (a[i] > max)
#        max = a[i];
#  
#    cout << max << endl;
#  }


	.text
	.globl __start

__start:
	li $t0, 0		# i in $t0
	li $s0, 0		# max in $s0
	lw $s1, n		# n in $s1

m1:	bge $t0, $s1, m3
	mul $t1, $t0, 4		# scale i
	lw $t2, a($t1)		# load a[i] into $t2
	ble $t2, $s0, m2	# skip "then part" if a[i] <= max
	move $s0, $t2		# "then part": max = a[i]
m2:	addi $t0, $t0, 1	# i++
	b m1
m3:	move $a0, $s0		# end of loop
	li $v0, 1
	syscall
	li $v0, 10
	syscall

	.data
a:	.word 36, 20, 27, 15, 1, 62, 41
n:	.word 7
max:	.word 0