module CC_TB;

    reg clk;
    reg [3:0] count; 
    reg [15:0] instr;  
    wire ext_data_en;
    wire ext_data_low_reg_en;
    wire [7:0] reg_in_en;
    wire [7:0] reg_out_en;
    wire alu_reg_en;
    wire alu_sel;
    wire alu_out_en;
    wire g_reg_en;
    wire done;

    controlCircuit pleasework(
        .instr(instr),
        .clk(clk),
        .ext_data_en(ext_data_en),
        .ext_data_low_reg_en(ext_data_low_reg_en),
        .reg_in_en(reg_in_en),
        .reg_out_en(reg_out_en),
        .alu_reg_en(alu_reg_en),
        .alu_sel(alu_sel),
        .alu_out_en(alu_out_en),
        .g_reg_en(g_reg_en),
        .done(done)
    );

    initial begin 
        count = 4'b0000;
        clk = 1'b0;
    end
    
    always begin
        #50 clk = ~clk; // Toggle clock every 50 time units
    end
    
    always @(posedge clk) begin
        count = count + 4'b0001;
    end
    
    always @(count) begin
        case (count)
            // load 16'b0000000000000001 into R1
            4'b0000 : instr = 16'b0000000100000000; 
            4'b0001 : instr = 16'b0000000100000001;
            4'b0010 : instr = 16'b0000000100000001;

            // load 16'b0000000000000001 into R2
            4'b0011 : instr = 16'b0000001000000001; 
            4'b0100 : instr = 16'b0000001000000001; 
            4'b0101 : instr = 16'b0000001000000001; 
            4'b0110 : instr = 16'b0000000000000000; 
            4'b0111 : instr = 16'b0000000000000000; 
            4'b1000 : instr = 16'b0000000000000000; 
            4'b1001 : instr = 16'b0000000000000000; 
            4'b1010 : instr = 16'b0000000000000000; 
            4'b1011 : instr = 16'b0000000000000000; 
            4'b1100 : instr = 16'b0000000000000000; 
            4'b1101 : instr = 16'b0000000000000000; 
            4'b1110 : instr = 16'b0000000000000000; 
            4'b1111 : instr = 16'b0000000000000000; 
            default : instr = 16'b0000000000000000; 
        endcase
    end

    initial begin
        $dumpfile("CC_TB.vcd");
        $dumpvars(0, CC_TB);
        #2000 $finish;
    end

endmodule
