#----------------------------------------------------------

#

# Esempio 8.1

#

#----------------------------------------------------------

# Dati

#

# La stringa e' un dato costante, quindi la dichiariamo nell'area dati:

#



.data           # direttiva per l'assemblatore di inizio area dati



str:            # etichetta che identifica l'indirizzo della stringa

.asciiz         "Essere o non essere"



#

# --------------------------------------------------------

# Codice MIPS

#



.text   # direttiva per l'assemblatore: inizio area codice



main:   # etichetta di inizio del programma



        # stampa stringa di messaggio iniziale



        li   $v0, 4             # codice "print_string"

        la   $a0, str           # indirizzo della stringa (etichetta)

        syscall                 # operazione di output



	jr   $ra                # ritorno al sistema operativo



#----------------------------------------------------------



