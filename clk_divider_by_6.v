//==========================================================
// Module: Clock Divider by 6
// Description: Divides the input clock frequency by 6
//==========================================================

module clk_divider_by_6 (
    input  wire clk,     // Input clock
    input  wire reset,   // Active-low asynchronous reset
    output wire clk_6    // Output clock divided by 6
);

    reg Q1, Q2, Q3;

    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            Q1 <= 1'b0;
            Q2 <= 1'b0;
            Q3 <= 1'b0;
        end else begin
            Q1 <= ~Q3;
            Q2 <= Q1;
            Q3 <= Q2;
        end
    end

    assign clk_6 = Q3;

endmodule
