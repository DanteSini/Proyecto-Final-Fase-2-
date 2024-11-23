module RegisterFile(
    input clk,
    input [4:0] rs, rt, rd,
    input RegWrite,
    input [31:0] write_data,
    output [31:0] read_data1, read_data2
);
    reg [31:0] registers [0:31]; // 32 registros de 32 bits

    initial begin
        $readmemh("registers.mem", registers); // Carga valores iniciales desde archivo
    end

    // Lectura asíncrona
    assign read_data1 = registers[rs];
    assign read_data2 = registers[rt];

    // Escritura síncrona
    always @(posedge clk) begin
        if (RegWrite) begin
            registers[rd] <= write_data;
        end
    end
endmodule

