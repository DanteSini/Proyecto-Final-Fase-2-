module ALU (
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALUControl,
    output reg [31:0] Result,
    output zero
);
    always @(*) begin
        case (ALUControl)
            4'b0010: Result = A + B;  // Suma
            4'b0110: Result = A - B;  // Resta
            4'b0000: Result = A & B;  // AND
            4'b0001: Result = A | B;  // OR
            default: Result = 32'b0;  // Valor por defecto
        endcase
    end

    assign zero = (Result == 32'b0); // Bandera de cero
endmodule
