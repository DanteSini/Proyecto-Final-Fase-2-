module ALU (
    input [31:0] A, B,         // Entradas: operandos de 32 bits
    input [3:0] ALUControl,    // Señal de control para operación
    output reg [31:0] ALUResult, // Salida: resultado de la operación
    output Zero                // Indicador de si el resultado es cero
);
    always @(*) begin
        case (ALUControl)
            4'b0010: ALUResult = A + B;  // Suma
            4'b0110: ALUResult = A - B;  // Resta
            4'b0000: ALUResult = A & B;  // AND
            4'b0001: ALUResult = A | B;  // OR
            4'b0111: ALUResult = (A < B) ? 1 : 0; // Comparación "menor que"
            default: ALUResult = 0;      // Operación no válida
        endcase
    end

    assign Zero = (ALUResult == 0);  // Salida de indicador de cero
endmodule

