module SR #(parameter WIDTH=4)(
    input wire sin,
    input wire clk,reset_n,
    output reg [WIDTH-1:0] sout
);
    
    always @(posedge clk) begin
        if(!reset_n) sout<={WIDTH{1'b0}};
        else begin
           sout<={sin,sout[WIDTH-1:1]};
        end
    end



endmodule