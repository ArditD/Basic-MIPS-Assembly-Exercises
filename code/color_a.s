#  
#  #include <iostream.h>
#  
#  main() {
#    int c = 3;
#    char *s;
#  
#    switch (c) {
#    case 0: s = "black"; break;
#    case 1: s = "blue"; break;
#    case 2: s = "yellow"; break;
#    case 3: s = "green"; break;
#    case 4: s = "red"; break;
#    case 5: s = "purple"; break;
#    case 6: s = "orange"; break;
#    case 7: s = "white"; break;
#    default: s = "other";
#    }
#  
#    cout << s << endl;
#  }


	.text
	.globl main

main:
	li $s0, 3		# c in $s0
	
	bne $s0, 0, c1		
	la $a0, black
	b cx
c1:	bne $s0, 1, c2
	la $a0, blue
	b cx
c2:	bne $s0, 2, c3
	la $a0, yellow
	b cx
c3:	bne $s0, 3, c4		
	la $a0, green
	b cx
c4:	bne $s0, 4, c5		
	la $a0, red
	b cx
c5:	bne $s0, 5, c6		
	la $a0, purple
	b cx
c6:	bne $s0, 6, c7		
	la $a0, orange
	b cx
c7:	bne $s0, 7, c8
	la $a0, white
	b cx
c8:	la $a0, other

cx:	li $v0, 4
	syscall

	li $v0, 10
	syscall


	.data
black:	.asciiz "black\n"
blue:	.asciiz "blue\n"
yellow:	.asciiz "yellow\n"
green:	.asciiz "green\n"
red:	.asciiz "red\n"
purple:	.asciiz "purple\n"
orange:	.asciiz "orange\n"
white:	.asciiz "white\n"
other:	.asciiz "other\n"
