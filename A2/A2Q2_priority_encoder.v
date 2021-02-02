module priority_encoder(x, y);

input [7:0] x;
output[2:0] y;
wire [2:0] y;

assign y = (x[0]==1'b1)?0:(x[1]==1'b1)?1:(x[2]==1'b1)?2:(x[3]==1'b1)?3:(x[4]==1'b1)?4:(x[5]==1'b1)?5:(x[6]==1'b1)?6:(x[7]==1'b1)?7:3'bx;

endmodule
