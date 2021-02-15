module eight_bit_as_top;

   reg [7:0] A;
   reg [7:0] B;
   reg Opcode;

   reg [7:0] alpha = 8'b11111111;

   wire [7:0] Sum;
   wire Carry;
   wire Overflow;

   eight_bit_as AS (A, B, Opcode, Sum, Carry, Overflow);

   always @ (Sum or Carry or Overflow) begin
       if(Carry == 1'b1 & Opcode == 1'b1) begin 
        $display("A: %b, B: %b, Opcode: %d, Result: %b, Carry: %b, Overflow: %b, Decimal: -%d", A, B, Opcode, Sum, Carry, Overflow, Sum);
       end
    //    else if(Carry == 1'b0 & Opcode == 1'b1) begin 
    //     $display("A: %b, B: %b, Opcode: %d, Result: %b, Carry: %b, Overflow: %b, Decimal: %d", A, B, Opcode, Sum, Carry, Overflow, (alpha^Sum)+1);
    //    end
       else begin
        $display("A: %b, B: %b, Opcode: %d, Result: %b, Carry: %b, Overflow: %b, Decimal: %d", A, B, Opcode, Sum, Carry, Overflow, (alpha^Sum)+1);
       end
   end

   initial begin
      A <= (alpha^128)+1; B <= (alpha^129)+1; Opcode <= 1;
      #1
      $display("\n");
      A <= (alpha^129)+1; B <= (alpha^128)+1; Opcode <= 1;
      #1
      $display("\n");
      A <= (alpha^2)+1; B <= (alpha^2)+1; Opcode <= 1;
      #1
      $display("\n");
      A <= (alpha^35)+1; B <= (alpha^128)+1; Opcode <= 0;
      #1
      $display("\n");
      A <= (alpha^5)+1; B <= (alpha^25)+1; Opcode <= 1;
      #1
      $display("\n");
      A <= (alpha^25)+1; B <= (alpha^5)+1; Opcode <= 1;
      #1
      $display("\n");
      A <= (alpha^5)+1; B <= (alpha^25)+1; Opcode <= 0;
      #1
      $display("\n");
      A <= (alpha^255)+1; B <= (alpha^55)+1; Opcode <= 1;
      #1
      $display("\n");
      A <= (alpha^55)+1; B <= (alpha^255)+1; Opcode <= 1;
      #1
      $display("\n");
      A <= (alpha^255)+1; B <= (alpha^255)+1; Opcode <= 1;
   end

   initial begin
       #10
       $finish;
   end

endmodule