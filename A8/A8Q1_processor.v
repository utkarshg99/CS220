module processor(clk, done, outv);

    input clk;

    output reg done;
    output reg [7:0] outv;

    reg [2:0] state;
    reg [3:0] counter;
    reg [3:0] dcounter;
    reg [31:0] instruction;

    reg [7:0] regfl [0:31];
    reg [5:0] opcode;
    reg [4:0] rs;
    reg [4:0] rt;
    reg [4:0] rd;
    reg [4:0] sh;
    reg [5:0] fn;
    reg [15:0] imm;
    reg [25:0] jimm;
    reg [7:0] src1;
    reg [7:0] src2;
    reg [7:0] tmp;
    reg inv;
    reg [4:0] MAX_PC;
    reg [4:0] OUTPUT_REG;

    wire [31:0] outins;
    wire [7:0] outdat;
    
    insmem uut(clk, counter, outins);
    datamem uut2(clk, dcounter, outdat);

    initial begin
        done <= 0;
        state <= 0;
        counter <= 12;
        dcounter <= 0;
        regfl[0] <= 0;
        MAX_PC <= 14;
        OUTPUT_REG <= 2;
        regfl[0] <= 0;
        regfl[1] <= 0;
        regfl[2] <= 0;
        regfl[3] <= 0;
        regfl[4] <= 0;
        regfl[5] <= 0;
        regfl[6] <= 0;
        regfl[7] <= 0;
        regfl[8] <= 0;
        regfl[9] <= 0;
        regfl[10] <= 0;
        regfl[11] <= 0;
        regfl[12] <= 0;
        regfl[13] <= 0;
        regfl[14] <= 0;
        regfl[15] <= 0;
        regfl[16] <= 0;
        regfl[17] <= 0;
        regfl[18] <= 0;
        regfl[19] <= 0;
        regfl[20] <= 0;
        regfl[21] <= 0;
        regfl[22] <= 0;
        regfl[23] <= 0;
        regfl[24] <= 0;
        regfl[25] <= 0;
        regfl[26] <= 0;
        regfl[27] <= 0;
        regfl[28] <= 0;
        regfl[29] <= 0;
        regfl[30] <= 0;
        regfl[31] <= 0;
    end

    always @(posedge clk) begin
        if (state == 0) begin
            instruction <= outins;
            state <= 1;
        end
        else if (state == 1) begin
            opcode = instruction[31:26];
            if(opcode == 0) begin
                rs <= instruction[25:21];
                rt <= instruction[20:16];
                rd <= instruction[15:11];
                sh <= instruction[10:6];
                fn <= instruction[5:0];
            end
            else if(opcode == 3) begin
                jimm <= instruction[7:0];
            end
            else begin
                rs <= instruction[25:21];
                rt <= instruction[20:16];
                imm <= instruction[7:0];
            end
            state <= 2;
        end
        else if(state == 2) begin
            src1 <= regfl[rs];
            src2 <= regfl[rt];
            state <= 3;
            inv <= 0;
        end
        else if (state == 3) begin
            if (opcode == 0) begin
                if (fn == 33) begin
                    tmp<=src1+src2;
                    counter <= counter+1;
                end
                else if (fn == 42) begin
                    if ($signed(src1) < $signed(src2)) tmp <= 1;
                    else tmp <= 0;
                    counter <= counter+1;
                end
                else if (fn == 8) begin
                    counter <= src1;
                end
            end
            else if (opcode == 3) begin
                regfl[31] <= counter+1;
                counter <= jimm;
            end
            else if (opcode == 4) begin
                if (src1 == src2) counter <= counter+$signed(imm);
                else counter <= counter+1;
            end
            else if (opcode == 5) begin
                if (src1 != src2) counter <= counter+$signed(imm);
                else counter <= counter+1;
            end
            else if (opcode == 9) begin
                tmp<=src1+$signed(imm);
                counter <= counter+1;
            end
            else if (opcode == 35) begin
                dcounter <= imm+src1;
                counter <= counter+1;
            end
            else begin
                inv <= 1;
                counter <= counter+1;
            end
            state = 4;
        end
        else if (state == 4) begin
            if (opcode == 35) begin
                tmp <= outdat;
            end
            state <= 5;
        end
        else if (state == 5) begin
            if (inv == 0 && ((opcode == 0 && rd != 0) || (opcode != 0 && rt != 0))) begin
                if (opcode == 0 && (fn == 42 || fn == 33)) regfl[rd] <= tmp;
                else if (opcode == 9 || opcode == 35) regfl[rt] <= tmp;
            end
            if (counter == MAX_PC) state <= 6;
            else state <= 0;
        end
        else begin
            outv = regfl[OUTPUT_REG];
            done = 1;
        end
    end

endmodule