module M(clk, y);

input  clk; output reg [3:0] y=4'b1;


reg [15:0] count = 16'b0;

always @(posedge clk) begin
    count <= count + 16'b1;
  if ((y==4'b1)&&(count==25000)) begin
    count <= 16'b1;
    y  <=   2;
  end
else if((y == 2)&&(count == 25000)) begin
    y  <= 4;
    count <= 16'b1;
end
else if((y == 4)&&(count == 25000)) begin
    y  <= 8;
    count <= 16'b1;
end
else if((y == 8)&&(count == 25000)) begin
    y  <= 1;
    count <= 16'b1;
end
  end
endmodule