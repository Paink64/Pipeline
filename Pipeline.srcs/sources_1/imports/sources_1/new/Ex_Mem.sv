`timescale 1ns / 1ps
module Ex_Mem(
   input logic              clk, reset,
   input logic     [31:0]  ALUResultE, WriteDataE, PCPlus4E,
   input logic     [4:0]   RDE,
   input logic             RegWriteE, MemWriteE,
   input logic     [1:0]   ResultSrcE,
   
   output logic     [31:0]  ALUResultM, WriteDataM, PCPlus4M,
   output logic     [4:0]   RDM,
   output logic             RegWriteM, MemWriteM,
   output logic     [1:0]   ResultSrcM
    );
   
    always_ff @(posedge clk, posedge reset)
    if (reset) begin
		ALUResultM <= 0;
		WriteDataM <=0;
		RDM <=0;
		PCPlus4M <= 0;
		RegWriteM <=0;
		ResultSrcM <=0;
		MemWriteM <= 0;
	end
	else begin
		ALUResultM <= ALUResultE;
		WriteDataM <=WriteDataE;
		RDM <=RDE;
		PCPlus4M <= PCPlus4E;
		RegWriteM <=RegWriteE;
		ResultSrcM <=ResultSrcE;
		MemWriteM <= MemWriteE;
	end
   
endmodule
