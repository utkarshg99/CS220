module test;
  reg[1:0] steps;
  reg[1:0] direction;
  reg clk;
  wire[4:0] outx;
  wire[4:0] outy;
  grid uut(direction, steps, clk, outx, outy);

  reg[3:0] total;

// always @() begin
    // $display("Input Row: %d, Input Bit: %b, Time: %d, Output: %b \n", inp, inpb, $time, out);
// end

initial begin 
  forever begin
      clk=0;
      #5
      clk=1;
      #5
      clk=0;
  end
end

initial begin
    #3;
    steps<=2;
    direction<=1; // 0,0 
    #10;
    $display("X: %d, Y: %d, Steps: %d, Direction: %d", outx, outy, steps, direction);
    steps<=3;
    direction<=0; // 3,0
    #10;
    $display("X: %d, Y: %d, Steps: %d, Direction: %d", outx, outy, steps, direction);
    steps<=1;
    direction<=2; // 3,1
    #10;
    $display("X: %d, Y: %d, Steps: %d, Direction: %d", outx, outy, steps, direction);
    steps<=3;
    direction<=0; // 6,1 
    #10;
    $display("X: %d, Y: %d, Steps: %d, Direction: %d", outx, outy, steps, direction);
    steps<=3;
    direction<=3; // 6,0 
    #10;
    $display("X: %d, Y: %d, Steps: %d, Direction: %d", outx, outy, steps, direction);
    steps<=3;
    direction<=0; // 9,0 
    #10;
    $display("X: %d, Y: %d, Steps: %d, Direction: %d", outx, outy, steps, direction);
    steps<=3;
    direction<=0; // 12,0 
    #10;
    $display("X: %d, Y: %d, Steps: %d, Direction: %d", outx, outy, steps, direction);
    steps<=3;
    direction<=0; // 15,0 
    #10;
    $display("X: %d, Y: %d, Steps: %d, Direction: %d", outx, outy, steps, direction);
    steps<=2;
    direction<=0; // 15,0 
    #10;
    $display("X: %d, Y: %d, Steps: %d, Direction: %d", outx, outy, steps, direction);
end

initial begin
       #100;
       $finish;
   end

endmodule