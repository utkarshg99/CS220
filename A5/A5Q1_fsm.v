module fsm(inp, clk, state);

input clk;
input [1:0] inp;

output reg [3:0] state;

reg [2:0] microrom [0:12];
reg [3:0] dispatch [0:1] [0:3];

reg [2:0] mval;

initial begin

state<= 0;
microrom[0]<=0;
microrom[1]<=0;
microrom[2]<=0;
microrom[3]<=1;
microrom[4]<=2;
microrom[5]<=2;
microrom[6]<=2;
microrom[7]<=0;
microrom[8]<=0;
microrom[9]<=0;
microrom[10]<=3;
microrom[11]<=4;
microrom[12]<=4;
dispatch[0][0]<=4;
dispatch[0][1]<=5;
dispatch[0][2]<=6;
dispatch[0][3]<=6;
dispatch[1][0]<=11;
dispatch[1][1]<=12;
dispatch[1][2]<=12;
dispatch[1][3]<=12;

end

always @(posedge clk) begin
    mval=microrom[state];
    if(mval == 1) begin
        state <= #2 dispatch[0][inp];
    end
    else if(mval == 2) begin
        state <= #2 7;
    end
    else if(mval == 3) begin
        state <= #2 dispatch[1][inp];
    end
    else if(mval == 4) begin
        state <= #2 0;
    end
    else begin
        state <= #2 state+1;
    end
end

endmodule