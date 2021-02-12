module dram(clk, input_valid, rno, output_bit, y);

input clk, input_valid;
input [3:0] rno;
output reg output_bit;
output reg [31:0] y;

reg active=0;
reg [3:0] ropen;
reg [31:0] regfl [0:15];

reg [1:0] current=0;

initial begin

output_bit=1'b0;
regfl[0]<=0;
regfl[1]<=1;
regfl[2]<=2;
regfl[3]<=3;
regfl[4]<=4;
regfl[5]<=5;
regfl[6]<=6;
regfl[7]<=7;
regfl[8]<=8;
regfl[9]<=9;
regfl[10]<=10;
regfl[11]<=11;
regfl[12]<=12;
regfl[13]<=13;
regfl[14]<=14;
regfl[15]<=15;

end

always @(posedge clk) begin
    if(input_valid==1) begin
        output_bit<=1'b0;
        if(active==0) begin
            active<=1;
            ropen<=rno;
            y<=regfl[rno];
            current=1;
        end
        else if(ropen==rno) begin
            y<=regfl[ropen];
            current=0;
        end
        else begin
            ropen<=rno;
            y<=regfl[rno];
            current=2;
        end
    end
    if(current==0) begin
        output_bit<=1'b1;
    end
    else begin
        current<=current-1;
    end
end

endmodule