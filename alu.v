module alu (
   input [15:0] A, B,  // ALU 16-bit Inputs                 
   input sel, // ALU Operation Selection
   output [15:0] out   // ALU 16-bit Output
   );
    // Continuous assignment using a case statement with ternary operators
    assign out = (sel == 1'b0) ? (A + B) :          // ADD
                 (sel == 1'b1) ? (A ^ B) :          // XOR
                 16'b0;                             // Default case

endmodule
