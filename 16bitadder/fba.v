
module bit4Ad(a1,b1,c,s,co);
input [3:0]a1,b1;
input c;
output [3:0]s;
output co;
wire c1,c2,c3;

fa f1(s[0],c1,a1[0],b1[0],c);
fa f2(s[1],c2,a1[1],b1[1],c1);
fa f3(s[2],c3,a1[2],b1[2],c2);
fa f4(s[3],co,a1[3],b1[3],c3);

endmodule

module tb4b;
reg [3:0]a,b;
input cin;
wire [3:0]sum;
wire co;

bit4Ad FbA(.a1(a),.b1(b),.c(c),.s(sum),.co(co));
initial begin

$monitor($time,"a = %b b = %b cin = %b cout = %b s = %b",a,b,cin,co,sum);
#1
a = 4'b0000;
b = 4'b0000;
cin = 1'b0;
#3
a = 4'b0001;
b = 4'b0001;
cin = 1'b1;
#3
a = 4'b0010;
b = 4'b0110;
cin = 1'b0;
#3
a = 4'b1111;
b = 4'b0001;
cin = 1'b0;
#3
a = 4'b0010;
b = 4'b0011;
cin = 1'b1;
#3
a = 4'b0000;
b = 4'b0000;
cin = 1'b0;
#3
a = 4'b0000;
b = 4'b0000;
cin = 1'b0;
#3
a = 4'b0000;
b = 4'b0000;
cin = 1'b0;
end
endmodule