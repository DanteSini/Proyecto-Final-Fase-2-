module InstructionMemory (
    input [9:0] addr, // Dirección de 10 bits
    output reg [31:0] instruction
);

    // Memoria interna (1024 palabras de 32 bits)
    reg [31:0] memory [0:1023];

    // Inicialización de memoria desde archivo
    initial begin
        $readmemh("instructions.mem", memory); // Cambiar el nombre aquí para que coincida con tu archivo
    end

    // Leer instrucción
    always @(*) begin
        instruction = memory[addr];
    end

endmodule
