// 5 bit binary to bcd
module bin_bcd(a,cout,s);
    input [4:0] a;
    output reg [1:0]cout;
    output reg [3:0] s;
    
    reg [5:0] temp;
    reg [1:0]x;
    
    always@(a)
    begin
        x = a/10 ;
        //$monitor("%b",x);
        temp = a + 6*x;
        s = temp[3:0];
        cout = temp[5:4];
    end
endmodule


//test bench
module tb_bin_bcd;
    reg [4:0]a;
    wire [3:0]sum;
    wire [1:0]cout;
    bin_bcd B(.a(a),.cout(cout),.s(sum));

    initial begin
      $monitor($time," a = %d cout = %b s = %b",a,cout,sum);

      #5 a = 7;
      #5 a = 14;
      #5 a = 20;
      #5 a = 23;
      #5 a = 30;
    end
endmodule

