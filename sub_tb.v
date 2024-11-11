// Testbench for Subtractor
module subtractor_tb;
    reg a0, a1, a2, a3;
    reg b0, b1, b2, b3;
    wire s0, s1, s2, s3;
    wire final_carry;

    // Instantiate the subtractor module
    subtractor_4bit uut(
        .s0(s0), .s1(s1), .s2(s2), .s3(s3),
        .final_carry(final_carry),
        .a0(a0), .a1(a1), .a2(a2), .a3(a3),
        .b0(b0), .b1(b1), .b2(b2), .b3(b3)
    );

    initial begin
        // Generate waveforms for GTKWave
        $dumpfile("subtractor.vcd");
        $dumpvars(0, subtractor_tb);

        // Display headers
        $display(" ");
        $display("4-Bit Subtractor Verification:");
        $display(" a3 a2 a1 a0 | b3 b2 b1 b0 | s3 s2 s1 s0 | final_carry ");
        $display("------------------------------------------------------");

        // Monitor signal values
        $monitor("%b %b %b %b | %b %b %b %b | %b %b %b %b | %b", 
                 a3, a2, a1, a0, b3, b2, b1, b0, 
                 s3, s2, s1, s0, final_carry);

        // Test cases
        a3 = 1; a2 = 0; a1 = 1; a0 = 0; b3 = 1; b2 = 0; b1 = 1; b0 = 0; #10; // 10 - 10 = 0
        a3 = 0; a2 = 1; a1 = 1; a0 = 0; b3 = 0; b2 = 0; b1 = 1; b0 = 1; #10; // 6 - 3 = 3 

        $display("------------------------------------------------------");

        // End the simulation
        $finish;
    end
endmodule
