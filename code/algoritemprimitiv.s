##################################################################
#                     Algoritem Primitiv                         #
##################################################################
# a = b + c + d - e
# Ky eshte pseudokod ne C, te cilin do e zberthejm ne assembly
# Operandet shpetohen ne regjistrat $s, kurse vlerat ne regjistrat
# temporan ;) [e marrim si pune rregulli]
# dhe i japim vlerat a = $s0, b = $s1 (4), c = $s2 (5)
# d = $s3 (8) , e = $s4 (19)
# Pra operandet i percaktuam, dhe na takon te ndajm ne 2 pjese pseudokodin
#################################################################################
main:
#li per te ngarkuar vlerat ne regjistra:
li $s1, 4
li $s2, 5
li $s3, 8
li $s4, 19
# E ndajm algoritmin ne dy pjese dhe si fillim mbledhim b + c
add $t0, $s1, $s2
# Shumen e mbledhim me $s3-shin dmth d-n
add $t0, $t0, $s3     #$t0 ne kete rast ka b + c dhe i shtojm $s3 (d)
sub $s0, $t0, $s4     #$t0 qe tashme permban b,c,d i zbresim e-n dhe vleren e depozitojm tek a-ja ($s0)
#fund#
