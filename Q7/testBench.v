module testBench;
    reg [1:0] regAddr1, regAddr2, opcode;
    reg clk, reset, regWrite, memWrite, memRead;
    reg [31:0] dataIn;
    wire [31:0] dataOut;
    reg [8:0] memAddr;
    wire [1023:0] answerOfALU;

    processor pr (clk, reset,memRead, regWrite, memWrite,memAddr, regAddr1, regAddr2,opcode, dataIn, dataOut, answerOfALU);
    always #5 clk = ~clk;

    initial begin
        clk = 0; 
        reset = 0; 
        regWrite = 0; 
        memWrite = 0; 
        memRead = 0;
    end

    initial begin
        //Test1 : saving data inside memory
        #10;
        memWrite = 1;
        memAddr = 9'b000000011;
        dataIn = 32'h000000ba;
        #10;
        memWrite = 1;
        memAddr = 9'b000001111;
        dataIn = 32'h00000645;
        #10;
        memWrite = 1;
        memAddr = 9'b000111010;
        dataIn = 32'h00002918;
        #10;
        memWrite = 1;
        memAddr = 9'b000111111;
        dataIn = 32'h000F14918;
        #10;
        memWrite = 0;
        //Test2 : reading data From memory and transfering to regFile
        #10;
        memRead = 1;
        memAddr = 9'b01101001;
        #10;
        memRead = 1;
        memAddr = 9'b000001111;
        #10;
        regWrite = 1;
        regAddr1 = 2'b00;
        #10;
        memRead = 1;
        memAddr = 9'b000000011;
        #10;
        regWrite = 1;
        regAddr1 = 2'b10;
        #10;
        memRead = 1;
        memAddr = 9'b000111010;
        #10;
        regAddr1 = 2'b01;
        #10;
        regWrite = 0;
        memRead = 0;
        // Test 3 : Addition
        #10;
        regAddr1 = 2'b00;
        regAddr2 = 2'b01;
        opcode = 2'b00;
        #10;
        regWrite = 1;
        regAddr1 = 2'b11;
        #10;
        regWrite = 0;

        // Test 4: Multiplication
        #10;
        regAddr1 = 2'b10;
        regAddr2 = 2'b11;
        opcode = 2'b01;
        #10;
        regWrite = 1;
        regAddr1 = 2'b11;
        #10;
        regWrite = 0;

        #10 $stop;
    end

    initial begin
        $monitor($time, "regAddr1: %b, regAddr2: %b, memAddr: %h, dataIn: %h, dataOut: %h, opcode: %b,\n answerOfAlu: %h",
                regAddr1, regAddr2, memAddr, dataIn, dataOut, opcode, answerOfALU);
    end
endmodule