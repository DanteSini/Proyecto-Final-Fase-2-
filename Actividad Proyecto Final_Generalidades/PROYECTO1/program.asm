# Algoritmo: Suma de los primeros n números naturales
# Registros utilizados:
# $t0 = n (contador)
# $t1 = sum (resultado acumulado)

ADDI $t0, $zero, 10    # Inicializar n = 10
ADD  $t1, $zero, $zero  # Inicializar sum = 0

LOOP:
    ADD  $t1, $t1, $t0  # sum += n
    SUBI $t0, $t0, 1    # n -= 1
    BNE  $t0, $zero, LOOP # Repetir mientras n > 0

# Fin del programa
