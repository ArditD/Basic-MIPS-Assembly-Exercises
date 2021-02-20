##################################
#   Kariko -19 ne nje regjister  #
###################################################################
#  ori $8, $0, -19 ? | Jo sepse vlera immediate eshte 16 bit      # 
# e zgjatur me 0 dhe nje numri negativ vleren e tij te pare e ka 1# 
#keshtu qe nuk lejohet ky lloj operacioni atehere si i behet?     #
###################################################################

.globl main
.text
main:
ori $8, $0, 19        #fusim vleren +19 tek regjistri $8 
nor $9, $8, $0        #duke bere nor me $0 tek $9 do te jete e kunderta e $8  
addu $9, $9, 1        #Vleres qe ndodhet tek $9 i shtojm 1 dhe perfundimin e depozitojm perseri tek $9


#-------------------------------------------------------------------------------------------
#ç'fare beme?
#19 ne fillim e kthyem ne komplement te 1-shit, pastaj ne te 2-shit duke i shtuar 1
#Ne perfundim tek $9 do te jete -19 komplement i dyshit.
#-------------------------------------------------------------------------------------------
##
##
##PS SHIKO NE FAQE INSTRUKSIONIN ADDIU SEPSE MUND TE BEJ MBLEDHJE DIREKTE ME NUMRA NEGATIV!!!!
##
