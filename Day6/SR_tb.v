`timescale 1ns/1ps
module SR_tb;
localparam WIDTH=4;
reg sin;
reg clk;
reg reset_n;
wire [WIDTH-1:0] sout;

SR #(.WIDTH(WIDTH)) TB (.sin(sin),.clk(clk),.reset_n(reset_n),.sout(sout));

always #5 clk=~clk;

initial begin
{sin,clk,reset_n}=000;
#10;
{sin,clk,reset_n}=001;
#10;
{sin,clk,reset_n}=010;
#10
{sin,clk,reset_n}=011;
#10;
{sin,clk,reset_n}=100;
#10;
{sin,clk,reset_n}=101;
#10;
{sin,clk,reset_n}=110;
#10;
{sin,clk,reset_n}=111;
#10;

$stop;

end


endmodule