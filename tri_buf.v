module tri_buf (
    input wire [15:0] a,
    output wire [15:0] b,
    input en
);
    assign b = en ? a : 16'bz;
endmodule
