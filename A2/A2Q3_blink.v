module M(clk, y);

input  clk; 
output reg y=1'b0;

reg [15:0] count = 16'b0;

always @(posedge clk) begin
    // Counting the number of clock cycles
    count <= #1 count + 16'b1;
  if ((y==1)&&(count==25000)) begin
    // Reset the counter
    count <= #1 16'b1;
    // LED state change to OFF (Blink)
    y <= 0;
  end
else if((y==0)&&(count==25000)) begin
    // Reset the counter
    count <= #1 16'b1;
    // LED state change to ON (Blink)
    y <= 1;
end
  end
endmodule