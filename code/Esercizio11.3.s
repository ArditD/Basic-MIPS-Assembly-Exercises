#--------------------------------------------

# Esercizio 11.3

#



.data



vett:

.word    12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0



in_msg:

.asciiz  "Inserisci l'indice dell'elemento che vuoi estrarre\n"



out_msg:

.asciiz  "Elemento estratto: "



.text



main:



     sub    $sp,$sp,8

     sw     $ra,0($sp)



     li      $v0,4            # stampa del messaggio per input

     la      $a0,in_msg       #

     syscall                  #



     li      $v0,5            # read_int

     syscall                  #



#----------------------------------------------------------------

# Sezione A

#----------------------------------------------------------------

# 1) inserire al posto dei puntini la SEQUENZA di istruzioni necessarie

#      per impostare correttamente il passaggio dei parametri

#

#    ................         # impostazione parametri

#

#----------------------------------------------------------------



     jal     EstraiElemento   # chiamata della procedura 'EstraiElemento'



#----------------------------------------------------------------

# Sezione B

#----------------------------------------------------------------

# 1) e' corretta la seguente istruzione al fine di stampare il

#      valore restituito dalla procedura?

#

#    la      $s1, $v1

#

# 2) se no, perch»?

#

# 3) Qual » l'istruzione corretta?

#

#----------------------------------------------------------------





     li      $v0,4            # stampa messaggio di output

     la      $a0,out_msg      #

     syscall                  #



     li      $v0,1            # stampa dell'elemento estratto

     move    $a0,$s1          #

     syscall                  #



     lw     $ra,0($sp)

     add    $sp,$sp,8



     jr      $ra



     EstraiElemento:

     mul     $t0, $a1, 4     # calcolo spiazzamento

     add     $t0, $t0, $a0   # calcolo indice assoluto

     lw      $t1, 0($t0)     # caricamento elemento



     move    $v0, $t1        # metto il valore di ritorno in $v0



     jr      $ra             # ritorno al chiamante



#--------------------------------------------

