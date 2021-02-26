module test;

    reg [2:0] a;
    reg [2:0] b;
    reg [2:0] c;
    reg [2:0] d;
    wire [1:0] ind;

    comp uut(a, b, c, d, ind);

    initial begin
        a<=1; b<=2; c<=3; d<=4;
        #1;
        $display("Index: %d, Time: %d", ind, $time);
        a<=5; b<=6; c<=3; d<=4;
        #1;
        $display("Index: %d, Time: %d", ind, $time);
        a<=1; b<=2; c<=7; d<=0;
        #1;
        $display("Index: %d, Time: %d", ind, $time);
        a<=2; b<=4; c<=3; d<=7;
        #1;
        $display("Index: %d, Time: %d", ind, $time);
        a<=2; b<=4; c<=0; d<=6;
        #1;
        $display("Index: %d, Time: %d", ind, $time);
        a<=3; b<=5; c<=1; d<=7;
        #1;
        $display("Index: %d, Time: %d", ind, $time);
        a<=4; b<=1; c<=3; d<=2;
        #1;
        $display("Index: %d, Time: %d", ind, $time);
        a<=5; b<=1; c<=0; d<=4;
        #1;
        $display("Index: %d, Time: %d", ind, $time);
        a<=6; b<=3; c<=5; d<=2;
        #1;
        $display("Index: %d, Time: %d", ind, $time);
        a<=7; b<=2; c<=4; d<=5;
        #1;
        $display("Index: %d, Time: %d", ind, $time);
    end

    initial begin
        #10;
        $finish;
    end

endmodule