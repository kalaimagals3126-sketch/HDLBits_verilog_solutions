module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
wire [31:0] b_xor_sub;
    wire cout_low;
    wire [15:0] sum_low;
    wire [15:0] sum_high;
    assign b_xor_sub = b ^ {32{sub}};
    add16 low_adder (
        .a(a[15:0]),
        .b(b_xor_sub[15:0]),
        .cin(sub),
        .sum(sum_low),
        .cout(cout_low)
    );
    add16 high_adder (
        .a(a[31:16]),
        .b(b_xor_sub[31:16]),
        .cin(cout_low),
        .sum(sum_high),
        .cout()
    ); 
    assign sum = {sum_high, sum_low};
endmodule
