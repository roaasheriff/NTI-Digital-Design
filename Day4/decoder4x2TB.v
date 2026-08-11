`timescale 1ns/1ps
module tb_decoder();

reg A,B,En;

wire F[3:0];

decoder2x4 DUT(.A(A),.B(B),.En(En),.F(F));

initial begin
$display();
$monitor();

En=0;A=0;B=0;#10;
En=0;A=0;B=1;#10;
En=0;A=1;B=0;#10;
En=0;A=1;B=1;#10;

En=1;A=0;B=0;#10;
En=1;A=0;B=1;#10;
En=1;A=1;B=0;#10;
En=1;A=1;B=1;#10;


end
endmodule