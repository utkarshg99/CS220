module datamem(clk, counter, data);

    input clk;
    input [3:0] counter;

    output reg [7:0] data;

    reg [7:0] datam [0:2];

    always @(negedge clk) begin
        data = datam[counter];
    end

    initial begin
        datam[0] = -20;
        datam[1] = 10;
        datam[2] = 2;
    end

endmodule