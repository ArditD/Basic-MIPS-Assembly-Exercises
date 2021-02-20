#----------------------------------------------------------

#

# Esempio 9.1

#



.data



vettore:

.space  0x20                    # 32 byte = 8 word da 4 byte



.text



main:



	# inizializzazione



        la   $t0, vettore       # carico nel registro $t0 la base del vettore

        li   $t2, 8             # primo valore nell'array



        # ciclo per immagazzinare i dati nel vettore nella posizione desiderata

ciclo:

        sw   $t2, 0($t0)        # salva il valore di $t2 nel vettore



        addi $t0, $t0, 4        # incrementa indice nel vettore di word

        sub  $t2, $t2, 1        # decrementa valore



	# test di termine



        bgt  $t2, $0, ciclo     # test di terminazione: se $t2 > 0, salta

	

	jr   $ra



#---------------------------------------------------------



