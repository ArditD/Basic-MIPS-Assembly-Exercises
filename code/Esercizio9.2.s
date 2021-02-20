#----------------------------------------------------------

#

# Esercizio 9.2

#



.data



vettore:

.space  0x20                    # 8 word da 4 byte = 32 byte



.text



main:



        la   $t0, vettore       # carico nel registro $t0 la base del vettore

        li   $t2, 8             # primo valore nell'array



        # Ciclo per immagazzinare i dati nel vettore nella posizione desiderata



ciclo:



#------------------------------------------------------------------

# Sezione A

#------------------------------------------------------------------

# 1) scegliere la istruzione corretta tra le seguenti alternative

# 2) spiegare perche' le altre alternative sono errate

#

#       b    fine               # A1:

#       bnez $t2, fine          # A2:

#       beq  $t2, $0, fine      # A3:

#       bne  $t2, $0, fine      # A4:

#       bgt  $t2, $0, fine      # A5:

#       blt  $t2, $0, fine      # A6:

#

#------------------------------------------------------------------



        sw   $t2, 0($t0)        # salva il valore di t2 nel vettore



        addi $t0, $t0, 4        # incrementa indice nel vettore

        sub  $t2, $t2, 1        # decrementa valore



#------------------------------------------------------------------

# Sezione B

#------------------------------------------------------------------

# Date queste istruzioni:

#

#       b    ciclo              # B1:

#       j    ciclo              # B2:

#

# 1) sono entrambe corrette per i ns scopi ? 

#    (rispondere senza caricare in SPIM)

# 2) provarle entrambe ed annotare le differenze nei commenti

#

#------------------------------------------------------------------



fine:   jr   $ra

