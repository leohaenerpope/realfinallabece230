module top
#(
    parameter DIVIDE_BY = 17 // Use this when passing in to your clock div!
    // The test bench will set it appropriately for testing
)
(
    input [7:0] sw, // A and B
    input clk, // 100 MHz board clock
    input btnC, // Reset
    output [3:0] an, // 7seg anodes
    output [6:0] seg // 7seg segments
);
    wire dvclk;

    clock_div #(.DIVIDE_BY(DIVIDE_BY)) cdiv(
        .clock(clk),
        .reset(btnC),
        .div_clock(dvclk)
    );
    
    seven_seg_scanner scanner1(
        .div_clock(dvclk),
        .reset(btnC),
        .anode(an)
    );
    wire [3:0] plus;
    wire [3:0] minus;
    
    math_block math_block1(
        .A(sw[3:0]),
        .B(sw[7:4]),
        .AplusB(plus),
        .AminusB(minus)
    );
    
    seven_seg_decoder decoder1(
        .A(sw[3:0]),
        .B(sw[7:4]),
        .AplusB(plus),
        .AminusB(minus),
        .anode(an),
        .segs(seg)
    );

endmodule
