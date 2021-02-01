module priority_encoder_top;

reg [7:0] X;

wire[2:0] Y;

priority_encoder ENCODER(X,Y);

always @ (X or Y) begin
       $display("time: %d, X: %b, Y: %b",$time, X, Y);
   end

initial begin
    #1
    $display("\n");
    X = 10010000;
    #1
    $display("\n");
    X = 10000001;
    #1
    $display("\n");
    X = 10010010;
    #1
    $display("\n");
    X = 10010100;
    #1
    $display("\n");
    X = 10011000;
    #1
    $display("\n");
    X = 10100000;
    #1
    $display("\n");
    X = 01000000;
    #1
    $display("\n");
    X = 10000000;
    #1
    $display("\n");
    X = 00010001;
    #1
    $display("\n");
    X = 00010010;
   end

   initial begin
       #11
       $finish;
   end

endmodule
