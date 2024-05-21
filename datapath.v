module datapath(
	// INPUTS
	input wire clk,
	input wire [15:0] ext_data,
	
	// Input Control Signals
	input wire ext_data_en,
	input wire [7:0] reg_in_en,
	input wire [7:0] reg_out_en,
	input wire alu_reg_en,
	input wire alu_sel,
	input wire alu_out_en,
	input wire g_reg_en
	);
	

	// OUTPUTS
	wire [15:0] bus;

	// INTERNAL
	wire [15:0] MyWire [7:0];
	wire [15:0] wire_A, wire_alu_out, wire_alu_tri_buf;

	// External Data Input

	tri_buf ext_data_tri_buf(
		.a(ext_data),
		.b(bus),
		.en(ext_data_en));

	// Generate registers
	genvar i;
	generate
		for (i = 0; i < 8; i = i+1) begin : gen_reg
			reg16_bit reg_in(
				.clk(clk),
				.data_in(bus),
				.data_out(MyWire[i]),
				.en(reg_in_en[i]));

			tri_buf reg_out(
				.a(MyWire[i]),
				.b(bus),
				.en(reg_out_en[i]));
		end
	endgenerate

	// ALU
	reg16_bit alu_reg(
		.clk(clk),
		.data_in(bus),
		.data_out(wire_A),
		.en(alu_reg_en));

	alu mafs(
		.A(wire_A),
		.B(bus),
		.sel(alu_sel),
		.out(wire_alu_out)
	);

	reg16_bit G_reg(
		.clk(clk),
		.data_in(wire_alu_out),
		.data_out(wire_alu_tri_buf),
		.en(g_reg_en));

	tri_buf alu_tri_buf(
		.a(wire_alu_tri_buf),
		.b(bus),
		.en(alu_out_en));

endmodule