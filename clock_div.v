module clock_div
#(
    parameter DIVIDE_BY = 17
)
(
    input clock,
    input reset,
    output div_clock
);
wire [(DIVIDE_BY-1):0] clkdiv;

dff dff0 (
    .Default(1'b0),
    .clk(clock),
    .reset(reset),
    .D(~clkdiv[0]),
    .Q(clkdiv[0])
);

genvar i;
generate
for (i = 1; i < DIVIDE_BY; i=i+1) 
begin : dff_gen_label
    dff dff1 (
        .Default(1'b0),
        .clk(clkdiv[i-1]),
        .reset(reset),
        .D(~clkdiv[i]),
        .Q(clkdiv[i])
    );
    end
endgenerate;
 
assign div_clock = clkdiv[(DIVIDE_BY-1)];

endmodule