module seven_seg_scanner(
    input div_clock,
    input reset,
    output [3:0] anode
);

    wire [1:0] state;
    
    dff dff0(
        .Default(1'b0),
        .reset(reset),
        .clk(div_clock),
        .D(~state[0]),
        .Q(state[0])
    );
    dff dff1(
        .Default(1'b0),
        .reset(reset),
        .clk(div_clock),
        .D(state[1] ^ state[0]),
        .Q(state[1])
    );
    
    assign anode[0] = state[1] | state[0];
    assign anode[1] = state[1] | ~state[0];
    assign anode[2] = ~state[1] | state[0];
    assign anode[3] = ~state[1] | ~state[0];
    
    

endmodule