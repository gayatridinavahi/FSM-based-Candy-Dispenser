module candy_machine (clk,rst,five,ten,twentyfive,change,candy);
  input clk,rst,five,ten,twentyfive;
  output reg candy;
  output reg [31:0] change;
  
  reg [31:0] money;
  reg coin;
  reg [31:0] reg25,reg10,reg5;
  
  enum {IDLE,COUNT,CANDY,CHANGE} state;
  
  always @(posedge clk or posedge rst)
    begin
      if (rst) state <= IDLE;
      else begin
        case (state) 
          IDLE: state <= coin ? COUNT : IDLE;
          COUNT: state<= (money >= 25) ? CANDY : IDLE;
          CANDY: state <= (money > 25) ? CHANGE : IDLE;
          CHANGE: state <= IDLE;
          default: state <= state;
        endcase
      end
    end
  
  always @(posedge clk or posedge rst)
    begin
      if (rst) coin <=0;
      else if (state==IDLE)
        begin
          if (five || ten || twentyfive)
            coin <=1;
          else coin <=0;
        end 
      else coin <=0;
    end
  
  always @(*)
    begin
      if (rst) begin 
        money <=0;
        change = 0; 
      end
      else if (state==IDLE) money = 0;
      else if (state==COUNT) money = reg25+reg5+reg10;      	
      else if (state==CHANGE) change = (money>25) ? (money-25) : 0;         
    end 
 
  
  always @(posedge clk or posedge rst)
    begin
      if (rst) candy <=0;
      else if (state==CANDY) begin
        if (money>=25) candy <= 1;
        else candy <=0;
      end 
    end 
  
  always@(posedge clk or posedge rst)
    begin
      if (rst) reg25 <=0;
      else  if (twentyfive)reg25 <= 25;
      else reg25 <= 0;
    end
  
  always @(posedge clk or posedge rst)
    begin
      if (rst) reg10 <=0;
      else if (ten) reg10 <= 10;
      else reg10 <=0;
    end
  
  always @(posedge clk or posedge rst)
    begin
      if (rst) reg5 <=0;
      else if (five) reg5 <=5;
      else reg5 <=0;
    end
   
endmodule
