module bcd_ex3(a,b);
    input [7:0]a;
    output [7:0]b;
    assign b = {a[7:4] + 4'b0011,a[3:0] + 4'b0011};
endmodule

module tb();
    reg [7:0]a1;
    wire [7:0]b1;
    bcd_ex3 g(.a(a1),.b(b1));
    initial begin
    $monitor($time, " a = %b %b b = %b %b ", a1[7:4],a1[3:0],b1[7:4],b1[3:0]);
    #5 a1 = 8'b01010000; #5 a1 = 8'b00101001; #5 a1 = 8'b01010010; #5 a1 = 8'b00110011; #5 a1 = 8'b01110100; #5 a1 = 4'b0101;
    end
endmodule 