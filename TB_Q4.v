module TB_Q4;

	reg clk;
	reg [3:0] count; 
	reg [15:0] a;  
	
	// SIMULATED CONTROL SIGNALS
	reg [7:0] reg_in_en;
	reg [7:0] reg_out_en;
	reg ext_data_en;
	reg alu_reg_en;
	reg alu_sel;
	reg alu_out_en;
	reg g_reg_en;

	datapath Johnisgoodatverilog(
		.clk(clk),
		.ext_data(a),
		.ext_data_en(ext_data_en),
		.reg_in_en(reg_in_en),
		.reg_out_en(reg_out_en),
		.alu_reg_en(alu_reg_en),
		.alu_sel(alu_sel),
		.alu_out_en(alu_out_en),
		.g_reg_en(g_reg_en)
	);

	initial begin 
		count = 4'b0000;
		clk = 1'b0;
	end
	
	always begin
		#50
		clk = 1'b0;
		count=count+4'b0001;
		#50
		clk = 1'b1;
	end
	
	always @(count) begin
		case (count)
			4'b0000 : begin a = 16'b0000000000000001; ext_data_en=1'b0; reg_in_en=8'b00000001; reg_out_en=8'b00000000; alu_out_en=1'b0; end
			4'b0001 : begin a = 16'b0000000000000001; ext_data_en=1'b0; reg_in_en=8'b00000001; reg_out_en=8'b00000000; alu_out_en=1'b0; end
			4'b0010 : begin a = 16'b0000000000000001; ext_data_en=1'b0; reg_in_en=8'b00000001; reg_out_en=8'b00000000; alu_out_en=1'b0; end
			4'b0011 : begin a = 16'b0000000000000001; ext_data_en=1'b0; reg_in_en=8'b00000001; reg_out_en=8'b00000000; alu_out_en=1'b0; end
			4'b0100 : begin a = 16'b0000000000000001; ext_data_en=1'b0; reg_in_en=8'b00000000; reg_out_en=8'b00000000; alu_out_en=1'b0; end
			4'b0101 : begin a = 16'b0000000000000001; ext_data_en=1'b0; reg_in_en=8'b00000000; reg_out_en=8'b00000000; alu_out_en=1'b0; end
			4'b0110 : begin a = 16'b0000000000000001; ext_data_en=1'b0; reg_in_en=8'b00000000; reg_out_en=8'b00000000; alu_out_en=1'b0; end
			4'b0111 : begin a = 16'b0000000000000001; ext_data_en=1'b0; reg_in_en=8'b00000000; reg_out_en=8'b00000000; alu_out_en=1'b0; end
			4'b1000 : begin a = 16'b0000000000000001; ext_data_en=1'b1; reg_in_en=8'b00000000; reg_out_en=8'b00000000; alu_out_en=1'b0; end
			4'b1001 : begin a = 16'b0000000000000001; ext_data_en=1'b1; reg_in_en=8'b00000000; reg_out_en=8'b00000000; alu_out_en=1'b0; end
			4'b1010 : begin a = 16'b0000000000000001; ext_data_en=1'b1; reg_in_en=8'b00000000; reg_out_en=8'b00000000; alu_out_en=1'b0; end
			4'b1011 : begin a = 16'b0000000000000001; ext_data_en=1'b1; reg_in_en=8'b00000000; reg_out_en=8'b00000000; alu_out_en=1'b0; end
			4'b1100 : begin a = 16'b0000000000000001; ext_data_en=1'b1; reg_in_en=8'b00000001; reg_out_en=8'b00000000; alu_out_en=1'b0; end
			4'b1101 : begin a = 16'b0000000000000001; ext_data_en=1'b0; reg_in_en=8'b00000000; reg_out_en=8'b00000000; alu_out_en=1'b0; end
			4'b1110 : begin a = 16'b0000000000000011; ext_data_en=1'b0; reg_in_en=8'b00000000; reg_out_en=8'b00000001; alu_out_en=1'b0; end
			4'b1111 : begin a = 16'b0000000000000011; ext_data_en=1'b0; reg_in_en=8'b00000000; reg_out_en=8'b00000001; alu_out_en=1'b0; end
			default : begin a = 16'b0000000000000001; ext_data_en=1'b0; reg_in_en=8'b00000000; reg_out_en=8'b00000000; alu_out_en=1'b0; end
		endcase
	end


	initial begin

        $dumpfile("TB_Q4.vcd");

        $dumpvars(0, TB_Q4);

        #2000 

        $finish;

        end

 
endmodule
