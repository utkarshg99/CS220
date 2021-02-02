module decoder3to8(i, o);

input [2:0] i;
output [7:0] o;
wire [7:0] o;

// SoP Combinational Logic
assign o[0] = ~i[2] & ~i[1] & ~i[0];
assign o[1] = ~i[2] & ~i[1] & i[0];
assign o[2] = ~i[2] & i[1] & ~i[0];
assign o[3] = ~i[2] & i[1] & i[0];
assign o[4] = i[2] & ~i[1] & ~i[0];
assign o[5] = i[2] & ~i[1] & i[0];
assign o[6] = i[2] & i[1] & ~i[0];
assign o[7] = i[2] & i[1] & i[0];

endmodule