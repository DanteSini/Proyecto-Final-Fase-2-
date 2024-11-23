module ControlUnit (
    input [5:0] opcode,
    output reg RegWrite,
    output reg ALUSrc,
    output reg MemWrite,
    output reg MemRead,
    output reg Branch
);
    always @(*) begin
        case (opcode)
            6'b000000: begin // Tipo R
                RegWrite = 1;
                ALUSrc = 0;
                MemWrite = 0;
                MemRead = 0;
                Branch = 0;
            end
            6'b100011: begin // LW
                RegWrite = 1;
                ALUSrc = 1;
                MemWrite = 0;
                MemRead = 1;
                Branch = 0;
            end
            6'b101011: begin // SW
                RegWrite = 0;
                ALUSrc = 1;
                MemWrite = 1;
                MemRead = 0;
                Branch = 0;
            end
            6'b000100: begin // BEQ
                RegWrite = 0;
                ALUSrc = 0;
                MemWrite = 0;
                MemRead = 0;
                Branch = 1;
            end
            default: begin // Por defecto
                RegWrite = 0;
                ALUSrc = 0;
                MemWrite = 0;
                MemRead = 0;
                Branch = 0;
            end
        endcase
    end
endmodule
