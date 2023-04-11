module detect(in, reset, clk, out);
    input in, clk, reset;
    output reg out;
    parameter s0 = 0, s1 = 1, s2 = 2;
    reg [1:0] ps, ns;

    always@(posedge clk or posedge reset)
    begin
    if(reset) 
        ps = s0;
    else
        ps = ns;
    end

    always@(in,ps) begin
    begin
        case (ps)
            s0 : begin
                    out = in ? 0 : 0;
                    ns = in ? s1 : s0;
                 end 
            s1 : begin
                    out = in ? 0 : 0;
                    ns = in ? s1 : s2;
                 end
            s2 : begin
                    out = in ? 1 : 0;
                    ns = in ? s1 : s0;
                 end
            default: ns = s0;
        endcase
    end
    end
endmodule

//test bench:

module tb;

    reg in, clk, reset;
    wire out;
    detect D(.in(in), .reset(reset), .clk(clk), .out(out));

    always #5 clk = ~clk;
    
    initial
    begin
        $dumpfile("detect.vcd");
        $dumpvars(0,tb);
        clk = 1'b0;
        reset = 1'b1;
        in = 0;
        #3 reset = 1'b0;
    
        $monitor($time," ",in," ", out);
        #7 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #1 $finish;
    end
endmodule