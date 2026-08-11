module controller(
    input wire [2:0] phase,
    input wire [2:0] opcode,
    input wire zero,
    output reg sel,
    output reg rd,
    output reg ld_ir,
    output reg halt,
    output reg inc_pc,
    output reg ld_ac,
    output reg wr,
    output reg ld_pc,
    output reg data_e
);
localparam integer HLT=3'b000,
                   SKZ=3'b001,
                   ADD=3'b010,
                   AND=3'b011,
                   XOR=3'b100,
                   LDA=3'b101,
                   STO=3'b110,
                   JMP=3'b111;

localparam INST_ADDR=3'b000,
           INST_FETCH=3'b001,
           INST_LOAD=3'b010,
           IDLE=3'b011,
           OP_ADDR=3'b100,
           OP_FETCH=3'b101,
           ALU_OP=3'b110,
           STORE=3'b111;
    
    always @(*) begin
        sel=0;
        rd=0;
        ld_ir=0;
        halt=0;
        inc_pc=0;
        ld_ac=0;
        ld_pc=0;
        wr=0;
        data_e=0;

        case (phase)
        INST_ADDR:sel=1;
        INST_FETCH: begin sel=1; rd=1; end
        INST_LOAD:{sel,rd,ld_ir}=3'b111;
        IDLE:{sel,rd,ld_ir}=3'b111;
        OP_ADDR:begin inc_pc=1;halt=(opcode==HLT);  end
        
        OP_FETCH:rd=((opcode==ADD)
                    ||(opcode== AND) 
                    ||(opcode== XOR) 
                    ||(opcode== LDA));
        ALU_OP:begin rd=((opcode==ADD)
                    ||(opcode== AND) 
                    ||(opcode== XOR) 
                    ||(opcode== LDA)); inc_pc=(opcode==(SKZ&&zero)); ld_pc=(opcode==JMP); data_e=(opcode==STO); end
        STORE:begin rd=((opcode==ADD)
                    ||(opcode== AND) 
                    ||(opcode== XOR) 
                    ||(opcode== LDA));
                    ld_ac=((opcode==ADD)
                    ||(opcode== AND) 
                    ||(opcode== XOR) 
                    ||(opcode== LDA)); 
                     ld_pc=(opcode==JMP); wr=(opcode==STO); data_e=(opcode==STO); end
        default:begin
        sel=0;
        rd=0;
        ld_ir=0;
        halt=0;
        inc_pc=0;
        ld_ac=0;
        ld_pc=0;
        wr=0;
        data_e=0;
        end

        endcase
        

    end
endmodule