
`include "hvsync_generator.v"

/*
IF test program

Player 1 Keys: arrow keys + space + shift
Player 2 Keys: A/D/W/S + T + R
*/
module if_top(clk, reset, hsync, vsync, 
              switches_p1, switches_p2,
              rgb);

  input clk, reset;
  input [7:0] switches_p1;
  input [7:0] switches_p2;
  output hsync, vsync;
  output [2:0] rgb;
  wire display_on;
  wire [8:0] hpos;
  wire [8:0] vpos;
  
  hvsync_generator hvsync_gen(
    .clk(clk),
    .reset(reset),
    .hsync(hsync),
    .vsync(vsync),
    .display_on(display_on),
    .hpos(hpos),
    .vpos(vpos)
  );
    
  always @(switches_p1[4]) begin
    if (switches_p1[4]) begin
      rgb = 1;
    end else begin
      rgb = 0;
    end
  end
  
endmodule
