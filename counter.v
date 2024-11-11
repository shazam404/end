module decade_counter(en, clock, count);
input en, clock; 
 output reg [3:0] count;
  
  always @( posedge clock)
    begin
      if(en) 
        begin
          
    	  if ( count>=4'b0 && count<4'b1010)
      	  count<=count+4'b0001;
           
       	 else
          count<=4'b0;
          
        end
      
      else 
        count<=4'b0;
    end
endmodule