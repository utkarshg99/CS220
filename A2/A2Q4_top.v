module M_top;

reg clk;
wire [3:0] Y;
reg [19:0] count=0;

rotate uut(clk,Y);

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

always @(posedge clk) begin
    count <= count + 20'b1;
    if (count==310000) $finish;
end

endmodule