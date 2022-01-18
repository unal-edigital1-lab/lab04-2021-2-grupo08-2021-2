`timescale 1ns / 1ps
module Lab_04_g8 (addrA, addrB, addrw, datw, Regwrite, clk, rst, SSeg, An);

input [3:0] addrA;
input [3:0] addrB;
input [3:0] addrw;
input [3:0] datw;
input [3:0] Regwrite;
input [3:0] clk;
input [3:0] rst;
output [6:0] SSeg;
output [3:0] An;

wire [3:0] datA;
wire [3:0] datB;

BancoRegistro #(3,4) 
registro (.addrRa(addrA), .addrRb(addrB), .addrW(addrw), .datW(datw), .RegWrite(Regwrite),
.clk(clk), .rst(rst), .datOutRa(datA), .datOutRb(datB));
	
display dp(.num(datA), .clk(clk), .rst(rst), .sseg(SSeg), .an(An));

endmodule