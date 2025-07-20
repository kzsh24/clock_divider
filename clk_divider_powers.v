//==========================================================
// Module: Clock Divider (Divide-by-2, 4, 8, 16)
// Description: Generates divided clock signals by powers of 2
//==========================================================

module clk_divider_powers (
    input  wire clk,        // Input clock
    input  wire reset,      // Active-low asynchronous reset
    output reg  clk_2,      // clk divided by 2
    output reg  clk_4,      // clk divided by 4
    output reg  clk_8,      // clk divided by 8
    output reg  clk_16      // clk divided by 16
);

    // Divide-by-2
    always @(posedge clk or negedge reset) begin
        if (!reset)
            clk_2 <= 1'b0;
        else
            clk_2 <= ~clk_2;
    end

    // Divide-by-4
    always @(posedge clk_2 or negedge reset) begin
        if (!reset)
            clk_4 <= 1'b0;
        else
            clk_4 <= ~clk_4;
    end

    // Divide-by-8
    always @(posedge clk_4 or negedge reset) begin
        if (!reset)
            clk_8 <= 1'b0;
        else
            clk_8 <= ~clk_8;
    end

    // Divide-by-16
    always @(posedge clk_8 or negedge reset) begin
        if (!reset)
            clk_16 <= 1'b0;
        else
            clk_16 <= ~clk_16;
    end

endmodule
