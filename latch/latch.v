module latch(S,R,Q,Qb);
    input S,R;
    output Q,Qb;

    wire q,qb;
    assign Q = q;
    assign Qb= qb;

    nand(q,A,qb);
    nand(qb,B,q);


endmodule

module tb;
    reg s,r;
    wire q,qb;

    latch l1(.S(s),.R(r),.Q(q),.Qb(qb));
    initial begin
        $monitor($time," ",s," ",r," ",q," ",qb);
        #5 s = 1'b0; r = 1'b0;
        #5 s = 1'b1; r = 1'b0;
        #5 s = 1'b1; r = 1'b1;
    end
endmodule
