// File: quad_seven_seg.v
// This is the top level design for EE178 Lab #2.
// The `timescale directive specifies what the
// simulation time units are (1 ns here) and what
// the simulator time step should be (1 ps here).
`timescale 1 ns / 1 ps

// Declare the module and its ports. This is
// using Verilog-2001 syntax.

//Module declaration
module quad_seven_seg (
    //Port declaration
    //Define inputs as wires
    input wire clk,     //Clock
    input wire [3:0] val3, val2, val1, val0,    //4-bit value (HEX) from switches
    input wire dot3, dot2, dot1, dot0,  //Decimals

    //Define outputs as regs
    output reg an3, an2, an1, an0,  //7-segment display anodes
    output reg ca, cb, cc, cd, ce, cf, cg, dp  //Segments
    );
    
// Describe the actual circuit for the assignment.

    //Counter
    reg[15:0] clock_count = 0; //16-bit clock_counter initialized to 0
    reg[1:0] count = 0; //2-bit counter that counts each clock cycle
    
    //16-bit clock counter
    always @ (posedge clk)
        begin
            clock_count <= clock_count + 1; // Increment clock_count and counts until its limit
        end
        
    //2 -bit counter which counts every full clock cycle
    always @ (posedge clk)
        begin
            if(clock_count == 0)
                begin
                    count <= count + 2'b01;
                end
        end
        
    reg[3:0] val; //4-bit to store switch values
    
    //Switch between anode control using 2-to-4 decoder
    //Also 4-to-1 MUX to select switch values and store into val
    //Procedural Assignment
    always @* //Function executed continuously
        begin
            case(count)
                2'b00: begin {an3, an2, an1, an0} = ~4'b0001; //Turns on AN0
                        val = val0;
                       end
                2'b01: begin {an3, an2, an1, an0} = ~4'b0010; //Turns on AN1
                        val = val1;
                       end
                2'b10: begin {an3, an2, an1, an0} = ~4'b0100; //Turns on AN2
                        val = val2;
                       end
                2'b11: begin {an3, an2, an1, an0} = ~4'b1000; //Turns on AN3
                        val = val3;
                       end
                default: val = 4'bxxxx;     //x-propogation
            endcase
        end
        
     //HEX-to-segment converter        
     always @*
        begin
        //Depending on val (HEX digit), appropriate 7-segment combination will be assigned
            case(val)     
                4'b0000:  {ca, cb, cc, cd, ce, cf, cg} = ~7'b1111110;   // Display 0
                4'b0001:  {ca, cb, cc, cd, ce, cf, cg} = ~7'b0110000;   // Display 1
                4'b0010:  {ca, cb, cc, cd, ce, cf, cg} = ~7'b1101101;   // Display 2      
                4'b0011:  {ca, cb, cc, cd, ce, cf, cg} = ~7'b1111001;   // Display 3
                4'b0100:  {ca, cb, cc, cd, ce, cf, cg} = ~7'b0110011;   // Display 4
                4'b0101:  {ca, cb, cc, cd, ce, cf, cg} = ~7'b1011011;   // Display 5
                4'b0110:  {ca, cb, cc, cd, ce, cf, cg} = ~7'b1011111;   // Display 6
                4'b0111:  {ca, cb, cc, cd, ce, cf, cg} = ~7'b1110000;   // Display 7
                4'b1000:  {ca, cb, cc, cd, ce, cf, cg} = ~7'b1111111;   // Display 8
                4'b1001:  {ca, cb, cc, cd, ce, cf, cg} = ~7'b1111011;   // Display 9
                4'b1010:  {ca, cb, cc, cd, ce, cf, cg} = ~7'b1110111;   // Display A
                4'b1011:  {ca, cb, cc, cd, ce, cf, cg} = ~7'b0011111;   // Display b
                4'b1100:  {ca, cb, cc, cd, ce, cf, cg} = ~7'b1001110;   // Display C
                4'b1101:  {ca, cb, cc, cd, ce, cf, cg} = ~7'b0111101;   // Display d
                4'b1110:  {ca, cb, cc, cd, ce, cf, cg} = ~7'b1001111;   // Display E
                4'b1111:  {ca, cb, cc, cd, ce, cf, cg} = ~7'b1000111;   // Display F
                default:  {ca, cb, cc, cd, ce, cf, cg} = ~7'bxxxxxxx;   // x-propagation
            endcase
        end      
       
     //Decimal Point
     //Continuous...if button is held (high=1), decimal point(active low) is displayed
     //If button is not held (low=0), decimal point is not displayed
     always @*
        begin
            case(count)
                2'b00:  if (dot0 == 1)
                            {dp} = 0;
                        else {dp} = 1;
                2'b01:  if (dot1 == 1)
                            {dp} = 0;
                        else {dp} = 1;
                2'b10:  if (dot2 == 1)
                            {dp} = 0;
                        else {dp} = 1;
                2'b11:  if (dot3 == 1)
                            {dp} = 0;
                        else {dp} = 1;
            endcase
        end       
endmodule