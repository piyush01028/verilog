module AND(a, b, c);

input  a, b;
output  c;
assign c = a & b;

endmodule


module and_tb;
wire out;
reg a1,b1;

AND A1(.a(a1), .b(b1), .c(out));
initial begin
$dumpfile("and1.vcd");
$dumpvars(0,and_tb);
$monitor($time," ", a1," " , b1," ", out);
#5 
a1 = 1'b0;
b1 = 1'b0;
#5
a1 = 1'b0;
b1 = 1'b1;
#5
a1 = 1'b1;
b1 = 1'b0;
#5
a1 = 1'b1;
b1 = 1'b1;
end
endmodule