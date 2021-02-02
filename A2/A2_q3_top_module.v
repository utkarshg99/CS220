module M_top;

reg clk;
wire Y;

M uut(clk,Y);

always @ (Y) begin
       $display("time: %d, Y: %b \n",$time, Y);
   end

initial begin 
    forever begin
        clk=1;
        #5
        clk=0;
        #5
        clk=1;
    end
end

initial begin
       #3100000;
       $finish;
   end

endmodule