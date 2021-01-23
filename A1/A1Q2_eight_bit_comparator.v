module eight_bit_comparator (x, y, l, e, g);

   input [7:0] x;
   input [7:0] y;

   output l;
   wire l;
   output e;
   wire e;
   output g;
   wire g;

   wire [7:0] il, ie, ig;
   wire [5:0] ied;

   one_bit_comparator CA0 (x[7], y[7], il[0], ie[0], ig[0]);
   one_bit_comparator CA1 (x[6], y[6], il[1], ie[1], ig[1]);
   one_bit_comparator CA2 (x[5], y[5], il[2], ie[2], ig[2]);
   one_bit_comparator CA3 (x[4], y[4], il[3], ie[3], ig[3]);
   one_bit_comparator CA4 (x[3], y[3], il[4], ie[4], ig[4]);
   one_bit_comparator CA5 (x[2], y[2], il[5], ie[5], ig[5]);
   one_bit_comparator CA6 (x[1], y[1], il[6], ie[6], ig[6]);
   one_bit_comparator CA7 (x[0], y[0], il[7], ie[7], ig[7]);
   assign ied[0] = ie[0] & ie[1];
   assign ied[1] = ie[0] & ie[1] & ie[2];
   assign ied[2] = ie[0] & ie[1] & ie[2] & ie[3];
   assign ied[3] = ie[0] & ie[1] & ie[2] & ie[3] & ie[4];
   assign ied[4] = ie[0] & ie[1] & ie[2] & ie[3] & ie[4] & ie[5];
   assign ied[5] = ie[0] & ie[1] & ie[2] & ie[3] & ie[4] & ie[5] & ie[6];
   assign l = (~ig[0] & il[0]) | (ie[0] & ~ig[1] & il[1]) | (ied[0] & ~ig[2] & il[2]) | (ied[1] & ~ig[3] & il[3]) | (ied[2] & ~ig[4] & il[4]) | (ied[3] & ~ig[5] & il[5]) | (ied[4] & ~ig[6] & il[6]) | (ied[5] & ~ig[7] & il[7]);
   assign e = ie[0] & ie[1] & ie[2] & ie[3] & ie[4] & ie[5] & ie[6] & ie[7];
   assign g = ~e & ~l;

endmodule