# --------------------------------------------------------	

# Esercizio 7.2

#

# Esempio di uso delle modalita' di indirizzamento MIPS

# e della differenza tra istruzioni la ed lw

#



.globl __start     # il punto di partenza del programma deve essere "globale"

.data              # dichiarazione di inizio area dati utente, 

                   # per convenzione 0x10010000



par_0:             # primo parametro

.word	0xAA55AA55 # una word



par_1:             # secondo parametro

.word   0x12345678



par_2:             # terzo parametro

.word   0xABCDEF01



.text              # dichiarazione di inizio area programma utente



__start:           # punto di inizio del programma utente



li  $t0, 4           # carica in $t0 il valore immediato 4

li  $s0, 0x10010000  # carica in $s0 il valore immediato 0x10010000

nop

nop

la  $s1, 0x10010004  

lw  $s1, 0x10010004  

nop

nop

la  $s2, ($s0)       

lw  $s2, ($s0)       

nop

nop

la  $s3, 4($s0)      

lw  $s3, 4($s0)      

nop

nop

la  $s4, par_1       

lw  $s4, par_1       

nop

nop

la  $s5, par_0+4     

lw  $s5, par_0+4     

nop

nop

la  $s6, par_0+4($t0)

lw  $s6, par_0+4($t0)

nop

nop

# --------------------------------------------------------	



