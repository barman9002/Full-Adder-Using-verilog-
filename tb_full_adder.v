`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2025 23:22:52
// Design Name: 
// Module Name: tb_full_adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////





module tb_full_adder;

    // Testbench signals
    reg a, b, cin;
    wire sum, cout;

    // Instantiate the full_adder module
    full_adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // Stimulus
    initial begin
        // Monitor outputs
        $monitor("Time = %0t | a = %b | b = %b | cin = %b || sum = %b | cout = %b", 
                 $time, a, b, cin, sum, cout);

        // Test all input combinations (2^3 = 8)
        a = 0; b = 0; cin = 0; #10;
        a = 0; b = 0; cin = 1; #10;
        a = 0; b = 1; cin = 0; #10;
        a = 0; b = 1; cin = 1; #10;
        a = 1; b = 0; cin = 0; #10;
        a = 1; b = 0; cin = 1; #10;
        a = 1; b = 1; cin = 0; #10;
        a = 1; b = 1; cin = 1; #10;

        $display("Test completed!");
        $finish;
    end

endmodule

`timescale 1ns / 1ps