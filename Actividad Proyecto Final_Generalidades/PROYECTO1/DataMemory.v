module DataMemory (
    input clk,
    input MemRead, MemWrite,
    input [31:0] Address, WriteData,
    output [31:0] ReadData
);
    // Memoria de datos (256 palabras de 32 bits)
    reg [31:0] memory [0:255];

    // Leer datos de memoria
    assign ReadData = (MemRead) ? memory[Address[7:0]] : 32'b0;

    // Escribir datos en memoria
    always @(posedge clk) begin
        if (MemWrite) memory[Address[7:0]] <= WriteData;
    end
endmodule

