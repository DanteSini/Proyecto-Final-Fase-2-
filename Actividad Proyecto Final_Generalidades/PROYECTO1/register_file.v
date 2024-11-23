module RegisterFile (
    input clk,                 // Reloj
    input reset,               // Señal de reinicio
    input RegWrite,            // Control de escritura
    input [4:0] rs, rt, rd,    // Direcciones de registros fuente y destino
    input [31:0] WriteData,    // Dato a escribir en el registro destino
    output [31:0] ReadData1, ReadData2 // Salidas de los registros
);
    reg [31:0] registers [31:0]; // Banco de 32 registros de 32 bits

    integer i; // Declarar índice del bucle

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Inicializar registros a cero en caso de reset
            for (i = 0; i < 32; i = i + 1) begin
                registers[i] <= 32'b0;
            end
        end else if (RegWrite) begin
            registers[rd] <= WriteData;  // Escribir en registro destino
        end
    end

    assign ReadData1 = registers[rs]; // Leer registro fuente 1
    assign ReadData2 = registers[rt]; // Leer registro fuente 2
endmodule
