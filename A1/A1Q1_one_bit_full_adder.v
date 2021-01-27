module one_bit_full_adder (a, b, cin, sum, cout);

   input a;
   input b;
   input cin;

   output sum;
   wire sum;
   output cout;
   wire cout;

   assign sum=a^b^cin;//^ denotes XOR
   assign cout=((a&b) | (b&cin) | (a&cin));// if any two of a, b, cin are 1 then cout is 1

endmodule
