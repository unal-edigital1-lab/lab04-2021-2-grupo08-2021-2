
module Lab_04_g8 (addrRa, addrRb, addrW, datW, RegWrite, clk, rst, sseg, an);

input [3:0] addrRa;
input [3:0] addrRb;
input [3:0] addrW;
input [3:0] datW;
input RegWrite;
input clk;
input rst;
output [0:6] sseg;
output [3:0] an;

wire [3:0] datA;
wire [3:0] datB;

BancoRegistro #(3,4) 
registro (.addrRa(addrRa), .addrRb(addrRb), .addrW(addrw), .datW(datw), .RegWrite(RegWrite),
.clk(clk), .rst(rst), .datOutRa(datA), .datOutRb(datB));
	
display dp(.num(datA), .clk(clk), .rst(rst), .sseg(sseg), .an(an));

endmodule