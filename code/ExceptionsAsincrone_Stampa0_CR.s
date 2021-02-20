############################  Exceptions.s   ##############################
#                                                                         #
#                                                                         #
# N.B. - per usare il programma e' necessario attivare la modalita'       #
#        mapped I/O dello Spim e disabilitare loading file Exceptions.s   #
#        perchè già presente in questo file.                              #
#                                                                         #
###########################################################################



###########################################################################
# Kernel data
.kdata
__m1_:  .asciiz "  Exception "
__m2_:  .asciiz " occurred and ignored\n"
__m3_:  .asciiz "  Interrupt "
__m4_:  .asciiz "  by Transmitter \n"
__m5_:  .asciiz "  by Receiver \n"
__mX_:  .asciiz "  by XXXXXXXX \n"
__e0_:  .asciiz "  [Interrupt] "
__e1_:  .asciiz ""
__e2_:  .asciiz ""
__e3_:  .asciiz ""
__e4_:  .asciiz "  [Unaligned address in inst/data fetch] "
__e5_:  .asciiz "  [Unaligned address in store] "
__e6_:  .asciiz "  [Bad address in text read] "
__e7_:  .asciiz "  [Bad address in data/stack read] "
__e8_:  .asciiz "  [Error in syscall] "
__e9_:  .asciiz "  [Breakpoint] "
__e10_: .asciiz "  [Reserved instruction] "
__e11_: .asciiz ""
__e12_: .asciiz "  [Arithmetic overflow] "
__e13_: .asciiz "  [Inexact floating point result] "
__e14_: .asciiz "  [Invalid floating point result] "
__e15_: .asciiz "  [Divide by 0] "
__e16_: .asciiz "  [Floating point overflow] "
__e17_: .asciiz "  [Floating point underflow] "
__excp: .word __e0_,__e1_,__e2_,__e3_,__e4_,__e5_,__e6_,__e7_,__e8_,__e9_
        .word __e10_,__e11_,__e12_,__e13_,__e14_,__e15_,__e16_,__e17_


# memoria per salvataggio temporaneo registri
Kv0:        .word 0
Ka0:        .word 0


###########################################################################
#                               Kernel code                               #
###########################################################################

.ktext  0x80000180      # kernel text segment inzia @ 0x80000080

###########################################################################

  # Salva i registri che verranno utilizzati
.set noat
  # Because we are running in the kernel, we can use $k0/$k1 without
  # saving their old values.
  move  $k1, $at            # Salva $at su $k1
.set at
  sw    $v0, Kv0            # Not re-entrent and we can't trust $sp
  sw    $a0, Ka0

  # Carica il Cause Register
  mfc0  $k0, $13    # $k0 = $13 = Cause Register
                    # Il coprocessore #0 e' la parte di CPU che gestisce le
                    # exceptions & interrupts
                        # bit  0- 1: nop
                        # bit  2- 6:  exception Code
                        # bit     7: nop
                        # bit  8-15:  pending interrupt levels
                        # Transmitter 0x0200 = 0000 0010 0000 0000 / INT LEV 1
                        # Receiver    0x0100 = 0000 0001 0000 0000 / INT LEV 0
                        # (1 if an interrupt occured at that level,
                        # but has not been serviced)
                        # bit 16-31: nop


  # Riconosce e distingue tra le eccezioni e gli interrupt
  andi  $a0, $k0, 0x007c    # Excp mask:        0x007c = 0000 0000 0111 1100
  bgtz  $a0, Excp_ret       # salta se e' una eccezione (XXXX XXXX X000 00XX)
                            # Non e' un interrupt


###########################################################################
# Gestore degli Interrupt                                                 #
###########################################################################

# Stampa Interrupt rilevato
  li    $v0, 4
  la    $a0, __m3_
  syscall           # print "  Interrupt "

# Gestione dell'Interrupt da tastiera
IntKbd:
  # Si deve riconoscere, e servire in modo diverso, l'interrupt Receiver:
  andi  $a0, $k0, 0x0100          # Receiver mask: 0x0100 = 0000 0001 0000 0000#  beq    $a0, $0,  EndIntKbd       # branch se e' interrupt ma non di Receiver

  # E' interrupt del Receiver, quindi ...

  # Stampa le info sull'interrupt
  li    $v0, 4
  la    $a0, __m5_
  syscall           # print "  by Receiver "

  # DISABILITA Interruzioni dal Receiver (tastiera)
  lw    $a0, 0xffff0000           # Leggi attuale Receiver Control
  andi  $a0, $a0, 0xfffd          # azzera bit 1 = INT enable
  sw    $a0, 0xffff0000           # scrivi nuovo Receiver Control

  # DISABILITA Interrupt Receiver nella CPU
  mfc0  $a0, $12                  # Leggi il CPU Status Reg.
  andi  $a0, $a0, 0xfeff          # AZZERA il bit INT del Receiver
  mtc0  $a0, $12                  # Scrivi il nuovo CPU Status Reg.

  lw $a0, 0xffff0004
  li $v0, 1
  syscall			# Scrivi il codice ASCII del carattere inserito

  li    $v0, 4
  la    $a0, __m3_
  syscall 


