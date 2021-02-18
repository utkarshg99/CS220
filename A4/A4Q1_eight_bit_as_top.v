module eight_bit_as_top;

   reg signed [7:0] A; // took signed to ease display
   reg signed [7:0] B; // took signed to ease display
   reg Opcode;

   reg out;

   wire signed [7:0] Sum; // took signed to ease display
   wire Carry;
   wire Overflow;

   eight_bit_as AS (A, B, Opcode, Sum, Carry, Overflow);

   always @ (posedge out) begin
       $display("A: %b (%d), B: %b (%d), Opcode: %b, Result: %b (%d), Carry: %b, Overflow: %b", A, A, B, B, Opcode, Sum, Sum, Carry, Overflow);
   end

   initial begin
      A <= 8'b01111111; B <= 8'b01111000; Opcode <= 1; // 7
      out=1'b0;
      #1;
      out=1'b1;
      A <= 8'b01111000; B <= 8'b01111111; Opcode <= 1; // -7
      out=1'b0;
      #1;
      out=1'b1;
      A <= 8'b01111111; B <= 8'b01111111; Opcode <= 1; // 0
      out=1'b0;
      #1;
      out=1'b1;
      A <= 8'b01111111; B <= 8'b00000000; Opcode <= 1; // 127
      out=1'b0;
      #1;
      out=1'b1;
      A <= 8'b00000000; B <= 8'b01111111; Opcode <= 1; // -127
      out=1'b0;
      #1;
      out=1'b1;
      A <= 8'b11100111; B <= 8'b00110111; Opcode <= 1; // -80
      out=1'b0;
      #1;
      out=1'b1;
      A <= 8'b00100011; B <= 8'b10111111; Opcode <= 0; // -30
      out=1'b0;
      #1;
      out=1'b1;
      A <= 8'b11011101; B <= 8'b10111111; Opcode <= 0; // -100
      out=1'b0;
      #1;
      out=1'b1;
      A <= 8'b00000101; B <= 8'b00011001; Opcode <= 0; // 30
      out=1'b0;
      #1;
      out=1'b1;
      A <= 8'b00101101; B <= 8'b11011101; Opcode <= 0; // 10
      out=1'b0;
      #1;
      out=1'b1;
   end

   initial begin
       #10;
       $finish;
   end

endmodule