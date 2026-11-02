`timescale 1ns/1ps

module register_8bit_tb;

reg clk;
reg rst;
reg load;
reg [7:0] data_in;
wire [7:0] data_out;

register_8bit uut (
    .clk(clk),
    .rst(rst),
    .load(load),
    .data_in(data_in),
    .data_out(data_out)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    rst = 1;
    load = 0;
    data_in = 0;

    #10;
    rst = 0;

    #10;
    load = 1;
    data_in = 8'b10110101;

    #10;
    load = 0;

    #10;
    $display("Input = %b, Output = %b",
              data_in, data_out);

    $finish;
end

endmodule