###########################################################################
# Rientro dalla gestione degli interrupt
Int_eret:

  # Si resetta il Cause register
  mtc0  $0, $13

  # Si ripristina i registri salvati
  lw    $v0, Kv0
  lw    $a0, Ka0
  .set noat
  move  $at, $k1
  .set at

  # Si preleva l'indirizzo di ritorno, ripristina alcuni flag in Status Register
  # e salta all'indirizzo di ritorno
  mfc0  $k0, $14    # carica EPC in $k0
  eret              # Return from exception handler

# jr  $k0
###########################################################################
# Fine Gestore degli interrupt                                            #
###########################################################################


###########################################################################
# Gestore delle eccezioni                                                 #
###########################################################################
Excp_ret:

# Stampa le info sulla eccezione
  li    $v0, 4
  la    $a0, __m1_
  syscall           # print "  Exception "

  li    $v0, 1
  srl   $a0, $k0, 2 # estrae il Codice eccezione
  andi  $a0, $a0, 0xf
  syscall           # print Codice eccezione

  li    $v0, 4
  lw    $a0, __excp($k0)
  syscall           # print stringa def eccezione


  # Estrae il Codice eccezione
  srl   $k0, $k0, 2

###########################################################################
# Gestione dell'eccezione "Bad address" in PC
# L'eccezione "Bad address" richiede verifiche speciali
Excp_Bad_addr:
  # Salta se non e' l'eccezione "Bad address"
  bne   $k0, 0x6, End_Excp_Bad_addr

  mfc0  $a0, $14      # carica l'EPC
  andi  $a0, $a0, 0x3 # E' l'EPC allineato alla word?
                      # Uno dei 2 bit a dx e' a 1?
  beq   $a0, 0, End_Excp_Hnd

  li    $v0, 10       # Exit nel caso di "Bad PC"
  syscall

  j End_Excp_Hnd

End_Excp_Bad_addr:
# Fine gestione dell'eccezione "Bad address"
###########################################################################


###########################################################################
# Gestione dell'eccezione 2
Excp_n:

End_Excp_n:
# Fine gestione dell'eccezione n
###########################################################################


# Fine Stampa le info sull'Eccezione generale

  li    $v0, 4
  la    $a0, __m2_
  syscall             # print " occurred and ignored\n"

# Epilogo del gestore delle Eccezioni
End_Excp_Hnd:

  # Si resetta il Cause register
  mtc0  $0, $13

  # Si ripristina i registri salvati
  lw    $v0, Kv0
  lw    $a0, Ka0
  .set noat
  move  $at, $k1
  .set at

  # Si preleva l'indirizzo di ritorno, ripristina alcuni flag in Status Register
  # e salta all'indirizzo di ritorno
  mfc0  $k0, $14    # carica EPC in $k0
  addiu $k0, $k0, 4 # Ritorna alla istruzione successiva
  mtc0  $k0, $14
  eret               # Return from exception handler

# jr  $k0

###########################################################################
# Fine Gestore delle eccezioni                                            #
###########################################################################

###########################################################################
#                               Fine kernel                               #
###########################################################################




###########################################################################
# Standard startup code.  Invoke the routine main with no arguments.


#.text
.globl __start


# Questo programma scrive una successione infinita di "O".
# Alla pressione di un tasto stampa una stringa di avviso "Interrupt"
#
#


.data
car_O: .asciiz "O"

.text

__start:

ciclo:
        #Abbilitazione interrupt (disabilitati nella gestione di interrupt)
	mfc0  $t0, $12            # Leggi il CPU Status Reg.
        ori   $t0, $t0, 1         # abilita in generale gli INT
        ori   $t0, $t0, 0x100	  # abilita il bit INT del Receiver
        mtc0  $t0, $12            # Scrivi il nuovo CPU Status Reg.
      
        #
        # e SOLO dopo quelle della periferica, altrimenti gli IRQ non funzionano!
        #
        # Abilitazione Interrupt dal Receiver (tastiera)
        lw    $t1, 0xffff0000     # Leggi attuale Receiver Control Reg.
        ori   $t1, $t1, 2         # bit 1 = INT enable
        sw    $t1, 0xffff0000     # scrivi nuovo Receiver Control Reg.
 
        la      $a0, car_O     # stringa "O"
        li      $v0, 4         # print string
        syscall
 
        li      $t0, 0x00000fff          # costante grande
 
perdi_tempo:
        nop
        nop
        addi    $t0, $t0, -1           # decrementa
        bnez    $t0, perdi_tempo       # gira a vuoto
 
        b       ciclo          # ciclo infinito

# Epilogo


        # DISABILITA Interruzioni dal Receiver (tastiera)
        lw    $a0, 0xffff0000           # Leggi attuale Receiver Control
        andi  $a0, $a0, 0xfffd          # azzera bit 1 = INT enable
        sw    $a0, 0xffff0000           # scrivi nuovo Receiver Control
      
        # DISABILITA Interrupt Receiver nella CPU
        mfc0  $a0, $12                  # Leggi il CPU Status Reg.
        andi  $a0, $a0, 0xfeff          # AZZERA il bit INT del Receiver
        mtc0  $a0, $12                  # Scrivi il nuovo CPU Status Reg.

        jr      $ra             # fine


###############################################
#                 Fine main                   #
###############################################
