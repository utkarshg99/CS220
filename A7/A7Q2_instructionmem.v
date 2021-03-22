module insmem(clk, counter, instr);

    input clk;
    input [2:0] counter;

    output reg [31:0] instr;

    reg [31:0] insmemory [0:6];

    always @(negedge clk) begin
        instr = insmemory[counter];
    end

    initial begin
        insmemory[0] = 32'b00100100000000010000000000101101;
        insmemory[1] = 32'b00100100000000101111111111101100;
        insmemory[2] = 32'b00100100000000111111111111000100;
        insmemory[3] = 32'b00100100000001000000000000011110;
        insmemory[4] = 32'b00000000001000100010100000100001;
        insmemory[5] = 32'b00000000011001000011000000100001;
        insmemory[6] = 32'b00000000101001100010100000100011;
        instr <= insmemory[0];
    end

endmodule