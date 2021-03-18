module processor(clk, instr, read1, read2, write, writed, readd1, readd2, done);

input clk;
input [2:0] instr;
input [4:0] read1; // read address 1
input [4:0] read2; // read address 2
input [4:0] write; // write address
input [15:0] writed; // data to be written

output reg [15:0] readd1; // data to be returned (1) to top module
output reg [15:0] readd2; // data to be returned (2) to top module
output reg done=0;

reg [4:0] cyc=0; // Count Number of cycles passed
reg [1:0] stp=0; // Store what stage of instruction we are at
reg [2:0] ops; // MSB to LSB: (Use Read Port 1, Use Read Port 2, Use Write Port)
reg [15:0] local;
wire [15:0] readt1; // output 1 from register file
wire [15:0] readt2; // output 2 from register file
wire dne; // done signal from register file module

interface uut(clk, ops, read1, read2, write, local, readt1, readt2, dne);

always @(posedge dne) begin
    stp<=stp+1;
end

always @(negedge clk) begin
    done<=0;
    readd1=readt1;
    readd2=readt2;
    if (instr == 0) begin
        if(stp == 0) begin
            local=writed;
            ops<=3'b001;
        end
        else begin
            stp<=0;
            done=1;
        end
    end
    else if (instr == 1) begin
        if(stp == 0) ops<=3'b100;
        else begin
            stp<=0;
            done=1;
        end
    end
    else if (instr == 2) begin
        if(stp == 0) ops<=3'b110;
        else begin
            stp<=0;
            done=1;
        end
    end
    else if (instr == 3) begin
        if(stp == 0) begin
            local=writed;
            ops<=3'b101;
        end
        else begin
            stp<=0;
            done=1;
        end
    end
    else if (instr == 4) begin
        if(stp == 0) begin
            local=writed;
            ops<=3'b111;
        end
        else begin
            stp<=0;
            done=1;
        end
    end
    else if (instr == 5) begin
        if(stp == 0) ops<=3'b110;
        else if(stp == 1) begin
            ops<=3'b000;
            if(cyc == 16) begin
                stp<=stp+1;
                cyc<=0;
            end
            else cyc = cyc+1;
            local<=readt1+readt2;
        end
        else if(stp == 2) ops<=3'b001;
        if(stp == 3) begin
            stp<=0;
            readd1=local;
            done=1;
        end
    end
    else if (instr == 6) begin
        if(stp == 0) ops<=3'b110;
        else if(stp == 1) begin
            ops<=3'b000;
            if(cyc == 16) begin
                stp<=stp+1;
                cyc<=0;
            end
            else cyc = cyc+1;
            local<=readt1-readt2;
        end
        else if(stp == 2) ops<=3'b001;
        if(stp == 3) begin
            stp<=0;
            readd1=local;
            done=1;
        end
    end
    else if (instr == 7) begin
        if(stp == 0) ops<=3'b100;
        else if(stp == 1) begin
            ops<=3'b000;
            if(cyc == 16) begin
                stp<=stp+1;
                cyc<=0;
            end
            else cyc = cyc+1;
            local<=readt1<<writed;
        end
        else if(stp == 2) begin
            ops<=3'b001;
        end
        if(stp == 3) begin
            stp<=0;
            readd1=local;
            done=1;
        end
    end
end

endmodule