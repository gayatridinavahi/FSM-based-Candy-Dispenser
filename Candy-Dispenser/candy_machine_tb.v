module tb;
  reg clk,rst,five,ten,twentyfive;
  wire change,candy;
  
  candy_machine KABALI (clk,rst,five,ten,twentyfive,change,candy);
  
  always #5 clk =! clk;
  
  initial
    begin
      clk=0;
      rst=0;
      five=0;
      ten=0;
      twentyfive=0;
      #2;
      rst=1;
      #2;
      rst=0;
      //test for no change
      @(posedge clk);
      twentyfive=1;
      //@(posedge clk);
      //twentyfive=0;
      repeat(4) @(posedge clk); twentyfive=0;
      //test for change
      @(posedge clk); 
      rst=1;
      #2; 
      rst=0;
      @(posedge clk);
      five=1;
      ten=1;
      twentyfive=1;
     // @(posedge clk);     
      repeat(4) @(posedge clk);
      five=0;
      ten=0;
      twentyfive=0;
      @(posedge clk);
      //test for no candy
      #2;rst=1;
      #2;rst=0;
      @(posedge clk);
      ten=1;
      //@(posedge clk)      
      repeat(2)@(posedge clk);ten=0;
       
      #20;
      $finish;
    end 
  
   initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
  
endmodule
