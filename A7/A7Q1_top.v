module test;

    reg clk;

    wire [2:0] icount;
    wire [2:0] rcount;
    wire [2:0] jcount;
    wire [2:0] count3;
    wire [2:0] count4;
    wire [2:0] count5;
    wire [2:0] count6;
    wire done;

    insmem uut(clk, done, icount, rcount, jcount, count3, count4, count5, count6);

    always @(done) begin
        $display("R-instructions: %d, I-instructions: %d, J-instructions: %d", rcount, icount, jcount);
        $display("$3 was written to: %d times", count3);
        $display("$4 was written to: %d times", count4);
        $display("$5 was written to: %d times", count5);
        $display("$6 was written to: %d times", count6);
        #1;
        $finish;
    end

    initial begin 
        forever begin
            clk=0;
            #5
            clk=1;
            #5
            clk=0;
        end
    end

endmodule