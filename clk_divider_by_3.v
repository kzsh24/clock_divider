//==========================================================
// Module: Clock Divider by 3 with 50% Duty Cycle Output
// Description: Generates two clocks:
//   - clk_3:     Divided by 3
//   - clk_3_50:  Divided by 3 with 50% duty cycle
//==========================================================

module clk_divider_by_3 (
    input  wire clk,         // Input clock
    input  wire reset,       // Active-low asynchronous reset
    output wire clk_3,       // Clock divided by 3
    output wire clk_3_50     // Clock divided by 3 with 50% duty cycle
);

    reg Q1, Q2, Q3;

    // First stage: Generate Q1 and Q2 based on input clock
    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            Q1 <= 1'b0;
            Q2 <= 1'b0;
        end else begin
            Q1 <= ~Q1 & Q2;
            Q2 <= ~(Q1 + Q2);
        end
    end

    // Second stage: Capture Q2 on negative edge of clk to produce 50% duty cycle
    always @(negedge clk or negedge reset) begin
        if (!reset)
            Q3 <= 1'b0;
        else
            Q3 <= Q2;
    end

    assign clk_3     = Q2;
    assign clk_3_50  = Q2 | Q3;

endmodule
