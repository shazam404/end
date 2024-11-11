module tb_flip_flops;

    reg clk; 
    reg reset; 
    reg J, K; 
    reg S, R; 
    reg D; 
    wire Q_jk, Q_sr, Q_d; 
    wire Qn_jk, Qn_sr, Qn_d;

    // Instantiate JK Flip-Flop
    JK_FF jk_ff (
        .J(J), 
        .K(K), 
        .clk(clk), 
        .reset(reset), 
        .Q(Q_jk), 
        .Qn(Qn_jk)
    );

    // Instantiate SR Flip-Flop
    SR_FF sr_ff (
        .S(S), 
        .R(R), 
        .clk(clk), 
        .reset(reset), 
        .Q(Q_sr), 
        .Qn(Qn_sr)
    );

    // Instantiate D Flip-Flop
    D_FF d_ff (
        .D(D), 
        .clk(clk), 
        .reset(reset), 
        .Q(Q_d), 
        .Qn(Qn_d)
    );

    // Clock generation
    initial begin 
        clk = 0; 
        forever #5 clk = ~clk;  
    end 

    // Test stimulus
    initial begin 
        reset = 1; 
        #10;
        reset = 0; 

        // Test cases
        J = 0; K = 0; S = 0; R = 0; D = 0; #10; 
        J = 0; K = 1; S = 0; R = 1; D = 0; #10;  
        J = 1; K = 0; S = 1; R = 0; D = 1; #10;  
        J = 1; K = 1; S = 1; R = 1; D = 1; #10; 

        $finish; 
    end 

    // Display the signals and monitor values at each time step
    initial begin 
        $display("Clk | J  K  | Q_jk  Qn_jk | S  R  | Q_sr  Qn_sr | D  | Q_d  Qn_d");
        $monitor("%b   | %b  %b  | %b     %b     | %b  %b  | %b     %b     | %b  | %b     %b",
                 clk, J, K, Q_jk, Qn_jk, S, R, Q_sr, Qn_sr, D, Q_d, Qn_d); 
    end 

    // Dump waveform for analysis
    // initial begin
    //     $dumpfile("CS110-S1-2-B-1.vcd");
    //     $dumpvars(0, tb_flip_flops);
    // end

endmodule
