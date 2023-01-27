`timescale 1ns / 1ps

module Execute(
   input logic              clk, reset,
   input logic      [31:0]   RD1E, RD2E, 
   input logic     [4:0]RDE,
   input logic      [31:0]  IMMEXIE,
   input logic      [31:0]  PCE,
   input logic      [31:0]  PCPlus4E,
   input logic              RegWriteE, MemWriteE, JumpE, BranchE, AluSrcE,
   input logic      [1:0]   ResultSrcE,
   input logic      [2:0]   AluControlE,
   
   output logic     [31:0]  PCTargetE,
   output logic     [31:0]  ALUResultM, WriteDataM, PCPlus4M,
   output logic     [4:0]   RDM,
   output logic             RegWriteM, MemWriteM, PCSrcE,
   output logic     [1:0]   ResultSrcM
    );
    logic ZeroE;
    logic [31:0] SrcBE, ALUResultE;

    mux2 #(32)  pcmux(RD2E, IMMEXIE, AluSrcE, SrcBE);
    adder       PCadder(PCE, IMMEXIE, PCTargetE);
    alu alu1(RD1E, SrcBE, AluControlE, ALUResultE, ZeroE);

            Ex_Mem  Ex_Mem1(clk, reset,
            ALUResultE, RD2E, PCPlus4E,
            RDE,
            RegWriteE, MemWriteE,
            ResultSrcE,
               
            ALUResultM, WriteDataM, PCPlus4M,
            RDM,
            RegWriteM, MemWriteM,
            ResultSrcM);
    
    //assign PCSrcE = 0;
    assign PCSrcE = (ZeroE & BranchE) | JumpE;




//    initial begin
//    $display("Time\t PCE\t  RegWriteE\t AluSrcE\t MemWriteD\t ResultSrcE\t BranchE\t AluControlE\t   JumpE\t\t RD1E\t RD2E\t RDE");
//    $monitor("%0d\t\t  %0d\t\t     %b\t\t %b\t\t\t  %b\t\t\t  %b\t\t\t %b\t\t\t  %b\t\t\t  %b\t\t\t   %0d\t\t  %0d\t\t  %0d\t\t", $time,    PCE, RegWriteE, AluSrcE, MemWriteE,ResultSrcE, BranchE, AluControlE,  JumpE, RD1E,  RD2E ,RDE);
//    #260 $finish;
//    end
endmodule