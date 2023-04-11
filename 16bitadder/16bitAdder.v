// full adder behavioural + structural
module fa(sum,cout,a,b,cin);
input a,b,cin;
output sum,cout;

assign {cout,sum} = a+b+cin; // behavioural

// wire s0,s1,s2;

// xor(s0,a,b);
// xor(sum,s0,cin);
// and(s1,a,b);
// and(s2,s0,cin);
// xor(cout,s1,s2);
endmodule

//4bit adder behavioural
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

//16 bit adder brhavioural
module bit16Ad(a2,b2,S,Co);
input [15:0]a2,b2;
output [15:0]S;
output Co;
wire c0,c1,c2;

bit4Ad A1(a2[3:0],b2[3:0],1'b0,S[3:0],c0);
bit4Ad A2(a2[7:4],b2[7:4],c0,S[7:4],c1);
bit4Ad A3(a2[11:8],b2[11:8],c1,S[11:8],c2);
bit4Ad A4(a2[15:12],b2[15:12],c2,S[15:12],Co);

endmodule


//test_bench
module tb16b;
reg [15:0]a,b;

wire [15:0]sum;
wire co;

bit16Ad sbA(.a2(a),.b2(b),.S(sum),.Co(co));
initial begin

$monitor($time," a = %h b = %h cout = %h s = %h",a,b,co,sum);
#1
a = 16'h0000;
b = 16'h000A;

#3
a = 16'h0001;
b = 16'h0007;

#3
a = 16'h0010;
b = 16'h0110;

#3
a = 16'h1111;
b = 16'h0001;

#3
a = 16'h0010;
b = 16'h0011;

#3
a = 16'h01C0;
b = 16'h00B0;

#3
a = 16'HFFFF;
b = 16'h0001;

#3
a = 16'hDDDD;
b = 16'h0001;

end
endmodule