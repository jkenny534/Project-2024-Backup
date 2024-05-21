module chip(input wire clk);

	wire [15:0] instr;
	wire [7:0] prog_addr;
	wire done;

	program_counter pc(
		.clk(clk),
		.next(done),
		.address(prog_addr));

	InstructionMemory imem(
		.address(prog_addr),
		.instr(instr));

	processor processor(
		.clk(clk),
		.instr(instr),
		.done(done));

endmodule

module processor(instr, clk, done);

	input wire [15:0] instr;
	input wire clk;

	wire ext_data_en;
	wire ext_data_low_reg_en;
	wire [7:0] reg_in_en;
	wire [7:0] reg_out_en;
	wire alu_reg_en;
	wire alu_sel;
	wire alu_out_en;
	wire g_reg_en;
	wire [15:0] ext_data_in;
	
	output wire done;

	controlCircuit cc(
		// INPUTS
		.instr(instr),
		.clk(clk),
		// OUTPUTS
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

	reg8_bit ext_data_low_reg(
		.clk(clk),
		.data_in(instr[7:0]),
		.data_out(ext_data_in[7:0]),
		.en(ext_data_low_reg_en));

	assign ext_data_in[15:8] = instr[7:0];

	datapath dp(
		// INPUTS
		.clk(clk),
		.ext_data(ext_data_in),
		
		// Input Control Signals
		.ext_data_en(ext_data_en),
		.reg_in_en(reg_in_en),
		.reg_out_en(reg_out_en),
		.alu_reg_en(alu_reg_en),
		.alu_sel(alu_sel),
		.alu_out_en(alu_out_en),
		.g_reg_en(g_reg_en)
	);

endmodule