module ControlUnit (
    input [5:0] opcode,         // Código de operación de la instrucción
    output reg [3:0] ALUControl, // Control para la ALU
    output reg RegWrite,         // Control de escritura en registros
    output reg MemRead,          // Control de lectura de memoria
    output reg MemWrite,         // Control de escritura en memoria
    output reg Branch,           // Control para salto condicional
    output reg Jump,             // Control para salto incondicional
    output reg MemtoReg          // Selección de origen del dato escrito en el registro
);

    always @(*) begin
        // Valores por defecto (para evitar latch)
        ALUControl = 4'b0000;
        RegWrite = 0;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        Jump = 0;
        MemtoReg = 0;

        case (opcode)
            6'b000000: begin // Instrucciones tipo R
                ALUControl = 4'b0010;  // Suma
                RegWrite = 1;          // Habilitar escritura
            end
            6'b100011: begin // LW: Cargar palabra
                ALUControl = 4'b0010;  // Operación de suma para calcular dirección
                RegWrite = 1;          // Escribir en registro
                MemRead = 1;           // Leer memoria
                MemtoReg = 1;          // Escribir en registro desde memoria
            end
            6'b101011: begin // SW: Guardar palabra
                ALUControl = 4'b0010;  // Operación de suma para calcular dirección
                MemWrite = 1;          // Habilitar escritura en memoria
            end
            6'b000100: begin // BEQ: Salto condicional
                ALUControl = 4'b0110;  // Operación de resta para comparar
                Branch = 1;            // Habilitar salto condicional
            end
            6'b000010: begin // JUMP: Salto incondicional
                Jump = 1;              // Habilitar salto incondicional
            end
            default: begin
                // Sin operación
                ALUControl = 4'b0000;
                RegWrite = 0;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                Jump = 0;
                MemtoReg = 0;
            end
        endcase
    end
endmodule
