##################################
#albanianwizard.org              #
#Licence GPLv3                   #
#arditi - arditi{at}hush{pik}ai  #
######################################################################################################################
#Asemblo instruksionin ori $8, $9, 0x0019 duke mbledhur 1 nga 1 pjeset e tij [opcode],[rt],[rs],[imm]		     #
#dhe duke e depozituar instruksionin ne menyre te rregullt duke respektuar formatin ne nje regjister ç'faredo.       #
#########################################################################################################################################################
#Te assemblojm ORI-n                               													#
#Formatin mund ta gjeni tek:																#
#http://albanianwizard.org/informatika_shqiptare/arkitekture_kompiuterike/gjuha_e_programimit_assembly/formati-i-instruksioneve-ne-arkitekturen-mips/   #
#Ne kete ushtrim do te shohim se si duke mbledhur copeza kodi mund te arrijm tek instruksioni i deshiruar.						#
#Ne rastin tone eshte: ori  $8,$9,0x0019														#
#########################################################################################################################################################
.text
.globl  main
######################################################################################
#                            INTRO						     #
#ori $8, $9, 0x0019 eshte i barabart me instruksionin 0x35280019		     #
#ori ka opcode 1101 == 13 ne dec ose D ne hex					     #
#Shohim qe ka 1 operand dhe 1 regjister destinacioni dhe 1 vlere te menjehershme     #
#Operandi [rs]= $9 / 0x9							     #
#Destinacioni [rt]= $8 / 0x8							     #
#Vlera e menjehershme [Imm] = 0x0019	                                             #	
#Zgjedhim $24 si regjister per te asembluar instruksionin			     #
######################################################################################
main:
ori   $11,$0,0xD                 	# opcode /kodi i instruksionit ori (0xD)/13/1101   ===>$11
ori   $12,$0,0x9       			# operandi $9 / [rs]                               ===>$12
ori   $13,$0,0x8       			# destinacioni $8 /[rt]                            ===>$13
ori   $14,$0,0x0019   		        # [Imm] = 0x0019                                   ===>$14

########################
#   Rregullojm Bitet   #
########################

sll   $11,$11,26       			# spostojm [opcode] ne pozicionin e vet pasi tani eshte 0000 0000 0000 0000 0000 0000 0000 1101
					# dhe duhet te jete (si opcode) ne pozicionin e vet:    0011 0100 0000 0000 0000 0000 0000 0000

sll   $12,$12,21                        # spostojm [rs] ne pozicionin e vet duke e levizur majtas 21 njesi dhe kemi:
                                        # 0000 0000 0000 0000 0000 0000 0000 1001    mbasi e spostojm 21 njesi majtas kemi
                                        # 0000 0001 0010 0000 0000 0000 0000 0000    [kjo eshte pamja e regjistrit mbas egzekutimit te sll $12, $12, 21

sll   $13,$13,16       			# spostojm [rt] (destinacionin) ne vendin e vet pasi tani eshte : 
                                        # 0000 0000 0000 0000 0000 0000 0000 1000 dhe duhet te jete :
                                        # 0000 0000 0000 1000 0000 0000 0000 0000 [kete e ben instruksioni ;) ]


##################################################
#Fillojm spostojm bitet ne regjistrin e deshiruar#
##################################################

or    $24,$24,$11     			# Bejme OR [opcode] (R11) tek regjistri $24 i cili do te marri pamjen:
                                        # 0011 0100 0000 0000 0000 0000 0000 0000

or    $24,$24,$12      			# Bejme OR [RS] qe e kemi "qendisur" tek regjistri 12 me $24 i cili tani duke u shtuar dhe [rs] do marri pamjen
                                        # 0011 0101 0010 0000 0000 0000 0000 0000
 
or    $24,$24,$13      			# Kalojm me OR $13 [rt] (destinacionin) tek regjistri yne $24 qe tani do te mari pamje akoma me te kompletuar :
					# 0011 0101 0010 1000 (0000 0000 0000 0000) == IMM :D

######################################################
#Na ngelen vetem 16 bitet e vleres se menjehershme :D#
######################################################
or    $24,$24,$14      			# Se fundmi fusim dhe vleren tone 0x0019 qe ne sistemin binar paraqitet me : 0000 0000 0001 1001
                                        # Dhe pamja perfundimtare e regjistrit do jete:
                                        # 0011 0101 0010 1000 0000 0000 0001 1001


ori $2, $0, 10                          # Po vdis re Vdis :P
syscall 				# Mbyllja e programit                                                 

################################################################
#                         PERFUNDIM                            #
#######################################################################################
#ori  $8,$9,0x0019  <===>  0x35280019  <===>  0011 0101 0010 1000 0000 0000 0001 1001 #
#######################################################################################