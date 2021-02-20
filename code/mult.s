#--------------------------------#----------------------------------------------------------#
#      mult ------ shumezim	 # mult perdoret per shumezime me numra komplement te 2-shit#
#--------------------------------#----------------------------------------------------------#
.globl main
.text
main:
ori $8, $0, 2      # $8 merr vleren 2
ori $9, $0, 2      # $9 merr vleren 2
mult $8, $9        # Shumezo $8 me $9

#-------------------------------------------------------------------------------------#
#Ku shkoi perfundimi :'( ?
#Normalisht qe te behet nje shumezim midis 2 numrave nuk mjafton nje regjister
#me 32 bit ne dispozicion keshtu qe kemi 2 regjistra me nga 32 bit (gjithsej 64 bit) 
#ne dispozicion per te kryer shumezimin midis 2 
# PC      = 00400030   EPC     = 00000000   Cause   = 00000000   BadVAddr= 00000000
# Status  = 3000ff10   HI      = 00000000   LO      = 00000004
#Quhen HI dhe LO ose HIGH dhe LOW, tek LOW shkojn vlerat e vogla, kurse kur i kalon
#32 bitet pjesa tjeter kalon tek HI dhe po ta shohim LO = 4 dhe 2x2 = 4.
#-------------------------------------------------------------------------------------#
