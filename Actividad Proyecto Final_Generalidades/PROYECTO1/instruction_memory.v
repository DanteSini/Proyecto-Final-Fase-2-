module InstructionMemory (
    input [31:0] address,      // Dirección de instrucción
    output [31:0] instruction  // Instrucción leída
);
    reg [31:0] memory [0:255]; // Memoria de 256 instrucciones de 32 bits

    initial begin
        $readmemh("program.mem", memory);  // Cargar las instrucciones desde el archivo hexadecimal
    end

    assign instruction = memory[address[7:0]]; // Leer instrucción
endmodule
