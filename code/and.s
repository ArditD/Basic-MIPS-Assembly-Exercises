main:
ori $8, 4             #kariko vleren 4 tek $8 (asembleri do e perkthej si ori $8, $8, 4
ori $9, 5             #kariko vleren 5 tek $9
and $10, $8, $9       #$9 dhe $8 rezultati shkon tek $10


########################################################################
# [$8 ose $t0] = 0000 0000 0000 0100                                   #
# [$9 ose $t1] = 0000 0000 0000 0101                                   #
#[$10 ose $t2] = -------------------   kryejm operacionin logjik AND   #
#                0000 0000 0000 0100                                   #
#$t2 i bie perfundimisht qe te kete vleren 4 mbas and                  #
########################################################################
