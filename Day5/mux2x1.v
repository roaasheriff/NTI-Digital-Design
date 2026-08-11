module mux2x1 #(
    parameter WIDTH=5
) (
    input wire [WIDTH-1:0] in0,
    input wire [WIDTH-1:0] in1,
    input wire sel,
    output reg [WIDTH-1:0] mux_out
);

always @(*) begin
    if(s1'b0)
        mux_out=in0;
     else begin
        mux_out=in1;
     end
    
end
    
endmodule