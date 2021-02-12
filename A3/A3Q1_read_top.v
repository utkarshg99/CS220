module test;
  reg[3:0] inp;
  reg inpb;
  reg clk;
  wire outb;
  wire[31:0] out;
  dram uut(clk,inpb,inp,outb,out);

  reg[3:0] total;

always @(posedge outb) begin
    $display("Input Row: %d, Input Bit: %b, Time: %d, Output: %b \n", inp, inpb, $time, out);
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
    inpb<=1; inp<=0;
    #10;
    inpb<=0;
    #10;
    inpb<=0;
    #10;
    inpb<=1; inp<=14;
    #10;
    inpb<=0;
    #10;
    inpb<=0;
    #10;
    inpb<=1; inp<=14;
    #10;
    inpb<=0;
    #10;
    inpb<=0;
    #10;
    inpb<=1; inp<=12;
    #10;
    inpb<=0;
    #10;
    inpb<=0;
    #10;
    inpb<=1; inp<=2;
    #10;
    inpb<=0;
    #10;
    inpb<=0;
    #10;
    inpb<=1; inp<=3;
    #10;
    inpb<=0;
    #10;
    inpb<=0;
    #10;
    inpb<=1; inp<=9;
    #10;
    inpb<=0;
    #10;
    inpb<=0;
    #10;
    inpb<=1; inp<=5;
    #10;
    inpb<=0;
    #10;
    inpb<=0;
    #10;
    inpb<=1; inp<=4;
    #10;
    inpb<=0;
    #10;
    inpb<=0;
    #10;
    inpb<=1; inp<=8;
    #10;
    inpb<=0;
    #10;
    inpb<=0;
end

initial begin
       #300;
       $finish;
   end

endmodule