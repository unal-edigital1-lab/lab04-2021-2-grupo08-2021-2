# lab04 Diseño de banco de Registro

```//Testbench banco de registro

timescale 1ns / 1ps
// escala de tiempo unidad/precision

module TestBench;
// Declaracion del modulo testbench
	// Inputs
	reg [3:0] addrRa; //registro llamado addRa de 4 bits donde el bit menos significativo esta a la derecha
	
	reg [3:0] addrRb; //registro llamado addRb de 4 bits donde el bit menos significativo esta a la derecha
	
	reg [4:0] addrW; //registro llamado addrW de 5 bits donde el bit menos significativo esta a la derecha
	
	reg [3:0] datW; //registro llamado datW de 4 bits donde el bit menos significativo esta a la derecha
	
	reg RegWrite; // Registro llamado RegWrite de un bit 
	
	reg clk; // Registro llamado clk de un bit "reloj"
	
	reg rst; // Registro llamado rst de un bit "reset"

	// Outputs
	wire [3:0] datOutRa; // Conexion iterna del modulo llamada datOutRa de 4 bits
	
	wire [3:0] datOutRb; // Conexion iterna del modulo llamada datOutRb de 4 bits

	// Instancia la unidad bajo el test UTT (UUT)
	// A partir de este punto se asocia cada una de las variables del modulo a la variable de conexion o llamada; a ambas se les asigno el mismo nombre para evitar confusiones, esto hasta usar el comando initial
	
	BancoRegistro uut (
		.addrRa(addrRa), 
		.addrRb(addrRb), 
		.datOutRa(datOutRa), 
		.datOutRb(datOutRb), 
		.addrW(addrW), 
		.datW(datW), 
		.RegWrite(RegWrite), 
		.clk(clk), 
		.rst(rst)
	);

	initial begin
		// Se crean instrucciones no repetitivas en las cuales se asignan los valores iniciales de las variables addrRa, addrRb, addrW, datW, RegWrite ,clk y rst 
		addrRa = 0;
		addrRb = 0;
		addrW = 0;
		datW = 0;
		RegWrite = 0;
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100; //Establece el tiempo de ejecucion en 100 unidades de tiempo
		
      for (addrRa = 0; addrRa < 8; addrRa = addrRa + 1) begin
      
      //Se crea la condicion de que para addrRa igual a cero
      //y para todo numero menor que 8 se actualice el valor de addrRa sumandole una unidad
			
			#5 addrRb=addrRa+8;
// Luego cada 5 unidades de tiempo se actualiza el valor de addrRb tomando el valor de addrRb mas 8 unidades	

			 $display("el valor de registro %d =  %d y %d = %d", addrRa,datOutRa,addrRb,datOutRb) ;
			 
			 //imprime los valores de addrRa,datOutRa,addrRb y datOutRb
			 
    end
    
	 // termina la instruccion inicial
	 
			
	end
       // cierra el test uut
       
endmodule

 // cierra el modulo ```

# Codigo Top HDL de la solución.

El codigo que se mostrará acontinuación (Lab_04_g8), fue escrito como top para instanciar los bloques de banco de registro y display (y display a su vez instancia BCDtoSSeg) para el funcionamiento correcto del programa.
```
module Lab_04_g8 (addrA, addrB, addrw, datw, Regwrite, clk, rst, SSeg, An);

input [3:0] addrA;
input [3:0] addrB;
input [3:0] addrw;
input [3:0] datw;
input Regwrite;
input clk;
input rst;
output [0:6] SSeg;
output [3:0] An;

wire [3:0] datA;
wire [3:0] datB;

BancoRegistro #(3,4) 
registro (.addrRa(addrA), .addrRb(addrB), .addrW(addrw), .datW(datw), .RegWrite(Regwrite),
.clk(clk), .rst(rst), .datOutRa(datA), .datOutRb(datB));
	
display dp(.num(datA), .clk(clk), .rst(rst), .sseg(SSeg), .an(An));

endmodule
```
 
# Implementación

La implementación y las pruebas respectivas, se muestran en los siguientes videos.

https://drive.google.com/file/d/1sOjM-xqo28zlmlhm-oP_42981Mqc-fPA/view?usp=sharing   (1)

En este primer video se da una descripción de la asignación de pines, y como es el funcionamiento basico del banco de registro.

https://drive.google.com/file/d/1TsB6QcMRGDh7u73eJ1sAs0rPK9wrmT2K/view?usp=sharing   (2)

https://drive.google.com/file/d/1tFrW3EHlkdMxXK3g7F2WuDTA-faA6v09/view?usp=sharing   (3)

En los videos (2) y (3), se realizan pruebas de escritura y lectura en diferentes direcciones, comprobando asi que el codigo funciona como se espera. 