`include "defines.h"

module controlCircuit(
	// INPUTS
	input wire [15:0] instr,
	input wire clk,
	// OUTPUTS
	output reg ext_data_en,
	output reg ext_data_low_reg_en,
	output reg [7:0] reg_in_en,
	output reg [7:0] reg_out_en,
	output reg alu_reg_en,
	output reg alu_sel,
	output reg alu_out_en,
	output reg g_reg_en,
	output reg done
	);

	reg [3:0] opcode, RX, RY;

	reg [4:0] state, next_state;
	reg [7:0] enable_8bit;

	initial begin
		state <= `STATE_RESET;
	end

	always @(negedge clk) begin 
		opcode = instr[15:12];
		RX = instr[11:8];
		RY = instr[7:4];
	    
	    case(opcode)
	        `INSTR_NOP : next_state = `STATE_RESET;
	        `INSTR_LOAD : begin 
	            case (state) 
	                `STATE_RESET : next_state = `STATE_LOAD1;
	                `STATE_LOAD1 : next_state = `STATE_LOAD2;
	                `STATE_LOAD2 : next_state = `STATE_RESET;
	                default : next_state = `STATE_RESET;
	            endcase
	        end
	        `INSTR_MOV : begin
	        	case (state)
	        		`STATE_RESET : next_state = `STATE_MOV;
	        		`STATE_MOV : next_state = `STATE_RESET;
	        		default: next_state = `STATE_RESET;
	        	endcase
			end
            `INSTR_ADD : begin
            	case (state)
            		`STATE_RESET : next_state = `STATE_ALU;
            		`STATE_ALU: next_state = `STATE_ADD;
            		`STATE_ADD : next_state = `STATE_G;
            		`STATE_G : next_state = `STATE_RESET;
            		default: next_state = `STATE_RESET;
            	endcase
            end
			`INSTR_XOR : begin
            	case (state)
            		`STATE_RESET : next_state = `STATE_ALU;
            		`STATE_ALU: next_state = `STATE_XOR;
            		`STATE_XOR : next_state = `STATE_G;
            		`STATE_G : next_state = `STATE_RESET;
            		default: next_state = `STATE_RESET;
            	endcase
            end
            default : next_state = `STATE_RESET;
	    endcase
	   	state <= next_state;
	end

	always @(state) begin // CORRECT
		case (state)
			`STATE_RESET : begin
				ext_data_en = 1'b0;
				ext_data_low_reg_en = 1'b0;
				reg_in_en = 8'b00000000;
				reg_out_en = 8'b00000000;
				alu_reg_en = 1'b0;
				alu_sel = 1'b0;
				alu_out_en = 1'b0;
				g_reg_en = 1'b0;
				done = 1'b1;
			end
			`STATE_LOAD1 : begin
				ext_data_low_reg_en = 1'b1;
				done = 1'b0;
			end
			`STATE_LOAD2 : begin
				ext_data_low_reg_en = 1'b0;
				ext_data_en = 1'b1;
				reg_in_en[RX] = 1'b1;
				done = 1'b0;
			end
			`STATE_MOV : begin
				reg_in_en[RX] = 1'b1;
				reg_out_en[RY] = 1'b1;
				done = 1'b0;
			end
			`STATE_ALU : begin
				reg_out_en[RX] = 1'b1;
				alu_reg_en = 1'b1;
				done = 1'b0;
			end
			`STATE_ADD : begin
				reg_out_en[RX] = 1'b0;
				reg_out_en[RY] = 1'b1;
				alu_reg_en = 1'b0;
				alu_sel = 1'b0;
				g_reg_en = 1'b1;
				done = 1'b0;
			end
			`STATE_XOR : begin
				reg_out_en[RX] = 1'b0;
				reg_out_en[RY] = 1'b1;
				alu_reg_en = 1'b0;
				alu_sel = 1'b1;
				g_reg_en = 1'b1;
				done = 1'b0;
			end
			`STATE_G : begin
				reg_out_en[RY] = 1'b0;
				g_reg_en = 1'b0;
				alu_out_en = 1'b1;
				reg_in_en[RX] = 1'b1;
				done = 1'b0;
			end
            default : begin
                // To handle any undefined states, assign default values again
                ext_data_en = 1'b0;
                reg_in_en = 8'b00000000;
                reg_out_en = 8'b00000000;
                alu_reg_en = 1'b0;
                alu_sel = 1'b0;
                alu_out_en = 1'b0;
                g_reg_en = 1'b0;
                done = 1'b1;
            end			
		endcase
	end


endmodule