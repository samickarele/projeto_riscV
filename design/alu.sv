`timescale 1ns / 1ps

module alu#(
        parameter DATA_WIDTH = 32,
        parameter OPCODE_LENGTH = 4
        )
        (
        input logic [DATA_WIDTH-1:0]    SrcA,
        input logic [DATA_WIDTH-1:0]    SrcB,

        input logic [OPCODE_LENGTH-1:0]    Operation,
        output logic[DATA_WIDTH-1:0] ALUResult
        );
    
        always_comb
        begin
            case(Operation)
            4'b0000:        // AND
                    ALUResult = SrcA & SrcB;
            4'b0010:        // ADD
                    ALUResult = SrcA + SrcB;
            4'b0011: // sub
                ALUResult = SrcA - SrcB;
            4'b1000:        // Equal
                    ALUResult = (SrcA == SrcB) ? 1 : 0;
            4'b0001:       // or
                    ALUResult = SrcA | SrcB;
            4'b1001: // XOR
                    ALUResult = SrcA ^ SrcB;
            4'b1010: // BNE
                    ALUResult = (SrcA != SrcB) ? 1 : 0;
            4'b1110: // BLT
                    ALUResult = ($signed(SrcA) < $signed(SrcB)) ? 1 : 0;
            4'b1101: // BGE
                    ALUResult = ($signed(SrcA) >= $signed(SrcB)) ? 1 : 0;
            4'b1100: // slt e slti
                    ALUResult = ($signed(SrcA) < $signed(SrcB)) ? 1 : 0; // coloquei o signed pra garantir
            4'b0101: // SRLI
                    ALUResult = SrcA >> SrcB[4:0];
            4'b0100: // SLLI
                    ALUResult = SrcA << SrcB[4:0];
            4'b0111: // srai
                    ALUResult = $signed(SrcA) >>> SrcB[4:0]; // signed de novo
            default:
                    ALUResult = 0;
            endcase
        end
endmodule

