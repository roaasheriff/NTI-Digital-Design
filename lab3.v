module vector1(
    input [15:0] word,
    output [7:0] lower,upper
);
    assign lower=word[7:0];
    assign upper=word[15:8];

endmodule