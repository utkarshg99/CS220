module priority_encoder(x, y);

input [7:0] x;
output[2:0] y;
wire [2:0] y;

assign y = (x[0] ==1'b1 ) ? 3'b000:
               (x[1] ==1'b1 ) ? 3'b001:
               (x[2] ==1'b1 ) ? 3'b010:
               (x[3] ==1'b1) ? 3'b011:
               (x[4] ==1'b1) ? 3'b100:
               (x[5] ==1'b1) ? 3'b101:
               (x[6] ==1'b1) ? 3'b110:3'b111;

endmodule
