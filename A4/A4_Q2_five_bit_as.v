module five_bit_as (x, y, opcode, sum, carry_out, overflow);

   input [4:0] x;
   input [4:0] y;
   input opcode;

   output [4:0] sum;
   wire [4:0] sum;
   output carry_out;
   wire carry_out;
   output overflow;
   wire overflow;

   wire [3:0] intermediate_carry;//needed for storing the carry out of adding the bits to the right of MSB

   one_bit_as FA0 (x[0], y[0], opcode, opcode, sum[0], intermediate_carry[0]);
   one_bit_as FA1 (x[1], y[1], intermediate_carry[0], opcode, sum[1], intermediate_carry[1]);
   one_bit_as FA2 (x[2], y[2], intermediate_carry[1], opcode, sum[2], intermediate_carry[2]);
   one_bit_as FA3 (x[3], y[3], intermediate_carry[2], opcode, sum[3], intermediate_carry[3]);
   one_bit_as FA4 (x[4], y[4], intermediate_carry[3], opcode, sum[4], carry_out);
   
   assign overflow = carry_out^intermediate_carry[3];

endmodule
