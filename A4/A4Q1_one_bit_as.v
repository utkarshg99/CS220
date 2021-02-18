module one_bit_as (a, b, cin, opcode, sum, cout);

   input a;
   input b;
   input cin;
   input opcode;

   output sum;
   wire sum;
   output cout;
   wire cout;

   assign bd=opcode^b;
   assign sum=a^bd^cin;
   assign cout=((a&bd) | (bd&cin) | (a&cin));

endmodule
