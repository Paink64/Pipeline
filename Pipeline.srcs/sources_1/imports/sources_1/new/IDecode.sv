//ID stage 
module IDecode (
   input logic              clk, reset,
   input logic      [31:0]  PCD,
   input logic      [31:0]  InstrD,
   input logic      [31:0]  PCPlus4D,
   input logic              RegWriteW,
   input logic      [31:0]  ResultW,
   input logic      [4:0]  RDW,
   
   output logic     [31:0]  PCE,PCPlus4E,
   output logic     [31:0]  RD1E, RD2E, 
   output logic     [4:0]RDE,
   output logic     [31:0]  IMMEXIE,
   output logic             RegWriteE, MemWriteE, JumpE, BranchE, AluSrcE,
   output logic     [1:0]   ResultSrcE,
   output logic     [2:0]   AluControlE
   );
   
    logic [1:0] ImmSrcD; 
    
    
 /*  */ logic     [31:0]   RD1D, RD2D;
    logic     [4:0] RDD;
    logic     [31:0]  IMMEXID;
    logic             RegWriteD, MemWriteD, JumpD, BranchD, AluSrcD;
    logic     [1:0]   ResultSrcD;
    logic     [2:0]   AluControlD;
    assign RDD = InstrD[11:7];
    
    controller c(InstrD[6:0], InstrD[14:12], InstrD[30],
               ResultSrcD, MemWriteD,
               AluSrcD, RegWriteD, JumpD, BranchD,
               ImmSrcD, AluControlD);
               
    extend  extend1(InstrD[31:7],ImmSrcD,IMMEXID);
    regfile  regfile1(clk, RegWriteW, InstrD[19:15], InstrD[24:20], 
                 RDW, ResultW, RD1D, RD2D);


   /* 
 assign RDE = InstrD[11:7];          
    controller c(InstrD[6:0], InstrD[14:12], InstrD[30],
               ResultSrcE, MemWriteE,
               AluSrcE, RegWriteE, JumpE, BranchE,
               ImmSrcD, AluControlE);
               
    extend  extend1(InstrD[31:7],ImmSrcD,IMMEXIE);
    regfile  regfile1(clk, RegWriteW, InstrD[19:15], InstrD[24:20], 
                 RDW, ResultW, RD1E, RD2E);     
                
           initial begin
    $display("Time\t PCD\t InstrD\t\t InstrD19_15\t InstrD24_20\t InstrD11_7\t RegWriteE\t ImmSrcD\t AluSrcE\t MemWriteD\t ResultSrcE\t BranchE\t AluControlE\t   JumpE\t\t RD1E\t RD2E\t RDE");
    $monitor("%0d\t\t %0d\t\t %h\t\t %0d\t\t\t\t %0d\t\t\t\t %0d\t\t\t %b\t\t  %b\t\t  %b\t\t\t  %b\t\t\t  %b\t\t\t %b\t\t\t  %b\t\t\t  %b\t\t\t  %0d\t\t  %0d\t\t  %0d\t\t", $time,    PCD,  InstrD,InstrD[19:15], InstrD[24:20], InstrD[11:7],RegWriteD,ImmSrcD, AluSrcD, MemWriteD,ResultSrcD, BranchD, AluControlD,  JumpD, RD1D,  RD2D ,RDD);
    $monitor("%0d\t\t %0d\t\t %h\t\t %0d\t\t\t\t %0d\t\t\t\t %0d\t\t\t %b\t\t  %b\t\t  %b\t\t\t  %b\t\t\t  %b\t\t\t %b\t\t\t  %b\t\t\t  %b\t\t\t  %0d\t\t  %0d\t\t  %0d\t\t", $time,    PCE,  InstrD,InstrD[19:15], InstrD[24:20], InstrD[11:7],RegWriteE,ImmSrcD, AluSrcE, MemWriteD,ResultSrcE, BranchE, AluControlE,  JumpE, RD1E,  RD2E ,RDE);
    #260 $finish;
    end          
*/         
    id_ex   id_ex1( clk, reset,
                    PCD,PCPlus4D,
                    RD1D, RD2D, RDD,
                    IMMEXID,
                    RegWriteD, MemWriteD, JumpD, BranchD, AluSrcD,
                    ResultSrcD,
                    AluControlD,
                       
                    PCE,PCPlus4E,
                    RD1E, RD2E, RDE,
                    IMMEXIE,
                    RegWriteE, MemWriteE, JumpE, BranchE, AluSrcE,
                    ResultSrcE,
                    AluControlE);
                   
                   
                            
//    initial begin
//    $display("Time\t PCD\t InstrD\t\t InstrD19_15\t InstrD24_20\t InstrD11_7\t RegWriteE\t ImmSrcD\t AluSrcE\t MemWriteD\t ResultSrcE\t BranchE\t AluControlE\t   JumpE\t\t RD1E\t RD2E\t RDE");
////    $monitor("%0d\t\t %0d\t\t %h\t\t %0d\t\t\t\t %0d\t\t\t\t %0d\t\t\t %b\t\t  %b\t\t  %b\t\t\t  %b\t\t\t  %b\t\t\t %b\t\t\t  %b\t\t\t  %b\t\t\t  %0d\t\t  %0d\t\t  %0d\t\t", $time,    PCD,  InstrD,InstrD[19:15], InstrD[24:20], InstrD[11:7],RegWriteD,ImmSrcD, AluSrcD, MemWriteD,ResultSrcD, BranchD, AluControlD,  JumpD, RD1D,  RD2D ,RDD);
//   $monitor("%0d\t\t %0d\t\t %h\t\t %0d\t\t\t\t %0d\t\t\t\t %0d\t\t\t %b\t\t  %b\t\t  %b\t\t\t  %b\t\t\t  %b\t\t\t %b\t\t\t  %b\t\t\t  %b\t\t\t  %0d\t\t  %0d\t\t  %0d\t\t", $time,    PCE,  InstrD,InstrD[19:15], InstrD[24:20], InstrD[11:7],RegWriteE,ImmSrcD, AluSrcE, MemWriteE,ResultSrcE, BranchE, AluControlE,  JumpE, RD1E,  RD2E ,RDE);
//    #260 $finish;
//    end
  
  
endmodule
