module nonrestdiv(clk, inp, dvd, dvs, ldivdnd, ldivsr, done, adds, subs, quo, rem);

    input clk;
    input inp;
    input [31:0] dvd;
    input [31:0] dvs;
    input [4:0] ldivdnd;
    input [4:0] ldivsr;

    output reg done;
    output reg [5:0] adds;
    output reg [5:0] subs;
    output reg [31:0] quo;
    output reg [31:0] rem;

    reg [31:0] dividend;
    reg [31:0] divisor;
    reg [5:0] itrs;

    initial begin
        done <= 1;
    end

    always @(posedge clk) begin
        if (inp == 1) begin
            dividend <= dvd;
            divisor <= dvs << (ldivdnd - ldivsr);
            itrs <= ldivdnd - ldivsr + 1;
            rem <= dvd;
            quo <= 0;
            adds <= 0;
            subs <= 0;
            done <= 0;
        end
        else if (itrs > 0) begin
            if ($signed(rem) < 0) begin
                rem = rem + divisor;
                quo = quo ^ 1;
                adds <= adds + 1;
            end
            else begin
                rem = rem - divisor;
                subs <= subs + 1;
            end
            quo = (quo << 1) | 1'b1;
            divisor <= divisor >> 1;
            itrs = itrs - 1;
            if (itrs == 0) begin
                if ($signed(rem) < 0) begin
                    rem = rem + divisor;
                    quo = quo ^ 1;
                    adds = adds + 1;
                end
                done = 1;
            end
        end
    end

endmodule