module one_bit_comparator (a, b, less_in, eq_in, greater_in, less_out, eq_out, greater_out);

   input a;
   input b;
   input less_in;
   input eq_in;
   input greater_in;

   output less_out;
   wire less_out;
   output eq_out;
   wire eq_out;
   output greater_out;
   wire greater_out;

   assign less_out = less_in | (eq_in & ~a & b);
   assign eq_out = eq_in & ((~a & ~b) | (a & b));
   assign greater_out = greater_in | (eq_in & a & ~b);

endmodule
