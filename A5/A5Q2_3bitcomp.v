module three_bit_comparator (x, y, less, equal, greater);

   input [2:0] x;
   input [2:0] y;

   output less;
   wire less;
   output equal;
   wire equal;
   output greater;
   wire greater;

   wire [1:0] intermediate_less;
   wire [1:0] intermediate_equal;
   wire [1:0] intermediate_greater;

   one_bit_comparator C2 (x[2], y[2], 1'b0, 1'b1, 1'b0, intermediate_less[1], intermediate_equal[1], intermediate_greater[1]);
   one_bit_comparator C1 (x[1], y[1], intermediate_less[1], intermediate_equal[1], intermediate_greater[1], intermediate_less[0], intermediate_equal[0], intermediate_greater[0]);
   one_bit_comparator C0 (x[0], y[0], intermediate_less[0], intermediate_equal[0], intermediate_greater[0], less, equal, greater);

endmodule
