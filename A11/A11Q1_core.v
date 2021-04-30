module booth(clk, inp, mtpr, mtpd, done, adds, subs, prod);

    input clk;
    input inp;
    input [31:0] mtpr;
    input [31:0] mtpd;

    output reg done;
    output reg [5:0] adds;
    output reg [5:0] subs;
    output reg [63:0] prod;

    reg signed [63:0] multiplier;
    reg signed [63:0] multiplicand;
    reg [63:0] tmp = 64'b1111111111111111111111111111111111111111111111111111111111111111;
    reg [5:0] pos;
    reg k;

    initial begin
        done <= 1;
    end

    always @(posedge clk) begin
        if (inp == 1) begin
            multiplier <= $signed(mtpr << 1);
            multiplicand <= $signed(mtpd);
            adds <= 0;
            subs <= 0;
            prod <= 0;
            done <= 0;
            pos <= 0;
        end
        else if (pos < 32) begin
            if (multiplier[0] == 1 && multiplier[1] == 0) begin
                adds = adds + 1;
                prod = prod + multiplicand;
            end
            else if (multiplier[1] == 1 && multiplier[0] == 0) begin
                subs = subs + 1;
                prod = prod - multiplicand;
            end
            pos <= pos+1;
            multiplier = multiplier >>> 1;
            multiplicand = multiplicand << 1;
            k = multiplier[0];
            if ((k == 0 && multiplier == 0) || (k == 1 && multiplier == tmp)) begin
                done <= 1;
                pos <= 32;
            end
        end
    end

endmodule