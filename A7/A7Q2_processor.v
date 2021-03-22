module processor(clk, done, outv);

    input clk;

    output reg done;
    output reg [7:0] outv;

    reg [2:0] state;
    reg [2:0] counter;
    reg [31:0] instruction;

    reg [7:0] regfl [0:31];
    reg [5:0] opcode;
    reg [4:0] rs;
    reg [4:0] rt;
    reg [4:0] rd;
    reg [4:0] sh;
    reg [5:0] fn;
    reg [15:0] imm;
    reg [7:0] src1;
    reg [7:0] src2;
    reg [7:0] x;
    reg [7:0] y;
    reg inv;
    reg opr;
    reg [2:0] MAX_PC;
    reg [2:0] OUTPUT_REG;

    wire [31:0] outins;
    wire [7:0] res;
    wire cout;
    wire overflow;
    
    insmem uut(clk, counter, outins);
    eight_bit_as uut2 (x, y, opr, res, cout, overflow);

    initial begin
        done = 0;
        state = 0;
        counter = 0;
        regfl[0] = 0;
        MAX_PC = 7;
        OUTPUT_REG = 5;
    end

    always @(posedge clk) begin
        if (state == 0) begin
            instruction <= outins;
            counter <= counter+1;
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
            else begin
                rs <= instruction[25:21];
                rd <= instruction[20:16];
                imm <= instruction[7:0];
            end
            state <= 2;
        end
        else if(state == 2) begin
            src1 <= regfl[rs];
            src2 <= regfl[rt];
            state <= 3;
        end
        else if (state == 3) begin
            if(opcode == 9 || (opcode == 0 && (fn == 33 || fn == 35))) begin
                if (opcode == 9) begin
                    x <= src1;
                    y <= imm;
                    opr <= 0;
                end
                else if(fn == 33) begin
                    x <= src1;
                    y <= src2;
                    opr <= 0;
                end
                else begin
                    x <= src1;
                    y <= src2;
                    opr <= 1;
                end
                inv <= 0;
            end
            else inv <= 1;
            state <= 4;
        end
        else if (state == 4) begin
            if (inv == 0 && rd != 0) begin
                regfl[rd] <= res;
            end
            if (counter == MAX_PC) state <= 5;
            else state <= 0;
        end
        else begin
            outv = regfl[OUTPUT_REG];
            done = 1;
        end
    end

endmodule