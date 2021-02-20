###################################
#addiu - "ai qe nuk njeh overflow"#
###################################

.globl main
.text
main:
ori $8, 0xA                #Karikojm vleren 10 tek $8
addiu $9, $8, -19          #Vleres se regjistrit $8 i shtojm -19
                           #Rezultatin e depozitojm tek $9

#------------------------------------------------------------------#
#U perdor addiu sepse edhe neqoftese ka overflow ne mbledhjen midis#
#0xA dhe -19 apo -0x13 ai do te injorohoet.			   #
#Kjo eshte aryeja pse u quajt "ai qe nuk njeh overflow, gjithashtu #
#si instruksion mund te mbledhi dhe nje vler [imm] me 16 bit       #
#sign extended (pra 16 bitet mbushen me 1-sha (: )                 #
#------------------------------------------------------------------#
