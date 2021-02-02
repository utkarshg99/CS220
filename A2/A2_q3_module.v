module M(clk, y);

input  clk; output reg y=1'b0;


reg [15:0] count = 16'b0;

always @(posedge clk) begin
    count <= count + 16'b1;
  if ((y==1)&&(count==25000)) begin
    count <= 16'b1;
    y  <=   0;
  end
else if((y == 0)&&(count == 25000)) begin
    y  <= 1;
    count <= 16'b1;
end
  end
endmodule