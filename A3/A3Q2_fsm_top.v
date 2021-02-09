module test;
  reg x; reg clk; wire y; 
  fsm uut(clk,x,y);

always @(negedge clk) begin
  $display("x: %b, time: %d, Y: %b \n", x, $time, y);
end

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
    #3
    x=0;
    #10
    x=1;
    #10
    x=0;
    #10
    x=1;
    #10
    x=0;
    #10
    x=1;
    #10
    x=1;
    #10
    x=1;
    #10
    x=0;
    #10
    x=1;
end

initial begin
       #110;
       $finish;
   end

endmodule