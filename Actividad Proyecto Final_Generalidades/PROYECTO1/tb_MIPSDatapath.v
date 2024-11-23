module tb_MIPSDatapath();
    reg clk, reset;
    wire [31:0] instruction;
    wire [31:0] result;

    // Instanciar el datapath
    MIPSDatapath DUT (
        .clk(clk),
        .reset(reset),
        .instruction(instruction),
        .result(result)
    );

    // Instanciar la memoria de instrucciones
    InstructionMemory IM (
        .address(DUT.PC), 
        .instruction(instruction)
    );

    // Generar el reloj
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Simulación
    initial begin
        reset = 1;
        #10 reset = 0;
        #200;  // Aumenta el tiempo de espera para que la simulación se ejecute completamente

        // Verificar el resultado final
        $display("Resultado esperado en $t1: 55");
        $display("Resultado obtenido: %d", DUT.RF.registers[9]); // $t1 es el registro 9

        $finish;
    end
endmodule
