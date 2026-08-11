module 7458ic(
    input p1a,p2a,p2b,p2c,p2d,p1c,p1b,p1f,p1e,p1d,
    output p1y,p2y
);
wire and1,and2,and3,and4;

assign p2y=and1|and2;
assign p1y=and3|and4;
assign and1=p2a&p2b;
assign and2=p2c&p2d;
assign and3=p1a&p1c&p1b;
assign and4=p1f&p1e&p1d;
    
endmodule