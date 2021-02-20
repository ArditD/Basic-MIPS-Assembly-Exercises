#----------------------------------------------------------

#

# Esercizio 9.3

#



.data



instr:

.asciiz      "Inserisci un numero (9999 per finire): "



eol:

.asciiz      "\n"



str_parz:

.asciiz      "La somma parziale e': "



str_tot:

.asciiz      "La somma totale e': "



#-----------------------------------------

# Sezione A

#-----------------------------------------

#

# Messaggio per numero di valori inseriti

#



# < etichetta per il messaggio >

# < dichiarazione stringa messaggio >



#

#-----------------------------------------



.text



main:



#-----------------------------------------

# Sezione B

#-----------------------------------------

#

# Inserire al posto dei puntini le istruzioni opportune

# per realizzare i contatori del numero di elementi inseriti

# e il limite massimo di valori inseribili utilizzando 

# rispettivamente i registri $s1 ed $s2

# 

#

#       ............            # inizializza contatore valori inseriti sinora (0)

#       ............            # inizializza numero massimo valori (10)

#

#-----------------------------------------



        li   $s0, 0             # inizializza somma parziale (0)

        li   $t3, 9999          # inizializza valore di fine sequenza (9999)



ciclo:



#-----------------------------------------

# Sezione C

#-----------------------------------------

#

# Inserire al posto dei puntini una istruzione che verifica se il numero di

# valori inseriti e' pari al massimo previsto, ed in tal caso salta alla fine.

#

#

        .................       # limite massimo raggiunto, fine

#

#-----------------------------------------



        li   $v0, 4             # codice "print_string"

        la   $a0, instr         # indirizzo della stringa (etichetta)

        syscall                 # operazione di sistema



                                # lettura del valore

        li   $v0, 5             # codice di "read_int"

        syscall                 # operazione di sistema



	beq      $v0, $t3, fine # se (val = 9999) allora fine



	add      $s0, $s0, $v0  # accumula valore in somma parziale



#-----------------------------------------

# Sezione D

#-----------------------------------------

#

# Inserire una istruzione che incrementa il numero degli elementi inseriti

#

        ....................    # incrementa numero valori inseriti

#

#-----------------------------------------





        li       $v0, 4         # "Somma parziale: "

        la       $a0, str_parz  # indirizzo della stringa (etichetta)

        syscall                 # operazione di sistema



        li       $v0, 1         # codice di "print_int"

        move     $a0, $s0       # valore somma parziale

        syscall                 # operazione di sistema



                                # stampa a capo

        li   $v0, 4             # codice "print_string"

        la   $a0, eol           # indirizzo della stringa (etichetta)

        syscall                 # operazione di sistema



        b        ciclo          # ripeti



fine:



#-----------------------------------------

# Sezione E

#-----------------------------------------

#

# Inserire al posto dei puntini i frammenti necessari perche'

# il programma stampi il numero dei valori inseriti

#



                                # "Numero valori inseriti: "

        li       $v0, 4         # codice "print_string"

        la       $a0, .......   # indirizzo della stringa (etichetta)

        syscall                 # operazione di sistema



        ...................     # codice di "print_int"

        ...................     # numero di valori inseriti

        syscall                 # operazione di sistema



                                # stampa a capo

        li   $v0, 4             # codice "print_string"

        la   $a0, eol           # indirizzo della stringa (etichetta)

        syscall                 # operazione di sistema

#

#

#-----------------------------------------



                                # stampa "Somma totale: "

        li       $v0, 4         # codice "print_string"

        la       $a0, str_tot   # indirizzo della stringa (etichetta)

        syscall                 # operazione di sistema



        li       $v0, 1         # codice di "print_int"

        move     $a0, $s0       # valore somma totale

        syscall                 # operazione di sistema



                                # stampa a capo

        li   $v0, 4             # codice "print_string"

        la   $a0, eol           # indirizzo della stringa (etichetta)

        syscall                 # operazione di sistema





#---------------------------------------------------------

