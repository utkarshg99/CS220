module fsm(clk, x, y);
input clk, x;
output wire y;
reg [2:0] state;

parameter [2:0] start = 3'b000, s0 = 3'b001, s1 = 3'b010, t1 = 3'b100, t0 = 3'b011, reject = 3'b101;

always @ (posedge clk)
case (state)
start: if(x==0) state<=s0; 
else state<=s1;
s0: if(x==1) state<=s1; 
else state<=reject;
s1: if(x==0) state<=s0; 
else state<=reject;
t0: if(x==0) state<=t1; 
else state<=reject;
t1: if(x==0) state<=reject; 
else state<=t0;
reject: state<=reject;
default: state<=start;
endcase

assign y = ~state[0]|state[1]|~state[2];

endmodule