#----------------------------------------------------------

#

# Esercizio 9.4

#

#



.data



instr:

.asciiz      "Inserisci un numero (9999 per finire): "



eol:

.asciiz      "\n"



str_min:

.asciiz      "Il valore piu' piccolo inserito finora e': "



str_max:

.asciiz      "Il valore piu' grande inserito finora e': "





#----------------------------------------------------

# Uso dei registri:

#

# $t3 = valore speciale di uscita

# $s0 = il minimo corrente

# $s1 = il massimo corrente

#



.text



main:



        li   $t3, 9999          # valore di fine sequenza





#--------------------------------------------------------------

# Sezione A

#--------------------------------------------------------------

# Quali valori vanno caricati nei registri $s0 ed $s1 perche' il programma 

# funzioni ? 

#

# Si spieghi la scelta, osservando il tipo delle istruzioni utilizzate 

# nella sezione C per il confronto dei valori inseriti.

#

#       li   $s0, 0xFFFFFFFF    # A1:

#       li   $s0, 0x0           # A2:

#       li   $s0, 0x80000000    # A3:

#       li   $s0, 0x7FFFFFFF    # A4:

#       li   $s0, -0x80000000   # A5:

#       li   $s0, 0x99999999    # A6:

#       li   $s0, 99999999      # A7:

#

#------------------------------------

# Sezione B

#------------------------------------

#

#       li   $s1, 0xFFFFFFFF    # B1:

#       li   $s1, 0x0           # B2:

#       li   $s1, 0x80000000    # B3:

#       li   $s1, 0x7FFFFFFF    # B4:

#       li   $s1, -0x7FFFFFFF   # B5:

#       li   $s1, -0x80000000   # B6:

#       li   $s1, -0x99999999   # B7:

#       li   $s1, -99999999     # B8:

#

#-------------------------------------------------------------





ciclo:



        li   $v0, 4             # codice "print_string"

        la   $a0, instr         # indirizzo della stringa (etichetta)

        syscall                 # operazione di sistema



                                # lettura del valore

        li   $v0, 5             # codice di "read_int"

        syscall                 # operazione di sistema



#--------------------------------------------------------------

# Sezione C

#----------------------------------------------------------------------

#

# Si commentino le seguenti righe di programma e si cambi il nome

# delle etichette lab1 e lab2 in modo che riflettano chiaramente

# la loro funzione, scegliendo tra queste quattro alternative:

#

# C1: (lab1, lab2) --> (non_minimo, non_massimo)

# C2: (lab1, lab2) --> (minimo, massimo)

# C3: (lab1, lab2) --> (non_massimo, non_minimo)

# C4: (lab1, lab2) --> (massimo, minimo)

#



      beq      $v0, $t3, fine   #

	ble      $v0, $s1, lab1   #

	move     $s1, $v0         #

lab1:	

	bgt     $v0, $s0,  lab2   #



	move     $s0, $v0         #

lab2:



#

#

# ------------------- stampa valore minimo -----------------------



        li       $v0, 4         # codice "print_string"

        la       $a0, str_min   # indirizzo della stringa (etichetta)

        syscall                 # operazione di sistema



        li       $v0, 1         # codice di "print_int"

        move     $a0, $s0       # valore minimo

        syscall                 # operazione di sistema



                                # stampa a capo

        li   $v0, 4             # codice "print_string"

        la   $a0, eol           # indirizzo della stringa (etichetta)

        syscall                 # operazione di sistema



# ------------------- stampa valore massimo -------------------------



        li       $v0, 4         # codice "print_string"

        la       $a0, str_max # indirizzo della stringa (etichetta)

        syscall                 # operazione di sistema



        li       $v0, 1         # codice di "print_int"

        move     $a0, $s1       # valore massimo

        syscall                 # operazione di sistema



                                # stampa a capo

        li   $v0, 4             # codice "print_string"

        la   $a0, eol           # indirizzo della stringa (etichetta)

        syscall                 # operazione di sistema



# --------------------------------------------------------------------



        sub      $t2, $t2, 1    # decrementa contatore valori

        b        ciclo          # ripeti



fine:

	jr	$ra



#---------------------------------------------------------

