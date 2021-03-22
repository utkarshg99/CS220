module insmem(clk, done, icount, rcount, jcount, count3, count4, count5, count6);

    input clk;

    output reg done;
    output reg [2:0] icount;
    output reg [2:0] rcount;
    output reg [2:0] jcount;
    output reg [2:0] count3;
    output reg [2:0] count4;
    output reg [2:0] count5;
    output reg [2:0] count6;

    reg [31:0] insmemory [0:7];
    reg [31:0] pc;
    reg [5:0] counter;
    reg [5:0] opcode;
    reg [4:0] rs;
    reg [4:0] rt;
    reg [4:0] rd;
    reg [4:0] sh;
    reg [4:0] fn;
    reg [15:0] imm;
    reg [25:0] jimm;

    always @(posedge clk) begin
        if(counter < 8) begin
            pc = insmemory[counter];
            opcode = pc[31:26];
            if(opcode == 0) begin
                rcount += 1;
                rs <= pc[25:21];
                rt <= pc[20:16];
                rd = pc[15:11];
                sh <= pc[10:6];
                fn <= pc[5:0];
                if (rd == 3) count3 <= count3+1;
                else if (rd == 4) count4 <= count4+1;
                else if (rd == 5) count5 <= count5+1;
                else if (rd == 6) count6 <= count6+1;
            end
            else if(opcode == 2 || opcode == 3) begin
                jcount += 1;
                jimm = pc[25:0];
            end
            else begin
                icount += 1;
                rs <= pc[25:21];
                rd = pc[20:16];
                imm <= pc[15:0];
                if (rd == 3) count3 <= count3+1;
                else if (rd == 4) count4 <= count4+1;
                else if (rd == 5) count5 <= count5+1;
                else if (rd == 6) count6 <= count6+1;
            end
            counter <= counter+1;
        end
        else done <= 1;
    end

    initial begin
        insmemory[0] <= 32'b00100000000001000011010001010110; // i
        insmemory[1] <= 32'b00100000000001011111111111111111; // i
        insmemory[2] <= 32'b00000000101001000011000000100000; // r
        insmemory[3] <= 32'b00100000000000110000000000000111; // i
        insmemory[4] <= 32'b00000000110000110011000000000100; // r
        insmemory[5] <= 32'b00000000000000110001100001000010; // r
        insmemory[6] <= 32'b10001100100001011001101010111100; // i
        insmemory[7] <= 32'b00001000000100100011010001010110; // j
        pc <= 0;
        counter <= 0;
        icount <= 0;
        rcount <= 0;
        jcount <= 0;
        count3 <= 0;
        count4 <= 0;
        count5 <= 0;
        count6 <= 0;
    end

endmodule