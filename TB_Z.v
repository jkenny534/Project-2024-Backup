module TB_Z;

	reg [15:0] instr;
	reg clk;
	reg [3:0] count;

	chip chip(.clk(clk));
	
	always begin
		#50
		clk = ~clk;
	end

	initial begin
		clk = 1'b0;

        $dumpfile("TB_Z.vcd");

        $dumpvars(0, TB_Z);

        #2000 

        $display("\nREGISTER FILE");
        $display("R0 = %b (%d)", chip.processor.dp.gen_reg[0].reg_in.data_out, chip.processor.dp.gen_reg[0].reg_in.data_out);
        $display("R1 = %b (%d)", chip.processor.dp.gen_reg[1].reg_in.data_out, chip.processor.dp.gen_reg[1].reg_in.data_out);
        $display("R2 = %b (%d)", chip.processor.dp.gen_reg[2].reg_in.data_out, chip.processor.dp.gen_reg[2].reg_in.data_out);
        $display("R3 = %b (%d)", chip.processor.dp.gen_reg[3].reg_in.data_out, chip.processor.dp.gen_reg[3].reg_in.data_out);
        $display("R4 = %b (%d)", chip.processor.dp.gen_reg[4].reg_in.data_out, chip.processor.dp.gen_reg[4].reg_in.data_out);
        $display("R5 = %b (%d)", chip.processor.dp.gen_reg[5].reg_in.data_out, chip.processor.dp.gen_reg[5].reg_in.data_out);
        $display("R6 = %b (%d)", chip.processor.dp.gen_reg[6].reg_in.data_out, chip.processor.dp.gen_reg[6].reg_in.data_out);
        $display("R7 = %b (%d)", chip.processor.dp.gen_reg[7].reg_in.data_out, chip.processor.dp.gen_reg[7].reg_in.data_out);
        
        $display("\n");
        $finish;

        end

endmodule