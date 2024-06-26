module Memory (input int index, 
    input signed[15:0] dataIn [0:31],
    input write1, write2, write3, write4,writeMem, clk,
    output reg signed [15:0] dataOut [0:31]
);
reg [31:0] mem [0:511];

always @(posedge clk) begin
    integer i;
    if (write1 || write2 || write3 || write4) begin
        if (index <= 15) begin
            for (i = index ; i <= index + 16 ; i = i + 1 ) begin
                dataOut[i] <= mem[i];
            end
        end
    end else if (writeMem) begin
        if (index <= 15) begin
            for (i = index ; i <= index + 16 ; i = i + 1 ) begin
                mem[i] <= dataIn[i];
            end
        end
    end
end
    
endmodule
