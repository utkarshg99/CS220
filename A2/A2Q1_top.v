module decoder_encoder_top;

   reg [2:0] inp;
   wire [7:0] decoded;
   wire [2:0] encoded;

   decoder3to8 DECODER (inp, decoded);
   encoder8to3 ENCODER (decoded, encoded);

   always @ (inp or decoded or encoded) begin
       $display("Input: %d, Decoded: %b, Encoded: %b", inp, decoded, encoded);
   end

   initial begin
      inp = 0;
      #1
      $display("\n");
      inp = 1;
      #1
      $display("\n");
      inp = 2;
      #1
      $display("\n");
      inp = 3;
      #1
      $display("\n");
      inp = 4;
      #1
      $display("\n");
      inp = 5;
      #1
      $display("\n");
      inp = 6;
      #1
      $display("\n");
      inp = 7;
      #1
      $display("\n");
   end

   initial begin
       #10
       $finish;
   end

endmodule
