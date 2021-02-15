module grid(direction, steps, clk, outx, outy);

// 00 is east, 01 is west, 10 is north and 11 is south

input clk;
input [1:0] direction;
input [1:0] steps;

output reg [4:0] outx;
output reg [4:0] outy;

reg [4:0] a;
reg [4:0] b;
reg opcode;
wire carry;
wire [4:0] out;
wire over;

initial begin

outx = 0;
outy = 0;

end

five_bit_as AS(a, b, opcode, out, carry, over);

always @(posedge clk) begin
    if(direction==0) begin
        b<=steps;
        opcode<=0;
        a=outx;
        #1;
        if(out[4]==1) begin
            outx=15;
        end
        else begin
            outx=out;
        end
    end
    else if(direction==1) begin
        b<=steps;
        opcode<=1;
        a=outx;
        #1;
        if(carry==0) begin
            outx=0;
        end
        else begin
            outx=out;
        end
    end
    else if(direction==2) begin
        b<=steps;
        opcode<=0;
        a=outy;
        #1;
        if(out[4]==1) begin
            outy=15;
        end
        else begin
            outy=out;
        end
    end
    else if(direction==3) begin
        b<=steps;
        opcode<=1;
        a=outy;
        #1;
        if(carry==0) begin
            outy=0;
        end
        else begin
            outy=out;
        end
    end
end

endmodule