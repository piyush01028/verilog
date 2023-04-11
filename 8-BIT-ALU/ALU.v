
module alu(A,B,sel,out,c);
    input   [7:0]    A,B;
    input   [3:0]    sel;
    output  [7:0]    out;
    output           c;

    reg     [7:0]    result;
    wire    [8:0]    temp;
    

    assign  out     =   result;
    assign  temp    =   {1'b0,A}+{1'b0,B};
    assign  c       =   temp[8];
    /*
    functions of sel
    0000 : addition
    0001 : subtraction
    0010 : check parity of a
    0011 : check parity of b
    0100 : left shift by 1 bit
    0101 : right shift by 1 bit
    0110 : rotate left by 1 bit
    0111 : rotate right by 1 bit
    1000 : logical AND
    1001 : logical OR
    1010 : logical XOR
    1011 : logical NOR
    1100 : logical NAND
    1101 : logical XNOR
    1110 : Compare if A>B
    1111 : compare if A=B
    */

    always @(*)
    begin
        case(sel)
        4'b0000:
            result = A+B;
        4'b0001:
            result = A-B;
        4'b0010:
            result = ^A;
        4'b0011:
            result = ^B;
        4'b0100:
            result = A<<1;
        4'b0101:
            result = A>>1;
        4'b0110:
            result = {A[6:1],A[7]};
        4'b0111:
            result = {A[0],A[7:1]};
        4'b1000:
            result = A&B;
        4'b1001:
            result = A|B;
        4'b1010:
            result = A^B;
        4'b1011:
            result = ~(A|B);
        4'b1100:
            result = ~(A&B);
        4'b1101:
            result = ~(A^B);
        4'b1110:
            result = (A>B)?8'b1:8'b0;
        4'b1111:
            result = (A==B)?8'b1:8'b0;
        default: result = A+B;
        endcase
    end
endmodule


module tb;
    reg     [7:0]   a,b;
    reg     [3:0]   s;

    wire    [7:0]   out;
    wire            c;

    alu a1(.A(a),.B(b),.sel(s),.out(out),.c(c));
    always #2 s = s + 4'b0001;
    initial begin
        $monitor($time," %b  %b  %b %b",a,b,c,out);
        s = 4'b0000;
        a = 8'b11110000;
        b = 8'b11001110;
        #31 $finish;
    end
endmodule
