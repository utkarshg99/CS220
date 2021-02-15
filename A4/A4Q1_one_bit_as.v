module one_bit_as (a, b, cin, opcode, sum, cout);

   input a;
   input b;
   input cin;
   input opcode;

   output sum;
   wire sum;
   output cout;
   wire cout;

   assign sum=a^(opcode^b)^cin;
   assign cout=((a&(opcode^b)) | ((opcode^b)&cin) | (a&cin));

endmodule
