module comp(a, b, c, d, out);

input [2:0] a;
input [2:0] b;
input [2:0] c;
input [2:0] d;

wire Less0;
wire Equal0;
wire Greater0;

wire Less1;
wire Equal1;
wire Greater1;

wire Less2;
wire Equal2;
wire Greater2;

wire Less3;
wire Equal3;
wire Greater3;

wire Less4;
wire Equal4;
wire Greater4;

wire Less5;
wire Equal5;
wire Greater5;

output reg [1:0] out;

three_bit_comparator COMPARATOR_0 (a, b, Less0, Equal0, Greater0);
three_bit_comparator COMPARATOR_1 (b, c, Less1, Equal1, Greater1);
three_bit_comparator COMPARATOR_2 (c, d, Less2, Equal2, Greater2);
three_bit_comparator COMPARATOR_3 (a, c, Less3, Equal3, Greater3);
three_bit_comparator COMPARATOR_4 (b, d, Less4, Equal4, Greater4);
three_bit_comparator COMPARATOR_5 (a, d, Less5, Equal5, Greater5);

always @(a or b or c or d) begin
    #0;
    if((Less0 == 0) && ((Less1 == 1) || (Equal1==1)) && ((Less4 == 1) || (Equal4==1))) 
        out<=1;
    else if((Less1 == 0) && ((Less2 == 1) || (Equal2==1)) && (Less3 == 0))
        out<=2;
    else if((Less2 == 0) && (Less4 == 0) && (Less5==0))
        out<=3;
    else 
        out<=0;
end

endmodule

