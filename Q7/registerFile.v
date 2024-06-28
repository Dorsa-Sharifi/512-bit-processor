module registerFile (
    input clk, reset, writeFlag, input [511:0] dataIn,
    input [1:0] addr1, addr2, output reg [511:0] dataOut1, dataOut2
);
reg signed[511:0] A1, A2,A3,A4;


always @(*) begin
    case (addr1)
        2'b00: dataOut1 <= A1; 
        2'b01: dataOut1 <= A2;  
        2'b10: dataOut1 <= A3; 
        2'b11: dataOut1 <= A4;
    endcase     
    case (addr2)
        2'b00: dataOut2 <= A1; 
        2'b01: dataOut2 <= A2;  
        2'b10: dataOut2 <= A3; 
        2'b11: dataOut2 <= A4;
    endcase
end

always @(posedge clk, posedge reset) begin
    if (reset == 1) begin
        A1 <= 512'b0; A2 <= 512'b0;
        A3 <= 512'b0; A4 <= 512'b0;
    end else if (writeFlag) begin
        case (addr1)
            2'b00: A1 <= dataIn; 
            2'b01: A2 <= dataIn; 
            2'b10: A3 <= dataIn; 
            2'b11: A4 <= dataIn; 
        endcase
    end
end
endmodule
