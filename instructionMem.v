module program_counter (
    input wire clk,
    input wire next,
    output reg [7:0] address
);

    initial begin
        address = 0;
    end

    always @(posedge clk) begin
        case(next)
            1'b1: address = address + 1;
            1'b0: address = address;
        endcase
    end
endmodule

module InstructionMemory (
    input wire [7:0] address,  // Address input
    output reg [15:0] instr  // Output instruction
);

    // Define instruction memory array
    reg [15:0] memory [0:255];  // 256 memory locations, each storing an 16-bit instruction

    // Initialize memory with instructions (example)
    initial begin
        memory[0] = 16'b1111000000000000; // NOP;
        memory[1] = 16'b0000000100000010; // LOAD (low);
        memory[2] = 16'b0000000100000011; // LOAD (high);
        memory[3] = 16'b1111000000000000; // NOP;
        memory[4] = 16'b0001010100010000; // MOV;
        memory[5] = 16'b1111000000000000; // NOP;
        memory[6] = 16'b0101010100010000; // ADD;
        memory[7] = 16'b0101010100010000; // ADD;
        memory[8] = 16'b0101010100010000; // ADD;
        memory[9] = 16'b0101010100010000; // NOP;
        memory[10] = 16'b0111010100010000; // XOR;
        memory[11] = 16'b0111010100010000; // XOR;
        memory[12] = 16'b0111010100010000; // XOR;
        memory[13] = 16'b0111000000000000; // NOP;
        memory[14] = 16'b1111000000000000; // NOP;
        memory[16] = 16'b1111000000000000; // NOP;
        memory[255:17] = 16'b11110000000000; 


        instr = memory[address];
    end

    // Read instruction based on the address input
    always @* begin
        instr = memory[address];
    end

endmodule
