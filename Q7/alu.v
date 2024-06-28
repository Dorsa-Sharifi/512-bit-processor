module alu (input [1:0] opcode, input [511:0] A1, input [511:0] A2, 
    output reg [1023:0] dataOut
);

always @(*) begin
    case(opcode)
        2'b00: 
            dataOut = $signed(A1 + A2);
        2'b01:
            dataOut = $signed(A1 * A2);     
    endcase
end
endmodule
