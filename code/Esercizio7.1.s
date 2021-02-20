# --------------------------------------------------------	

# Esercizio 7.1

# Esempio di espansione di pseudo-istruzione "lw"

#



.globl __start     # il punto di partenza del programma deve essere "globale"

.data 0x10010004   # dichiarazione di inizio area dati utente



loc_dato:          # etichetta indirizzo del dato

.word	0x12345678 # dato da caricare



.text              # dichiarazione di inizio area programma utente



__start:           # punto di partenza programma utente



lw $s0, loc_dato   # carica il dato nel registro $s0



#---------------------------------------------------------

