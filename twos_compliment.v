module twos_compliment(
    input [3:0] A,
    output [3:0] Y
);

    wire [3:0] ones_compliment;      
    wire [2:0] carries;          

   
    assign ones_compliment = ~A;

    full_adder fadd0(
        .A(ones_compliment[0]),
        .B(1'b1),
        .Y(Y[0]),
        .Cin(1'b0),
        .Cout(carries[0])
    );
   
    full_adder fadd1(
        .A(ones_compliment[1]),
        .B(1'b0),
        .Y(Y[1]),
        .Cin(carries[0]),
        .Cout(carries[1])
    );

    full_adder fadd2(
        .A(ones_compliment[2]),
        .B(1'b0),
        .Y(Y[2]),
        .Cin(carries[1]),
        .Cout(carries[2])
    );

    full_adder fadd3(
        .A(ones_compliment[3]),
        .B(1'b0),
        .Y(Y[3]),
        .Cin(carries[2]),
        .Cout()
    );
endmodule