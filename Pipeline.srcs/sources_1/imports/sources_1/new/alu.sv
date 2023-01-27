module alu(input  logic [31:0] RD1E, SrcBE,
           input  logic [2:0]  AluControlE,
           output logic [31:0] ALUResultE,
           output logic        ZeroE);

  logic [31:0] condinvb, sum;
  logic        v;              // overflow
  logic        isAddSub;       // true when is add or subtract operation

  assign condinvb = AluControlE[0] ? ~SrcBE : SrcBE;
  assign sum = RD1E + condinvb + AluControlE[0];
  assign isAddSub = (~AluControlE[2] & ~AluControlE[1]) | (~AluControlE[1] & AluControlE[0]);

  always_comb
    case (AluControlE)
     3'b000: ALUResultE=sum; 
     3'b001: ALUResultE=sum; 
     3'b101: ALUResultE=sum[31]^v;
     3'b011: ALUResultE=RD1E|SrcBE;
     3'b010: ALUResultE=RD1E&SrcBE;
     default: ALUResultE=32'bx;
    endcase
    
  assign ZeroE = (ALUResultE==0) ? 1 : 0;
  assign v = ~(AluControlE[0] ^ RD1E[31] ^ SrcBE[31]) & (RD1E[31] ^ sum[31]) & isAddSub;
  
//    initial begin
//   $display("Time\t  RD1E\t\t  SrcBE\t\t AluControlE\t ALUResultM\t ZeroE\t sum");
//   $monitor("%0d\t\t    %0d\t\t    %0d\t\t    %b\t\t\t\t %0d\t\t\t %b\t\t %0d\t\t", 
//      time,RD1E, SrcBE,AluControlE,ALUResultM,ZeroE,sum);
//  #260 $finish;
//   endAluControlD_reg
  
endmodule
          
    
                 
            
          
