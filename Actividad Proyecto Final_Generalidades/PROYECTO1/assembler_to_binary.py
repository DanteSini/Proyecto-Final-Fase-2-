instruction_set = {
    "ADDI": "001000",
    "ADD": "000000",
    "SUBI": "001000",
    "BNE": "000101",
    "LW": "100011",
    "SW": "101011",
    "JUMP": "000010"
}

registers = {
    "$zero": "00000", "$at": "00001", "$v0": "00010", "$v1": "00011", 
    "$a0": "00100", "$a1": "00101", "$a2": "00110", "$a3": "00111", 
    "$t0": "01000", "$t1": "01001", "$t2": "01010", "$t3": "01011", 
    "$t4": "01100", "$t5": "01101", "$t6": "01110", "$t7": "01111", 
    "$s0": "10000", "$s1": "10001", "$s2": "10010", "$s3": "10011", 
    "$s4": "10100", "$s5": "10101", "$s6": "10110", "$s7": "10111", 
    "$t8": "11000", "$t9": "11001", "$k0": "11010", "$k1": "11011", 
    "$gp": "11100", "$sp": "11101", "$fp": "11110", "$ra": "11111"
}

def assembler_to_binary(asm_file, bin_file):
    instructions = []
    labels = {}
    with open(asm_file, 'r') as asm:
        address = 0
        for line in asm:
            line = line.strip()
            if not line or line.startswith("#"):  # Ignorar comentarios
                continue
            parts = line.split()
            instructions.append((line, address))
            address += 1

    with open(bin_file, 'w') as bin_out:
        for line, address in instructions:
            parts = line.split()
            opcode = instruction_set.get(parts[0], "000000")
            if parts[0] == "ADDI" or parts[0] == "SUBI" or parts[0] == "LW" or parts[0] == "SW":
                rs = registers.get(parts[2], "00000")
                rt = registers.get(parts[1], "00000")
                imm = format(int(parts[3]), '016b')
                bin_out.write(f"{opcode}{rs}{rt}{imm}\n")
            elif parts[0] == "ADD":
                rs = registers.get(parts[2], "00000")
                rt = registers.get(parts[3], "00000")
                rd = registers.get(parts[1], "00000")
                shamt = "00000"
                funct = "100000"  # Función para suma
                bin_out.write(f"{opcode}{rs}{rt}{rd}{shamt}{funct}\n")
            elif parts[0] == "BNE":
                rs = registers.get(parts[1], "00000")
                rt = registers.get(parts[2], "00000")
                offset = labels.get(parts[3], 0)
                offset_bin = format(offset, '016b')
                bin_out.write(f"{opcode}{rs}{rt}{offset_bin}\n")

# Uso del script
assembler_to_binary("program.asm", "program.bin")
