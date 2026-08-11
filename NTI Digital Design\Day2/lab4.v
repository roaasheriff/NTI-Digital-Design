module vector2(
    input [31:0]word,
    output [31:0]rev_word
);

assign rev_word[31:0]={word[7:0],word[15:8],word[23:16],word[31:24]};

    
endmodule