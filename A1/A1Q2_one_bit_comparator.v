module one_bit_comparator (a, b, l, e, g);

   input a;
   input b;
   
   output l;
   wire l;
   output e;
   wire e;
   output g;
   wire g;

   assign l = ~a & b;
   assign e = (a & b) | (~a & ~b);
   assign g = a & ~b;

endmodule
