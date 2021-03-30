module datamem(clk, counter, data);

    input clk;
    input [3:0] counter;

    output reg [7:0] data;

    reg [7:0] datam [0:10];

    always @(negedge clk) begin
        data = datam[counter];
    end

    initial begin
        datam[0] = -1;
        datam[1] = -2;
        datam[2] = -3;
        datam[3] = -4;
        datam[4] = 5;
        datam[5] = 6;
        datam[6] = 7;
        datam[7] = 8;
        datam[8] = 9;
        datam[9] = -10;
        datam[10] = 11;
    end

endmodule