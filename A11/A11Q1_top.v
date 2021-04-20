module test;

    reg clk;
    reg inp;
    reg [31:0] mtpr;
    reg [31:0] mtpd;

    wire done;
    wire [5:0] adds;
    wire [5:0] subs;
    wire [63:0] prod;

    reg [3:0] ptr;
    reg [31:0] multiplicands [0:9];
    reg [31:0] multipliers [0:9];

    booth uut(clk, inp, mtpr, mtpd, done, adds, subs, prod);

    initial begin
        ptr <= 0;
        multiplicands[0] <= 10;
        multipliers[0] <= 3;
        multiplicands[1] <= 100;
        multipliers[1] <= 25;
        multiplicands[2] <= -10;
        multipliers[2] <= -9;
        multiplicands[3] <= -1009;
        multipliers[3] <= 7;
        multiplicands[4] <= 36;
        multipliers[4] <= 3;
        multiplicands[5] <= 93216134;
        multipliers[5] <= 781649;
        multiplicands[6] <= 16384;
        multipliers[6] <= 4;
        multiplicands[7] <= 71924821;
        multipliers[7] <= -651892;
        multiplicands[8] <= 91;
        multipliers[8] <= 17;
        multiplicands[9] <= -180836;
        multipliers[9] <= -777;
    end

    always @(negedge clk) begin
        if (done == 1) begin
            if (ptr!=0) $display("Multiplicand: %d, Multiplier: %d, Product: %d, Additions: %d, Substractions: %d", $signed(mtpd), $signed(mtpr), $signed(prod), adds, subs);
            ptr <= ptr + 1;
            inp <= 1;
            mtpd <= multiplicands[ptr];
            mtpr <= multipliers[ptr];
        end
        else begin
            inp <= 0;
        end
        if (ptr > 10) $finish;
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

endmodule