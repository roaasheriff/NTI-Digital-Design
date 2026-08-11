`timescale 1ns/1ps
module parity_gen_tb;
reg clk;
reg rst;
reg serial_in;
wire parity_out;

even_parity tb1(.clk(clk),.rst(rst),.serial_in(serial_in),.parity_out(parity_out));

always #5 clk=~clk;

initial begin
#10;
clk=0; rst=0; serial_in=0;
$display("reset=%b | clk=%b | serial in= ",rst,clk,serial_in);

#10;
clk=0; rst=0; serial_in=1;
$display("reset=%b | clk=%b | serial in= ",rst,clk,serial_in);

#10;
clk=0; rst=1; serial_in=0;
$display("reset=%b | clk=%b | serial in= ",rst,clk,serial_in);

#10;
clk=0; rst=1; serial_in=1;
$display("reset=%b | clk=%b | serial in= ",rst,clk,serial_in);

#10;
clk=1; rst=0; serial_in=0;
$display("reset=%b | clk=%b | serial in= ",rst,clk,serial_in);

#10;
clk=1; rst=0; serial_in=1;
$display("reset=%b | clk=%b | serial in= ",rst,clk,serial_in);

#10;
clk=1; rst=1; serial_in=0;
$display("reset=%b | clk=%b | serial in= ",rst,clk,serial_in);

#10;
clk=1; rst=1; serial_in=1;
$display("reset=%b | clk=%b | serial in= ",rst,clk,serial_in);

#10;
$stop;

end



endmodule