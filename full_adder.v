module full_adder(
    input [3:0] A, B,
    input Cin,
    output [3:0] Sum,
    output Cout
);
    wire [3:0] sumwire, C;
    assign C[0] = Cin;
    
    genvar i;
    generate
        for (i=0; i<4; i=i+1) begin: adder
            assign sumwire[i] = A[i] ^ B[i] ^ C[i];
            assign C[i+1] = (A[i] & B[i]) | (A[i] & C[i]) | (B[i] & C[i]);
        end
    endgenerate
    
    assign Sum = sumwire;
    assign Cout = C[4];
    

endmodule