module insmem(clk, counter, instr);

    input clk;
    input [3:0] counter;

    output reg [31:0] instr;

    reg [31:0] insmemory [0:13];

    always @(negedge clk) begin
        instr = insmemory[counter];
    end

    initial begin
        insmemory[0] = 32'b00100100000000100000000000000000;
        insmemory[1] = 32'b00100100000000110000000000000000;
        insmemory[2] = 32'b00000000011000010010000000101010;
        insmemory[3] = 32'b00010000100000000000000000001000;
        insmemory[4] = 32'b00100100000001010000000000001010;
        insmemory[5] = 32'b00010000011001010000000000000110;
        insmemory[6] = 32'b10001100011001100000000000000000;
        insmemory[7] = 32'b00000000010001100001000000100001;
        insmemory[8] = 32'b00100100011000110000000000000001;
        insmemory[9] = 32'b00000000011000010010000000101010;
        insmemory[10] = 32'b00010100100000001111111111111011;
        insmemory[11] = 32'b00000011111000000000000000001000;
        insmemory[12] = 32'b10001100000000010000000000001010;
        insmemory[13] = 32'b00001100000000000000000000000000;
        instr <= insmemory[12];
    end

endmodule