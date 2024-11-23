module TestF2_MemInst;

  // Definir el tamaño de la memoria (en este caso, 256 palabras de 32 bits)
  reg [31:0] memory_array [0:255];  // Aquí 256 es el número de palabras en memoria

  initial begin
    // Cargar el archivo .mem en la memoria
    $readmemh("instructions.mem", memory_array);  // Asegúrate de que el archivo esté en la misma carpeta o usa la ruta correcta

    // Agregar cualquier prueba o impresión que desees aquí
    // Ejemplo: Ver el contenido de la memoria en la simulación
    $display("memory_array[0] = %h", memory_array[0]);
    $display("memory_array[1] = %h", memory_array[1]);
    // Aquí puedes imprimir más direcciones de memoria o agregar más pruebas
  end

  // Otros códigos de tu testbench o módulo si los necesitas

endmodule

