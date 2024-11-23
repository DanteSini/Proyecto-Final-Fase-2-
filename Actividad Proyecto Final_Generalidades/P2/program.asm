# Programa: Suma dos números
addi $t0, $zero, 5     # t0 = 5
addi $t1, $zero, 10    # t1 = 10
add  $t2, $t0, $t1     # t2 = t0 + t1
sw   $t2, 0($zero)     # Mem[0] = t2