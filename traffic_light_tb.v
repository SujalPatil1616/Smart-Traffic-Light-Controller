`timescale 1ns/1ps

module traffic_light_tb;

reg clk;
reg rst;
reg emergency;

wire roadA_red;
wire roadA_yellow;
wire roadA_green;

wire roadB_red;
wire roadB_yellow;
wire roadB_green;

traffic_light uut(
    .clk(clk),
    .rst(rst),
    .emergency(emergency),

    .roadA_red(roadA_red),
    .roadA_yellow(roadA_yellow),
    .roadA_green(roadA_green),

    .roadB_red(roadB_red),
    .roadB_yellow(roadB_yellow),
    .roadB_green(roadB_green)
);

always #10 clk = ~clk;

initial begin

    clk = 0;
    rst = 1;
    emergency = 0;

    #20;
    rst = 0;

    #100;

    emergency = 1;

    #40;

    emergency = 0;

    #100;

    $finish;

end

initial begin
    $dumpfile("traffic.vcd");
    $dumpvars(0, traffic_light_tb);
end

endmodule
