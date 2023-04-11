'include"AND.v"
module and_tb();
reg a1,b1;
wire out;
AND mygate(.a(a1), .b(b1), .c(out));
initial 
begin
$monitor($time, a1, b1, out);
#5 
a1 = 1'b0;
b1 = 1'b0;
#5
a1 = 1'b1;
b1 = 1'b1;
#5
a1 = 1'b0;
b1 = 1'b1;
#5
a1 = 1'b1;
b1 = 1'b0;
end
endmodule