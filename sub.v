// Full Adder Module
module fulladder(sum, carry, a, b, cin);
    input a, b, cin;
    output sum, carry;
    wire w1, w2, w3;

    xor x1(w1, a, b);
    and x2(w2, a, b);
    xor x3(sum, w1, cin);
    and x4(w3, w1, cin);
    or x5(carry, w2, w3);
endmodule

// 4-bit Subtraction using 1's Complement with End-Around Carry
module subtractor_4bit(
    output s0, s1, s2, s3,
    output final_carry,
    input a0, a1, a2, a3,
    input b0, b1, b2, b3
);
    wire c0, c1, c2, c3;
    wire b0_comp, b1_comp, b2_comp, b3_comp;

    // Step 1: Complement the bits of b
    not (b0_comp, b0);
    not (b1_comp, b1);
    not (b2_comp, b2);
    not (b3_comp, b3);

    // Step 2: Add a and complement of b
    fulladder fa0(s0, c0, a0, b0_comp, 1'b1);
    fulladder fa1(s1, c1, a1, b1_comp, c0);
    fulladder fa2(s2, c2, a2, b2_comp, c1);
    fulladder fa3(s3, c3, a3, b3_comp, c2);

    // Step 3: Add the carry from the first addition to the result
    fulladder fa4(.sum(final_carry), .carry(), .a(1'b0), .b(1'b0), .cin(c3));

endmodule
