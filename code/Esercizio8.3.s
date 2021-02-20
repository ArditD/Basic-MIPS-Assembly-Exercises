#----------------------------------------------------------

#

# Esercizio 8.3

#



.data



instr:

.asciiz      "Inserisci un numero:"



val:         # dove collocheremo il valore in ingresso

.word        0



eol:

.asciiz      "\n"



outstr:

.asciiz      "Hai inserito:"





.text



main:

                                # stampa primo messaggio

        li   $v0, 4             # codice "print_string"

        la   $a0, instr         # indirizzo della stringa (etichetta)

        syscall                 # operazione di sistema



#------------------------------------------------------------------

# Sezione A

#------------------------------------------------------------------

# 1) scegliere le istruzione corretta tra le seguenti alternative

# 2) spiegare perche' le altre alternative sono errate

#

#       lui  $v0, 5             # A1

#       li   $v0, 5             # A2

#       move $v0, $5            # A3

#       lw   $v0, 5             # A4

#

#------------------------------------------------------------------



        syscall                 # operazione di sistema



#------------------------------------------------------------------

# Sezione B

#------------------------------------------------------------------

# 1) scegliere le istruzione corretta tra le seguenti alternative

# 2) spiegare perche' le altre alternative sono errate

#

#       lw   $v0, val           # B1

#       sw   $a0, val           # B2

#       move $v0, val           # B3

#       sw   $v0, val           # B4

#       move val, $v0           # B5

#

#------------------------------------------------------------------



                                # stampa a capo

        li   $v0, 4             # codice "print_string"

        la   $a0, eol           # indirizzo della stringa (etichetta)

        syscall                 # operazione di sistema



                                # stampa secondo messaggio

        li   $v0, 4             # codice "print_string"

        la   $a0, outstr        # indirizzo della stringa (etichetta)

        syscall                 # operazione di sistema







                                # stampa del valore inserito



#------------------------------------------------------------------

# Sezione C

#------------------------------------------------------------------

# 1) scegliere le istruzione corretta tra le seguenti alternative

# 2) spiegare perche' le altre alternative sono errate

#

#       lw   $v0, 1           # C1

#       sw   1,   $v0         # C2

#       li   $v0, 1           # C3

#       lui  $v0, 1           # C4

#       move $v0, $1          # C5

#

#------------------------------------------------------------------





#------------------------------------------------------------------

# Sezione D

#------------------------------------------------------------------

# 1) scegliere le istruzione corretta tra le seguenti alternative

# 2) spiegare perche' le altre alternative sono errate

#

#       lw   $v0, val         # D1

#       lw   $a0, val         # D2

#       li   $v0, 1           # D3

#       move $v0, $1          # D4

#

#------------------------------------------------------------------



        syscall               # operazione di sistema



        jr   $ra



#----------------------------------------------------------