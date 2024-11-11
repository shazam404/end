module decadecounter_tb;
wire [3:0] count;
reg en,clock;
  
decade_counter dut(.en(en), .clock(clock), .count(count));
initial begin
$display($time, " << Starting the Simulation >>");
    en=0;
    clock=0;
   #20 en=1'b1;
end
  integer a;

    initial begin
        for(a=0;a<100;a++)begin
            #5 clock=~clock; 
    end
    $stop;
    end
  
  initial
    $monitor ( $time , "clock= %b, count= %d, en= %b",    clock,count, en);
  
endmodule