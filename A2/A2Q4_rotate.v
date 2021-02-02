module rotate(clk, y);

input  clk; output reg [3:0] y=8;

reg [15:0] count = 16'b0;

always @(posedge clk) begin
    // Counting the number of clock cycles
    count <= count + 16'b1;
  if (count==25000) begin
    // Cycling bits at every 25000 clock cycles
    count<= 16'b1;
    y[3] <= y[2];
    y[2] <= y[1];
    y[1] <= y[0];
    y[0] <= y[3];
  end
  end
endmodule