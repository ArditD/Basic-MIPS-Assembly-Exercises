##################################
.data
a: .word 0x12345678
.text
main:
lw $s0, a           #$s0 merr vleren a qe eshte .word (0x12345678)
#----------------------------------------------------------------------------#
#Rasti i mesiperm eshte nje rast i pergjithshem porse rastet me te zakonshme
#jane lw (load from memory) dhe kjo do te thote shko tek memorja (x adres)
#kopjo prej saj dhe ate qe more depozitoje tek nje regjister.
#----------------------------------------------------------------------------#
#Si fillim na duhet nje base register (regjistri baze qe sherben si pointer / tregues per tek nje adres memorjeje)
#Per ta ber kete perdorim instruksionin lui
#Perpara le te ecim ca ne memorje dhe te bejm pis pak disa regjistra ;)
					#Adresa ne memorje 
ori $8, $0, 5  				#0x0040002c                         
ori $9, $0, 6				#0x00400030
ori $10, $0, 7				#0x00400034
ori $11, $0, 8				#0x00400038

#Tani perdorim lui per te caktuar nje regjister si pointer (tregues) pra si adresen baze nga mund te behet selektimi ne memorje
lui $8, 0x40                               #Tani kemi nje pointer :)
lw  $12,   48($8)                          #Kariko 32 bit nga adresa e memorjes $8 + 4 (offset) tek regjistri $s1
sw  $10,   48($8)                          #Permbajtjen e regjistrit $10 dmth 7 çoje tek adresa 0x00400000 + 48
ori $2, $0, 10
syscall
