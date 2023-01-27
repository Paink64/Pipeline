`timescale 1ns / 1ps
module Mem_WB(
   input logic              clk, reset,
   input logic      [31:0]  ALUResultM, ReadDataM, PCPlus4M,
   input logic      [4:0]   RDM,
   input logic              RegWriteM,
   input logic      [1:0]   ResultSrcM,
   
   output logic     [31:0]  ALUResultW, ReadDataW, PCPlus4W,
   output logic     [4:0]   RDW,
   output logic             RegWriteW,
   output logic     [1:0]   ResultSrcW
    );
   
    always_ff @(posedge clk, posedge reset)
    if (reset) begin
		ALUResultW <= 0;
		ReadDataW <=0;
		RDW <=0;
		PCPlus4W <= 0;
		RegWriteW <=0;
		ResultSrcW <=0;
	end
	else begin
		ALUResultW <= ALUResultM;
		ReadDataW <=ReadDataM;
		RDW <=RDM;
		PCPlus4W <= PCPlus4M;
		RegWriteW <=RegWriteM;
		ResultSrcW <=ResultSrcM;
	end
   
endmodule
