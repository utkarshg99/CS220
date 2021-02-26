module test;

    reg clk;
    reg [1:0] inp;
    wire [3:0] state;
    
    reg [3:0] cycles=0;

    fsm uut(inp,clk,state);

    always @(posedge clk) begin
        $display("Current State: %d, New Input: %d, Time: %d", state, inp, $time);
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

    initial begin
        #3;
        inp<=0; // Next State: 1
        #10;
        inp<=1; // Next State: 2
        #10;
        inp<=2; // Next State: 3
        #10;
        inp<=3; // Next State: 6
        #10;
        inp<=2; // Next State: 7
        #10;
        inp<=1; // Next State: 8
        #10;
        inp<=0; // Next State: 9
        #10;
        inp<=1; // Next State: 10
        #10;
        inp<=2; // Next State: 12
        #10;
        inp<=3; // Next State: 0
    end

    initial begin
        for(cycles=0; cycles<10; cycles=cycles+1) begin
            #10;
        end
        $finish;
    end

endmodule