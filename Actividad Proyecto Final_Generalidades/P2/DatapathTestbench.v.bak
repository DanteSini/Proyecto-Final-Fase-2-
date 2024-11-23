`timescale 1ns / 1ps

module DatapathTestbench;
    // Entradas y salidas del testbench
    reg clk;
    reg reset;
    wire [31:0] PC_out;
    wire [31:0] instruction;

    // Generación del reloj
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Periodo de reloj: 10ns
    end

    // Instancia del Datapath
    Datapath uut (
        .clk(clk),
        .reset(reset),
        .PC_out(PC_out),
        .instruction(instruction) // Conectando la señal de la instrucción
    );

    // Simulación
    initial begin
        $dumpfile("datapath.vcd"); // Archivo de salida para visualización
        $dumpvars(0, DatapathTestbench);

        reset = 1; // Activar reset
        #10 reset = 0; // Desactivar reset después de 10ns

        #1000; // Simular por 1000ns
        $finish;
    end
endmodule
