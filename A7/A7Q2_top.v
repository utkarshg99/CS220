module test;

    reg clk;

    wire [7:0] outv;
    wire done;

    processor uut(clk, done, outv);

    always @(posedge done) begin
        $display("OUTPUT_REG has %d", outv);
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