module Datapath (
    input clk,
    input reset,
    output reg [31:0] PC_out,
    output [31:0] instruction
);

    // Señales internas
    reg [31:0] PC;
    wire [31:0] instr_mem_out;

    // Instancia de la memoria de instrucciones
    InstructionMemory instr_mem (
        .addr(PC[11:2]), // Se envían los bits necesarios para indexar la memoria
        .instruction(instr_mem_out)
    );

    // Asignar la salida de la instrucción
    assign instruction = instr_mem_out;

    // Lógica de actualización del PC
    always @(posedge clk or posedge reset) begin
        if (reset)
            PC <= 0; // Reinicia el PC a 0
        else
            PC <= PC + 4; // Incrementa el PC en 4
    end

    // Salida del PC
    always @(posedge clk) begin
        PC_out <= PC;
    end

endmodule
