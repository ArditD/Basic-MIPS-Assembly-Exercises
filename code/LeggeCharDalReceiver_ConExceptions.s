######################  1-LeggeDalReceiver(poll).s  #######################
#                                                                         #
#                       LEGGE DAL DEVICE RECEIVER                         #
#                                                                         #
#          Legge in polling (e busy wait) il Device Receiver.             #
#      Stampa del carattere associato al tasto premuto (via syscall)      #
#                                                                         #
###########################################################################



###########################################################################
# Dichiarazione dei dati
.data

InDevCtrl: .word 0xffff0000     # Indirizzo del Control Register del receiver
                                # l'indirizzo del Data Registrer del receveir e' 0xffff0004
InDevData: .word 0xffff0004     # Indirizzo del Data Register del receiver
                                # +4 byte rispetto al Control Register

Fine:.ascii "q"                 # carattere da premere per finire

Messaggio: .ascii "Il tasto premuto e':" # nota: questa stringa non e' terminata con byte 0 !
Carattere: .asciiz "\n\n"       # due a capo (il primo verra' sovrascritto)




###########################################################################
# Codice
.text

###############################################
#             Procedura main                  #
###############################################

main:
  # Corpo della Funzione
  lw    $t0, InDevCtrl      # recupera indirizzo Receiver Control
  lw    $t2, InDevData      # recupera indirizzo Receiver Data
  lb    $t4, Fine           # carattere per finire

  # poll della periferica

  # "busy wait"
BusyWaitRead:
    lw    $t1, 0($t0)         # legge Receiver Control Register
    andi  $t1, $t1, 0x1       # tiene solo il bit 0
    beqz  $t1, BusyWaitRead   # se e' 0, non e' ancora arrivato nulla

    # Ready = 1, e' arrivato un carattere
    lb    $t3, 0($t2)         # legge byte dal Receiver Data Register
    beq   $t3, $t4, fine      # se e' il tasto di fine, esci

    sb    $t3, Carattere      # e lo salva in memoria

    # Stampa il carattere letto con la syscall print_string
    li    $v0, 4              # print_string
    la    $a0, Messaggio      # il carattere e' incorporato !
    syscall                   # stampa con syscall

    b BusyWaitRead            # ciclo

fine:
#    jr $ra
###############################################
#                 Fine main                   #
###############################################

