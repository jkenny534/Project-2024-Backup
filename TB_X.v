module TB_X;

	reg [15:0] instr;
	reg clk;
	reg [3:0] count;

	processor processor(
		.instr(instr),
		.clk(clk));
	
	always begin
		#50
		clk = 1'b1;
		count=count + 4'b0001;
		#50
		clk = 1'b0;
		$display("opcode = %b, RX = %b", processor.cc.opcode, processor.cc.RX);
	end
	
	always @(count) begin
		case (count)
			// NOP - 1 CLK CYCLE
			4'b0000 : begin instr = 16'b1111000000000000; end
			// LOAD 3 into R1 - 2 CLK CYCLES (2 INSTR)
			4'b0001 : begin instr = 16'b0000000100000011; end // Low bits
			4'b0010 : begin instr = 16'b0000000100000011; end // High bits
			// NOP
			4'b0011 : begin instr = 16'b1111000000000000; end
			// MOV R1 into R5 - 1 CLK CYCLE
			4'b0100 : begin instr = 16'b0001010100010000; end
			// NOP
			4'b0101 : begin instr = 16'b1111000000000000; end
			// ADD - 3 CLK CYCLES (1 INSTR) - Add R1 into R5
			4'b0110 : begin instr = 16'b0101010100010000; end
			4'b0111 : begin instr = 16'b0101010100010000; end
			4'b1000 : begin instr = 16'b0101010100010000; end
			// NOP
			4'b1001 : begin instr = 16'b1111000000000000; end
			// XOR - 3 CLK CYCLES (1 INSTR)
			4'b1010 : begin instr = 16'b0111000000000000; end
			4'b1011 : begin instr = 16'b0111000000000000; end
			4'b1100 : begin instr = 16'b0111000000000000; end
			// NOP
			4'b1101 : begin instr = 16'b1111000000000000; end
			4'b1110 : begin instr = 16'b1111000000000000; end
			4'b1111 : begin instr = 16'b1111000000000000; end
			default : begin instr = 16'b1111000000000000; end
		endcase
	end

	initial begin

		count = 4'b0000;
		clk = 1'b0;

        $dumpfile("TB_X.vcd");

        $dumpvars(0, TB_X);

        #2000 

        $display("\nREGISTER FILE");
        $display("R0 = %b (%d)", processor.dp.gen_reg[0].reg_in.data_out, processor.dp.gen_reg[0].reg_in.data_out);
        $display("R1 = %b (%d)", processor.dp.gen_reg[1].reg_in.data_out, processor.dp.gen_reg[1].reg_in.data_out);
        $display("R2 = %b (%d)", processor.dp.gen_reg[2].reg_in.data_out, processor.dp.gen_reg[2].reg_in.data_out);
        $display("R3 = %b (%d)", processor.dp.gen_reg[3].reg_in.data_out, processor.dp.gen_reg[3].reg_in.data_out);
        $display("R4 = %b (%d)", processor.dp.gen_reg[4].reg_in.data_out, processor.dp.gen_reg[4].reg_in.data_out);
        $display("R5 = %b (%d)", processor.dp.gen_reg[5].reg_in.data_out, processor.dp.gen_reg[5].reg_in.data_out);
        $display("R6 = %b (%d)", processor.dp.gen_reg[6].reg_in.data_out, processor.dp.gen_reg[6].reg_in.data_out);
        $display("R7 = %b (%d)", processor.dp.gen_reg[7].reg_in.data_out, processor.dp.gen_reg[7].reg_in.data_out);
        
        $display("\n");
        // $display("R1 : Expected = 3, Actual = %b", processor.dp.gen_reg[2].reg_in.data_out);
        $finish;

        end

endmodule