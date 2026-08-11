module mux4x1_struct(
    input a,b,c,d,s0,s1,
    output out1
);
wire w1,w2;

mux2x1 mux1 (.A(a),.B(b),.S0(s0),.out(w1));
mux2x1 mux2 (.A(c),.B(d),.S0(s0),.out(w2));
mux2x1 mux3 (.A(w1),.B(w2),.S0(s1),.out(out1));
    
endmodule