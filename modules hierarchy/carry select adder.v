module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
wire [15:0] sum_low;     
    wire [15:0] sum_high_c0;  
    wire [15:0] sum_high_c1;  
    wire cout_low;            
    add16 low_adder (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .sum(sum_low),
        .cout(cout_low)
    );
    add16 high_adder_c0 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b0),
        .sum(sum_high_c0),
        .cout() 
    );
    add16 high_adder_c1 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b1),
        .sum(sum_high_c1),
        .cout() 
    );
    assign sum[15:0]  = sum_low;
    assign sum[31:16] = (cout_low) ? sum_high_c1 : sum_high_c0;

endmodule
