# Convertir program.bin a program.mem
with open("program.bin", "r") as bin_file, open("program.mem", "w") as mem_file:
    mem_file.write("@0000\n")  # Dirección inicial de memoria
    for line in bin_file:
        line = line.strip()  # Eliminar posibles saltos de línea y espacios
        hex_line = hex(int(line, 2))[2:].zfill(8)  # Convertir binario a hex y rellenar con ceros
        mem_file.write(hex_line + "\n")
