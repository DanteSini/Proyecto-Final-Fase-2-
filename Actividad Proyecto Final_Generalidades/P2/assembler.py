# Ensamblador básico para MIPS

# Diccionario de opcodes para las instrucciones
instruction_set = {
    'addi': '001000',  # opcode para addi
    'add':  '000000',  # opcode para R-type
    'sw':   '101011',  # opcode para sw
    'lw':   '100011',  # opcode para lw
}

# Diccionario de códigos funct para instrucciones tipo R
funct_codes = {
    'add': '100000',  # funct para add
}

# Diccionario de registros con sus valores binarios
registers = {
    '$zero': '00000',
    '$t0': '01000',
    '$t1': '01001',
    '$t2': '01010',
    '$t3': '01011',
}

# Función para traducir una instrucción ensamblador a binario
def parse_instruction(instruction):
    parts = instruction.strip().split()
    opcode = instruction_set[parts[0]]  # Obtener opcode según la instrucción

    if parts[0] in ['addi']:  # Instrucciones tipo I estándar
        rt = registers[parts[1].replace(',', '')]  # Registro destino
        rs = registers[parts[2].replace(',', '')]  # Registro fuente
        imm = format(int(parts[3]), '016b')  # Inmediato convertido a 16 bits
        return opcode + rs + rt + imm

    elif parts[0] in ['sw', 'lw']:  # Instrucciones tipo I con offset(base)
        rt = registers[parts[1].replace(',', '')]  # Registro destino
        offset, base = parts[2].replace(')', '').split('(')  # Separar offset y base
        rs = registers[base]  # Registro base
        imm = format(int(offset), '016b')  # Offset convertido a 16 bits
        return opcode + rs + rt + imm

    elif parts[0] in ['add']:  # Instrucciones tipo R
        rd = registers[parts[1].replace(',', '')]  # Registro destino
        rs = registers[parts[2].replace(',', '')]  # Primer registro fuente
        rt = registers[parts[3].replace(',', '')]  # Segundo registro fuente
        shamt = '00000'  # Desplazamiento (siempre 0)
        funct = funct_codes[parts[0]]  # Código funct
        return opcode + rs + rt + rd + shamt + funct

    else:
        raise ValueError(f"Instrucción no soportada: {parts[0]}")

# Leer el archivo ensamblador y convertir a binario/hexadecimal
try:
    with open('program.asm', 'r') as asm_file:
        lines = asm_file.readlines()  # Leer todas las líneas del archivo

    with open('instructions.mem', 'w') as mem_file:
        mem_file.write('@00000000\n')  # Dirección inicial
        for line in lines:
            if line.strip() and not line.startswith('#'):  # Ignorar líneas vacías y comentarios
                binary_instruction = parse_instruction(line)  # Convertir a binario
                hex_instruction = format(int(binary_instruction, 2), '08X')  # Convertir a hexadecimal
                mem_file.write(hex_instruction + '\n')  # Escribir en el archivo .mem

    print("Archivo 'instructions.mem' generado con éxito.")

except FileNotFoundError:
    print("Error: No se encontró el archivo 'program.asm'. Asegúrate de crearlo en el mismo directorio.")
except ValueError as ve:
    print(f"Error en el ensamblador: {ve}")
