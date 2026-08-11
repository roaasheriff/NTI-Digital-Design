module mux2x1(
    input A,B,S0,
    output reg out
);

always @(*) begin
    if (S0=0) out=A;
    else if (S0=1) out=B;
end


    
endmodule