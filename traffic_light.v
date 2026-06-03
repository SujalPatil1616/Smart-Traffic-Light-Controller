module traffic_light(
    input clk,
    input rst,
    input emergency,

    output reg roadA_red,
    output reg roadA_yellow,
    output reg roadA_green,

    output reg roadB_red,
    output reg roadB_yellow,
    output reg roadB_green
);

reg [2:0] state;

parameter A_GREEN  = 3'b000;
parameter A_YELLOW = 3'b001;
parameter B_GREEN  = 3'b010;
parameter B_YELLOW = 3'b011;
parameter EMERGENCY = 3'b100;

always @(posedge clk or posedge rst)
begin
    if(rst)
        state <= A_GREEN;

    else if(emergency)
        state <= EMERGENCY;

    else begin
        case(state)

            A_GREEN:
                state <= A_YELLOW;

            A_YELLOW:
                state <= B_GREEN;

            B_GREEN:
                state <= B_YELLOW;

            B_YELLOW:
                state <= A_GREEN;

            EMERGENCY:
                state <= A_GREEN;

        endcase
    end
end

always @(*)
begin

    roadA_red = 0;
    roadA_yellow = 0;
    roadA_green = 0;

    roadB_red = 0;
    roadB_yellow = 0;
    roadB_green = 0;

    case(state)

        A_GREEN:
        begin
            roadA_green = 1;
            roadB_red = 1;
        end

        A_YELLOW:
        begin
            roadA_yellow = 1;
            roadB_red = 1;
        end

        B_GREEN:
        begin
            roadA_red = 1;
            roadB_green = 1;
        end

        B_YELLOW:
        begin
            roadA_red = 1;
            roadB_yellow = 1;
        end

        EMERGENCY:
        begin
            roadA_green = 1;
            roadB_red = 1;
        end

    endcase
end

endmodule
