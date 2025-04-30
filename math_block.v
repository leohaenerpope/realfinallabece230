module math_block(
    input [3:0] A,
    input [3:0] B,
    output [3:0] AplusB,
    output [3:0] AminusB
);
    wire [3:0] sum;
    wire [3:0] diff;
    
    full_adder fadd0 (
        .A(A),
        .B(B),
        .Cin(1'b0),
        .Sum(sum),
        .Cout()
    );
    
    full_adder fsubtract0 (
        .A(A),
        .B(~B),
        .Cin(1'b1),
        .Sum(diff),
        .Cout()
    );
    
    assign AplusB = sum;
    assign AminusB = diff;
endmodule
