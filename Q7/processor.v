module processor (input clk,reset,memRead,regWrite, memWrite,
    input [8:0] memAddr,
    input [1:0] regAddr1, 
    input [1:0] regAddr2, 
    input [1:0] opcode, 
    input [31:0] dataIn, output [31:0] dataOut, 
    output reg signed [1023:0] answerOfAlu
);

wire signed [511:0] dataOut1, dataOut2;
wire signed [1023:0] answerOfALU;
reg signed [511:0] registerDataIn;

assign answerOfAlu = answerOfALU;
assign registerDataIn = dataOut;

alu myAlu (opcode,dataOut1,dataOut2, answerOfALU);

registerFile regFile (clk, reset, regWrite, registerDataIn,regAddr1, regAddr2, 
    dataOut1, dataOut2);

Memory mem (clk, memWrite, memRead, memAddr, dataIn, dataOut);


endmodule
