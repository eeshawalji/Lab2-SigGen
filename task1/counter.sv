module counter #(
    parameter WIDTH = 8
)(
    //interface signals
    input logic clk,
    input logic rst,
    input logic en,
    input logic [WIDTH-1:0] incr, //input to be incremented
    output logic [WIDTH-1:0] count
);

always_ff @ (posedge clk or posedge rst)
    if (rst) count <= {WIDTH{1'b0}};
    else if (en)  count <= count + incr;

endmodule
