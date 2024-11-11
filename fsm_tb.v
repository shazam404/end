`timescale 1ps/1ps

module fsm_tb;

reg clk, rst, in;
wire out;

fsm uut(
    .clk(clk),
    .rst(rst),
    .in(in),
    .out(out)
);

initial begin

    clk = 1'b0;
    rst = 1'b1;

    #15 rst = 1'b0;

end

initial forever begin
    #5 clk = ~clk;
end

initial begin

    $monitor("%t || in = %b || out = %b || state = %d || clk = %b", $time, in, out,uut.state, clk);
    $dumpfile("c.vcd");
    $dumpvars(0);

end


initial begin

    #15 in = 0;
    #10 in = 1; 
    #10 in = 1; 
    #10 in = 0; 
    #10 in = 1; 
    #10 in = 1; 
    #10 in = 0; 
    #10 in = 1; 
    #10 in = 0; 

    #20 $finish;    

end

endmodule