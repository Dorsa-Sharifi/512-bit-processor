module registerFile (
    input signed[15:0] dataIn [0:31],
    input write1, write2, write3, write4, clk,
    input read1, read2, read3, read4,
    output reg signed [15:0] A1 [0:31], 
    output reg signed [15:0] A2 [0:31], 
    output reg signed [15:0] A3 [0:31], 
    output reg signed [15:0] A4 [0:31],
    output reg signed [15:0] dataOut [0:31]
);

always @(posedge clk) begin
    integer i;
    if (write1) begin
        for (i = 0 ; i <= 15 ; i = i + 1 ) begin
            A1[i] <= dataIn[i];
        end
    end else if (write2) begin
        for (i = 0 ; i <= 15 ; i = i + 1 ) begin
            A2[i] <= dataIn[i];
        end  
    end else if (write3) begin
        for (i = 0 ; i <= 15 ; i = i + 1 ) begin
            A3[i] <= dataIn[i];
        end
    end else if (write4) begin
        for (i = 0 ; i <= 15 ; i = i + 1 ) begin
            A4[i] <= dataIn[i];
        end
    end else if (read1) begin
        for (i = 0 ; i <= 15 ; i = i + 1 ) begin
            dataOut[i] <= A1[i];
        end
    end else if (read2) begin
        for (i = 0 ; i <= 15 ; i = i + 1 ) begin
            dataOut[i] <= A2[i];
        end  
    end else if (read3) begin
        for (i = 0 ; i <= 15 ; i = i + 1 ) begin
            dataOut[i] <= A3[i];
        end
    end else if (read4) begin
        for (i = 0 ; i <= 15 ; i = i + 1 ) begin
            dataOut[i] <= A4[i];
        end
    end
end
    
endmodule
