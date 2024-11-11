module JK_FF ( input J, input K, input clk, input reset, output reg Q, output Qn );

wire S, R;
assign S = J & Qn;
assign R = K & Q;

wire S_nand, R_nand;
nand(S_nand, S, clk);
nand(R_nand, R, clk);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        Q <= 0;
    end else begin
        Q <= ~(S_nand & Qn);
    end
end

assign Qn = ~Q;

endmodule 

module SR_FF ( input S, input R, input clk, input reset, output reg Q, output Qn ); 

wire S_nand, R_nand;
nand(S_nand, S, clk);
nand(R_nand, R, clk);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        Q <= 0;
    end else begin
        Q <= ~(S_nand & Qn);
    end
end

assign Qn = ~Q;

endmodule 

module D_FF ( input D, input clk, input reset, output Q, output Qn ); 

wire D_nand,Q_int, Qn_int;
nand(D_nand,D,clk);
nand(Q,D_nand,Qn_int);
nand(Qn_int,Q,D);

assign Qn = Qn_int;

endmodule

