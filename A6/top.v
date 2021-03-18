module test;

    reg clk;
    reg [2:0] instr;
    reg [4:0] read1;
    reg [4:0] read2;
    reg [4:0] write;
    reg [15:0] writed;
    reg [33:0] pc [0:8];
    reg [33:0] pcr;
    reg [5:0] counter = 0;

    wire [15:0] readd1;
    wire [15:0] readd2;
    wire done;

    processor uut(clk, instr, read1, read2, write, writed, readd1, readd2, done);

    always @(posedge done) begin
        if (instr == 1 || instr == 3) begin
            $display("%d %d read from $%d", $time, $signed(readd1), read1);
        end
        else if (instr == 2 || instr == 4) begin
            $display("%d %d read from $%d and %d read from $%d", $time, $signed(readd1), read1, $signed(readd2), read2);
        end
        else if (instr == 5 || instr == 6 || instr == 7) begin
            $display("%d %d written to $%d", $time, $signed(readd1), write);
        end
        else begin
            $display("%d", $time);
        end
        counter=counter+1;
        pcr=pc[counter];
        instr<=pcr[33:31];
        read1<=pcr[30:26];
        read2<=pcr[25:21];
        write<=pcr[20:16];
        writed<=pcr[15:0];
    end

    initial begin 
        forever begin
            clk=0;
            #5
            clk=1;
            #5
            clk=0;
        end
    end

    initial begin
        // pcr structure: instr(3) | read1(5) | read2(5) | write(5) | writed(16) = 34 bits
        pc[0] = 34'b0000000000000000010000000000010001;
        pc[1] = 34'b0110000100000000101111111111110111;
        pc[2] = 34'b1000000100010000110000000001000001;
        pc[3] = 34'b0100001000011000000000000000000000;
        pc[4] = 34'b1110001100000001010000000000000011;
        pc[5] = 34'b1010000100010001000000000000000000;
        pc[6] = 34'b1110010000000001000000000000000111;
        pc[7] = 34'b1100010100100001100000000000000000;
        pc[8] = 34'b0010011000000000000000000000000000;
        pcr=pc[counter];
        instr<=pcr[33:31];
        read1<=pcr[30:26];
        read2<=pcr[25:21];
        write<=pcr[20:16];
        writed<=pcr[15:0];
    end

    always @(posedge clk) begin
        if(counter == 9) $finish;
    end

endmodule