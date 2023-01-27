`timescale 1ns / 1ps

module WBStg(
    input logic     [31:0]  ALUResultW, ReadDataW, PCPlus4W,
    input logic     [1:0]   ResultSrcW,
    
    output logic    [31:0]  ResultW
    );
    mux3 #(32) mux31(ALUResultW, ReadDataW, PCPlus4W, ResultSrcW, ResultW);

//        initial begin
//        $display("Time\t ALUResultW\t ReadDataW\t\t PCPlus4W\t ResultSrcW\t ResultW\t");
 //       $monitor("%0d\t\t %b\t\t  %b\t\t\t  %b\t\t\t %b\t\t\t %b\t\t\t", 
//                $time,ALUResultW, ReadDataW, PCPlus4W,ResultSrcW,ResultW);
//        #260 $finish;
//        end

endmodule