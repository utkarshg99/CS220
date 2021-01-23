module eight_bit_comparator_top;

   reg [7:0] A;
   reg [7:0] B;

   wire l, e, g;

   eight_bit_comparator COMPARATOR (A, B, l, e, g);

   always @ (A or B or l or e or g) begin
       $display("A: %d, B: %d, Lt: %d, Eq: %d, Gt: %d", A, B, l, e, g);
   end

   initial begin
      A = 100; B = 100;
      #1
      $display("\n");
      A = 200; B = 200;
      #1
      $display("\n");
      A = 20; B = 200;
      #1
      $display("\n");
      A = 255; B = 0;
      #1
      $display("\n");
      A = 128; B = 127;
      #1
      $display("\n");
      A = 127; B = 128;
      #1
      $display("\n");
      A = 180; B = 150;
      #1
      $display("\n");
      A = 170; B = 55;
      #1
      $display("\n");
      A = 10; B = 20;
      #1
      $display("\n");
      A = 79; B = 80;
      #1
      $display("\n");
      A = 239; B = 29;
   end

   initial begin
       #10
       $finish;
   end

endmodule