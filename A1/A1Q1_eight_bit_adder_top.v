module eight_bit_adder_top;

   reg [7:0] A;
   reg [7:0] B;
   reg Cin;

   wire [7:0] Sum;
   wire Carry;

   eight_bit_adder ADDER (A, B, Cin, Sum, Carry);

   always @ (A or B or Cin or Sum or Carry) begin
       $display("A: %d, B: %d, Cin: %d, Sum: %d, Carry: %d", A, B, Cin, Sum, Carry);
   end

   initial begin
      A = 100; B = 100; Cin = 1;
      #1
      $display("\n");
      A = 200; B = 200; Cin = 0;
      #1
      $display("\n");
      A = 20; B = 200; Cin = 0;
      #1
      $display("\n");
      A = 255; B = 0; Cin = 1;
      #1
      $display("\n");
      A = 128; B = 127; Cin = 0;
      #1
      $display("\n");
      A = 127; B = 128; Cin = 1;
      #1
      $display("\n");
      A = 180; B = 150; Cin = 0;
      #1
      $display("\n");
      A = 170; B = 55; Cin = 0;
      #1
      $display("\n");
      A = 10; B = 20; Cin = 1;
      #1
      $display("\n");
      A = 79; B = 80; Cin = 1;
      #1
      $display("\n");
      A = 239; B = 29; Cin = 0;
   end

   initial begin
       #10
       $finish;
   end

endmodule