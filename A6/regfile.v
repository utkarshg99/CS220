module interface(clk, instr, read1, read2, write, writed, readd1, readd2, done);

input clk;
input [2:0] instr;
input [4:0] read1; // read address 1
input [4:0] read2; // read address 2
input [4:0] write; // write address
input [15:0] writed; // data to be written

output reg [15:0] readd1; // data from read1
output reg [15:0] readd2; // data from read2
output reg done=0;

reg [15:0] regfl [0:31];
reg [1:0] cyc=0;

always @(posedge clk) begin
    done<=0;
    cyc=cyc+1;
    if(cyc == 2) begin
        if(instr[2] == 1) readd1<=regfl[read1];
        if(instr[1] == 1) readd2<=regfl[read2];
        if(instr[0] == 1) regfl[write]<=writed;
        cyc<=0;
        if(instr != 0) done=1;
    end
end

endmodule