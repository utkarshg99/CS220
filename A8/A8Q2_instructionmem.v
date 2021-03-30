module insmem(clk, counter, instr);

    input clk;
    input [3:0] counter;

    output reg [31:0] instr;

    reg [31:0] insmemory [0:10];

    always @(negedge clk) begin
        instr = insmemory[counter];
    end

    initial begin
        insmemory[0] = 32'b10001100000000010000000000000000;
        insmemory[1] = 32'b10001100000000100000000000000001;
        insmemory[2] = 32'b10001100000000110000000000000010;
        insmemory[3] = 32'b00100100000001000000000000000000;
        insmemory[4] = 32'b00100100001001010000000000000000;
        insmemory[5] = 32'b00000000101000100011000000101010;
        insmemory[6] = 32'b00010000110000000000000000000101;
        insmemory[7] = 32'b00000000100001010010000000100001;
        insmemory[8] = 32'b00000000101000110010100000100001;
        insmemory[9] = 32'b00000000101000100011000000101010;
        insmemory[10] = 32'b00010100110000001111111111111101;
        instr <= insmemory[0];
    end

endmodule