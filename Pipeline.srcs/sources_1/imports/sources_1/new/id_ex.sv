`timescale 1ns / 1ps

module id_ex(
   input logic              clk, reset,
   input logic     [31:0]   PCD,PCPlus4D,
   input logic     [31:0]   RD1D, RD2D, 
   input logic     [4:0]    RDD,
   input logic     [31:0]   IMMEXID,
   input logic              RegWriteD, MemWriteD, JumpD, BranchD, AluSrcD,
   input logic     [1:0]    ResultSrcD,
   input logic     [2:0]    AluControlD,
   
   output logic     [31:0]  PCE,PCPlus4E,
   output logic     [31:0]  RD1E, RD2E,
   output logic     [4:0]   RDE,
   output logic     [31:0]  IMMEXIE,
   output logic             RegWriteE, MemWriteE, JumpE, BranchE, AluSrcE,
   output logic     [1:0]   ResultSrcE,
   output logic     [2:0]   AluControlE
   );
   
    always_ff @(posedge clk, posedge reset)
    if (reset) begin
		RD1E <= 0;
		RD2E <=0;
		PCE <=0;
		RDE <= 0;
		IMMEXIE <=0;
		PCPlus4E <=0;
		RegWriteE <= 0;
		ResultSrcE <=0;
		MemWriteE <=0;
		JumpE <= 0;
		BranchE <=0;
		AluControlE <=0;
		AluSrcE <=0;
	end
	else begin
		RD1E <= RD1D;
		RD2E <=RD2D;
		PCE <=PCD;
		RDE <= RDD;
		IMMEXIE <=IMMEXID;
		PCPlus4E <=PCPlus4D;
		RegWriteE <= RegWriteD;
		ResultSrcE <=ResultSrcD;
		MemWriteE <=MemWriteD;
		JumpE <= JumpD;
		BranchE <=BranchD;
		AluControlE <=AluControlD;
		AluSrcE <=AluSrcD;
	end
	
//	initial begin
//   $display("Time\t clk\t reset\t RegWriteD\t  AluSrcD\t MemWriteD\t ResultSrcD\t BranchD\t AluControlD\t JumpD\t RD1D\t RD2D\t RDD");
//   $monitor("%0d\t\t%b\t\t%b\t\t %b\t\t   %b\t\t\t  %b\t\t  %b\t\t\t %b\t\t\t  %b\t\t\t  %b\t\t\t  %0d\t\t  %0d\t\t  %0d\t\t", 
//            $time,clk, reset,RegWriteD, AluSrcD, MemWriteD,ResultSrcD, BranchD, AluControlD,  JumpD, RD1D,  RD2D ,RDD);
//   #260 $finish;
//   end
	
	
//	initial begin
//   $display("Time\t clk\t reset\t RegWriteE\t  AluSrcE\t MemWriteE\t ResultSrcE\t BranchE\t AluControlE\t JumpE\t RD1E\t RD2E\t RDE");
 //  $monitor("%0d\t\t%b\t\t%b\t\t %b\t\t   %b\t\t\t  %b\t\t  %b\t\t\t %b\t\t\t  %b\t\t\t  %b\t\t\t  %0d\t\t  %0d\t\t  %0d\t\t", 
//            $time,clk, reset,RegWriteE, AluSrcE, MemWriteE,ResultSrcE, BranchE, AluControlE,  JumpE, RD1E,  RD2E ,RDE);
//   #260 $finish;
//   end
   
   //                  initial begin
   //$display("Time\t PCD\tPCPlus4D\t RD1D\t RD2D\t\t RDD\t\t IMMEXID\t\t RegWriteD\t\t MemWriteD\t\t JumpD\t\t BranchD\t\t AluSrcD\t\tResultSrcD\t\tAluControlD");
   //$monitor("%0d\t\t  %0d\t\t   %0d\t\t %0d\t\t %0d\t\t\t %0d\t\t\t  %0d\t\t\t\t  %b\t\t\t  %b\t\t\t %b\t\t\t %b\t\t  %b\t\t  %b\t\t  %b\t\t", $time,
     //        PCD,PCPlus4D, RD1D, RD2D, RDD,IMMEXID,RegWriteD, MemWriteD, JumpD, BranchD, AluSrcD, ResultSrcD,AluControlD);
   //$monitor("%0d\t\t  %0d\t\t   %0d\t\t %0d\t\t %0d\t\t\t %0d\t\t\t  %0d\t\t\t\t  %b\t\t\t  %b\t\t\t %b\t\t\t %b\t\t  %b\t\t  %b\t\t  %b\t\t", $time,
     //              PCE,PCPlus4E, RD1E, RD2E, RDE,IMMEXIE,RegWriteE, MemWriteE, JumpE, BranchE, AluSrcE,ResultSrcE, AluControlE);
   //#260 $finish;
  //end
   
endmodule
