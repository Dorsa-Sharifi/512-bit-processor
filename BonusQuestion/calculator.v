module calculator (input multiply, sum, clk,
    input signed [15:0] A1 [0:31], 
    input signed [15:0] A2 [0:31], 
    output reg signed [15:0] A3 [0:31], 
    output reg signed [15:0] A4 [0:31]
);

always @(posedge clk) begin
    integer i;
    if (sum) begin
        for (i = 0; i <= 15 ; i = i + 1 ) begin
            if (i <= 7) begin
                A3[i] <= A1[i] + A2[i];
            end else begin
                A4[i] <= A1[i] + A2[i];
            end
        end
    end else if (multiply) begin
        for (i = 0; i <= 15 ; i = i + 1 ) begin
            if (i <= 7) begin
                A3[i] <= A1[i] * A2[i];
            end else begin
                A4[i] <= A1[i] * A2[i];
            end
        end        
    end
end
    
endmodule
