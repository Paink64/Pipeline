module aludec(input  logic       opb5,
              input  logic [2:0] funct3,
              input  logic       funct7b5, 
              input  logic [1:0] ALUOp,
              output logic [2:0] AluControlD);

  logic  RtypeSub;
  assign RtypeSub = funct7b5 & opb5;  // TRUE for R-type subtract instruction

  always_comb
    case(ALUOp)
     // add the logic here 
      2'b00: AluControlD = 3'b000; //add
      2'b01: AluControlD = 3'b001; //subtract 
      
      2'b10: case(funct3)
        3'b010: AluControlD = 3'b101; //SLT
        3'b110: AluControlD = 3'b011; //OR
        3'b111: AluControlD = 3'b010; //AND
       
        3'b000: case({opb5,funct7b5}) 
          2'b11: AluControlD = 3'b001;
          2'b00: AluControlD = 3'b000;
          2'b01: AluControlD = 3'b000;                    
          2'b10: AluControlD = 3'b000;
                  endcase
       default: AluControlD = 3'bxxx;
       endcase
    endcase
endmodule