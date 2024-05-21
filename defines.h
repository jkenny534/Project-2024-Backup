`ifndef DEFINES
`define DEFINES

`define INSTR_LOAD 		4'b0000
`define INSTR_MOV 		4'b0001
`define INSTR_ADD		4'b0101
`define INSTR_XOR		4'b0111
`define INSTR_NOP		4'b1111

`define STATE_RESET		5'b00000
`define STATE_LOAD1		5'b00001
`define STATE_LOAD2		5'b10000
`define STATE_MOV		5'b00010
`define STATE_ALU		5'b00011
`define STATE_ADD		5'b00101
`define STATE_G			5'b00100
`define STATE_XOR 		5'b00111

`define REG_0 			4'b0000
`define REG_1 			4'b0001
`define REG_2 			4'b0010
`define REG_3 			4'b0011
`define REG_4 			4'b0100
`define REG_5 			4'b0101
`define REG_6 			4'b0110
`define REG_7 			4'b0111




`endif