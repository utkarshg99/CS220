module dram(clk, input_valid, rno, output_bit, y);

input clk, input_valid;
input [3:0] rno;
output reg output_bit;
output reg [31:0] y;

reg [3:0]ropen;
reg [31:0] regfl [0:15];

initial begin
    
// ropen<=4'bx;
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
        if(ropen===rno) begin
            y<=regfl[ropen];
            output_bit<=1'b1;
        end
        else if(ropen===4'bx) begin
            output_bit<=1'b0;
            ropen<=rno;
            y<= #9 regfl[rno];
            output_bit<= #10 1'b1;
        end
        else begin
            output_bit<=1'b0;
            ropen<=rno;
            y<= #19 regfl[rno];
            output_bit<= #20 1'b1;
        end
    end
end

endmodule