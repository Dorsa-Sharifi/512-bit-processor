module Memory (input clk, input writeFlag, readFlag,
    input [8:0] addr, input [31:0] dataIn,
    output reg [31:0] dataOut
);

reg signed [31:0] mem [511:0];

always @(posedge clk) begin
    if (readFlag) begin
        dataOut <= mem[addr];
    end else if (writeFlag) begin
        mem[addr] <= dataIn;
    end
end
endmodule
