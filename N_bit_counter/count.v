module counter(load, data, up_d, reset, clk, count);
    input load, clk, up_d, reset;
    input [3:0] data;
    output reg [3:0] count;

    always@(posedge clk)
    begin
      if(reset)
        count = 4'b0000;
      if(load)
        count = data;
      if(up_d)
        count = count + 1'b1;
      else
        count = count - 1'b1;
    end
endmodule


module tb;
    reg [3:0] data;
    reg reset, clk, up_d, load;
    wire [3:0] count;
    counter c1(.*);

    initial begin
    
    $dumpfile("count.vcd");
    $dumpvars(0,tb);
    clk = 1'b0;
    repeat(50)
    #1 clk = ~clk;
    end
    initial begin
    $monitor($time," %d", count, " ", );
    reset = 1;
    #2 reset = 0;
    #2 data = 4'b0010;
    #1 load = 1;
    #1 load = 0;
    #2 up_d = 1;
    #20 up_d = 0;
    end
    initial 
    #51 $finish;
endmodule
