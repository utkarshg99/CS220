module booth(clk, inp, mtpr, mtpd, done, adds, subs, prod);

    input clk;
    input inp;
    input [31:0] mtpr;
    input [31:0] mtpd;

    output reg done;
    output reg [5:0] adds;
    output reg [5:0] subs;
    output reg [63:0] prod;

    reg [63:0] multiplier;
    reg [63:0] multiplicand;
    reg [63:0] tmp;
    reg [5:0] pos;
    reg k;

    initial begin
        done <= 1;
    end

    always @(posedge clk) begin
        if (inp == 1) begin
            multiplier <= $signed(mtpr);
            multiplicand <= $signed(mtpd);
            adds <= 0;
            subs <= 0;
            prod <= 0;
            done <= 0;
            pos <= 0;
        end
        else if (pos < 32) begin
            tmp = $signed(multiplicand << pos);
            if (pos == 0 && multiplier[pos] == 1) begin
                subs = subs + 1;
                prod = prod - tmp;
            end
            else if (pos != 0) begin
                if (multiplier[pos-1] == 1 && multiplier[pos] == 0) begin
                    adds = adds + 1;
                    prod = prod + tmp;
                end
                else if (multiplier[pos] == 1 && multiplier[pos-1] == 0) begin
                    subs = subs + 1;
                    prod = prod - tmp;
                end
            end
            for (k = multiplier[pos]; multiplier[pos] == k && pos < 32; pos++);
            if (pos == 32) done <= 1;
        end
    end

endmodule