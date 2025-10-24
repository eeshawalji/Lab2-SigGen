module sigdelay #(
    parameter A_WIDTH = 9,
              D_WIDTH = 8
)(
    //interface signals
    input logic         clk,
    input logic         rst,
    //input logic         en,
    input logic         rd,
    input logic         wr,
    input logic [D_WIDTH-1:0] offset,
    input logic [D_WIDTH-1:0] mic_signal,
    output logic [D_WIDTH-1:0] delayed_signal
);

  logic [A_WIDTH-1:0] rd_address;
  logic [A_WIDTH-1:0] wr_address;

  assign rd_address = wr_address - offset;

counter addrCounter (
    .clk (clk),
    .rst (rst),
    .en (wr),
    //.incr (incr),
    .count (wr_address)
);

ram2ports ram (
    .clk (clk),
    .wr_en (wr),
    .rd_en (rd),
    .wr_addr (wr_address),
    .rd_addr (rd_address),
    .din (mic_signal),
    .dout (delayed_signal)
);

endmodule
