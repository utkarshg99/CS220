module one_bit_comparator (a, b, l, e, g);

   input a;
   input b;
   
   output l;//stores the value 1 if bit a<b
   wire l;
   output e;//stores the value 1 if bit a=b
   wire e;
   output g;//stores the value 1 if bit a>b
   wire g;

   assign l = ~a & b;
   assign e = (a & b) | (~a & ~b);
   assign g = a & ~b;

endmodule
