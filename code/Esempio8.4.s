#----------------------------------------------------------

#

# Esempio 8.4

#



.data



inmsg:

.asciiz      "Inserisci una stringa:"



instring:    # dove collocheremo la stringa in ingresso

             # NB: 8 caratteri compreso il NUL byte terminante !



.space       0x08  # 8 byte = 2 word



outmsg:

.asciiz      "Hai inserito la stringa:"



eol:

.asciiz      "\n"





#

# -----------------------------------------------------------

#



.text



main:

                                # stampa primo messaggio

        li   $v0, 4             # codice "print_string"

        la   $a0, inmsg         # indirizzo della stringa (etichetta)

        syscall                 # operazione di sistema



                                # lettura della stringa

        li   $v0, 8             # codice di "read_string"

        la   $a0, instring      # dove collocare la stringa in ingresso

        li   $a1, 0x08          # max lunghezza stringhe = 8 caratteri

        syscall                 # operazione di sistema



                                # stampa a capo

        li   $v0, 4             # codice "print_string"

        la   $a0, eol           # indirizzo della stringa (etichetta)

        syscall                 # operazione di sistema



                                # stampa secondo messaggio

        li   $v0, 4             # codice "print_string"

        la   $a0, outmsg        # indirizzo della stringa (etichetta)

        syscall                 # operazione di sistema



                                # stampa della stringa inserita

        li   $v0, 4             # codice di "print_string"

        la   $a0, instring      # stampa la stringa inserita

        syscall                 # operazione di sistema



	jr   $ra



#-----------------------------------------------------------