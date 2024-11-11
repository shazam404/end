// Testbench for Binary Adder-Subtractor
module add_sub_tb;
    reg a0, a1, a2, a3;
    reg b0, b1, b2, b3;
    reg cin;

    wire sum0, sum1, sum2, sum3;
    wire cout;

    // Instantiate the binary_adder_subtractor module
    binary_adder_subtractor uut(
        .sum0(sum0), .sum1(sum1), .sum2(sum2), .sum3(sum3),
        .cout(cout),
        .a0(a0), .a1(a1), .a2(a2), .a3(a3),
        .b0(b0), .b1(b1), .b2(b2), .b3(b3),
        .cin(cin)
    );

    initial begin
        // Generate waveforms for GTKWave
        $dumpfile("add_sub.vcd");
        $dumpvars(0, add_sub_tb);

        // Display headers
        $display(" ");
        $display("Binary Adder-Subtractor Verification:");
        $display(" a3 a2 a1 a0 | b3 b2 b1 b0 | cin | sum3 sum2 sum1 sum0 | cout ");
        $display("--------------------------------------------------------------");

        // Monitor signal values
        $monitor("%b %b %b %b | %b %b %b %b |  %b  |  %b   %b   %b   %b   |  %b",
                 a3, a2, a1, a0, b3, b2, b1, b0, cin, sum3, sum2, sum1, sum0, cout);

        // Test cases
        a3 = 1; a2 = 0; a1 = 1; a0 = 0; b3 = 1; b2 = 0; b1 = 1; b0 = 0; cin = 0; #10;  // Addition: 10 + 10 = 20 (sum=0100, cout=1)
        a3 = 1; a2 = 0; a1 = 1; a0 = 0; b3 = 1; b2 = 0; b1 = 1; b0 = 0; cin = 1; #10;  // Subtraction: 10 - 10 = 0 (sum=0000, cout=1)
        a3 = 0; a2 = 1; a1 = 1; a0 = 0; b3 = 0; b2 = 0; b1 = 1; b0 = 1; cin = 0; #10;  // Addition: 6 + 3 = 9 (sum=1001, cout=0)
        a3 = 0; a2 = 1; a1 = 1; a0 = 0; b3 = 0; b2 = 0; b1 = 1; b0 = 1; cin = 1; #10;  // Subtraction: 6 - 3 = 3 (sum=0011, cout=1)

        $display("--------------------------------------------------------------");

        // End the simulation
        $finish;
    end
endmodule

