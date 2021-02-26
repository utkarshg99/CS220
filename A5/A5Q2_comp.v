module comp(a, b, c, d, out);

input [2:0] a;
input [2:0] b;
input [2:0] c;
input [2:0] d;

output reg [1:0] out;

reg [2:0] tmp;

always @(a or b or c or d) begin
    tmp=a;
    out=0;
    if(tmp>b) begin
        tmp=b;
        out=1;
    end
    if(tmp>c) begin
        tmp=c;
        out=2;
    end
    if(tmp>d) begin
        tmp=d;
        out=3;
    end
end

endmodule