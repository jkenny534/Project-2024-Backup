module FPGA_instantiate (KEY0, KEY1, KEY2, KEY3, KEY4, KEY5, KEY6, KEY7, KEY8, KEY9, SW1 , SW0, HEX0, HEX1, HEX2, HEX3);
 
    input KEY[9:0], SW[3:0];
    output HEX[3:0];
    reg [15:0] T; 
    wire [15:0] R[7:0]; 
    wire [15:0] PC_address;



chip chip(
    .clk(KEY[0]));

processor processor(
    .clk(KEY[0])
);

program_counter pc(
    .clk(KEY[0]),
    .address(PC_address));

datapath dp(
    .myWire[7](R[7]),
    .myWire[6](R[6]),
    .myWire[5](R[5]),
    .myWire[4](R[4]),
    .myWire[3](R[3]),
    .myWire[2](R[2]),
    .myWire[1](R[1]),
    .myWire[0](R[0])
    );

// initial begin
//     T = 16'b0000000000000000
// end

// always @(SW[0]) begin
//     T <= R[0];

// always @(SW[1]) begin
//     T <= R[1];

// always @(SW[2]) begin
//     T <= R[2];

// always @(SW[3]) begin
//     T <= R[3];

// always @(SW[4]) begin
//     T <= R[4];

// always @(SW[5]) begin
//     T <= R[5];

// always @(SW[6]) begin
//     T <= R[6];

// always @(SW[7]) begin
//     T <= R[7];

// always @(SW[8]) begin
//     T <= 16'b0000000000000000;

// always @(SW[9]) begin
//     T <= PC_address;

//     binary_to_7Seg nuggets(
//         .binary(T[3:0]),
//         .sevenSeg(HEX0)
//     );

//     binary_to_7Seg wings(
//         .binary(T[7:4]),
//         .sevenSeg(HEX1)
//     );

//     binary_to_7Seg mcflurry(
//         .binary(T[11:8]),
//         .sevenSeg(HEX2)
//     );

//     binary_to_7Seg yochi(
//         .binary(T[15:12]),
//         .sevenSeg(HEX3)
//     );


// endmodule

// module binary_to_7Seg(binary, sevenSeg);

//     input[3:0] binary;
//     output reg[6:0]  sevenSeg;
    
//     always @(binary) begin
//         case (binary)
//         4'b0000 : begin sevenSeg = 7'b1000000; end //0
//         4'b0001 : begin sevenSeg = 7'b1111001; end //1
//         4'b0010 : begin sevenSeg = 7'b0100100; end //2
//         4'b0011 : begin sevenSeg = 7'b0110000; end //3
//         4'b0100 : begin sevenSeg = 7'b0011001; end //4
//         4'b0101 : begin sevenSeg = 7'b0010010; end //5
//         4'b0110 : begin sevenSeg = 7'b0000010; end //6
//         4'b0111 : begin sevenSeg = 7'b1111000; end //7
//         4'b1000 : begin sevenSeg = 7'b0000000; end //8
//         4'b1001 : begin sevenSeg = 7'b0010000; end //9
//         4'b1010 : begin sevenSeg = 7'b0001000; end //A
//         4'b1011 : begin sevenSeg = 7'b0000011; end //B
//         4'b1100 : begin sevenSeg = 7'b1000110; end //C
//         4'b1101 : begin sevenSeg = 7'b0110001; end //D
//         4'b1110 : begin sevenSeg = 7'b0000110; end //E 
//         4'b1111 : begin sevenSeg = 7'b0001110; end //F
//         default : begin sevenSeg = 7'b1111111; end
//     endcase
//     end
 
// endmodule


    initial begin
        T = 16'b0000000000000000;
    end

    always @(posedge SW[0]) begin
        T <= R[0];
    end

    always @(posedge SW[1]) begin
        T <= R[1];
    end

    always @(posedge SW[2]) begin
        T <= R[2];
    end

    always @(posedge SW[3]) begin
        T <= R[3];
    end

    always @(posedge SW[4]) begin
        T <= R[4];
    end

    always @(posedge SW[5]) begin
        T <= R[5];
    end

    always @(posedge SW[6]) begin
        T <= R[6];
    end

    always @(posedge SW[7]) begin
        T <= R[7];
    end

    always @(posedge SW[8]) begin
        T <= 16'b0000000000000000;
    end

    always @(posedge SW[9]) begin
        T <= PC_address;
    end

    binary_to_7Seg nuggets(
        .binary(T[3:0]),
        .sevenSeg(HEX0)
    );

    binary_to_7Seg wings(
        .binary(T[7:4]),
        .sevenSeg(HEX1)
    );

    binary_to_7Seg mcflurry(
        .binary(T[11:8]),
        .sevenSeg(HEX2)
    );

    binary_to_7Seg yochi(
        .binary(T[15:12]),
        .sevenSeg(HEX3)
    );

endmodule

module binary_to_7Seg(
    input [3:0] binary, 
    output reg [6:0] sevenSeg
);

    always @(binary) begin
        case (binary)
            4'b0000 : sevenSeg = 7'b1000000; // 0
            4'b0001 : sevenSeg = 7'b1111001; // 1
            4'b0010 : sevenSeg = 7'b0100100; // 2
            4'b0011 : sevenSeg = 7'b0110000; // 3
            4'b0100 : sevenSeg = 7'b0011001; // 4
            4'b0101 : sevenSeg = 7'b0010010; // 5
            4'b0110 : sevenSeg = 7'b0000010; // 6
            4'b0111 : sevenSeg = 7'b1111000; // 7
            4'b1000 : sevenSeg = 7'b0000000; // 8
            4'b1001 : sevenSeg = 7'b0010000; // 9
            4'b1010 : sevenSeg = 7'b0001000; // A
            4'b1011 : sevenSeg = 7'b0000011; // B
            4'b1100 : sevenSeg = 7'b1000110; // C
            4'b1101 : sevenSeg = 7'b0110001; // D
            4'b1110 : sevenSeg = 7'b0000110; // E 
            4'b1111 : sevenSeg = 7'b0001110; // F
            default : sevenSeg = 7'b1111111; // default
        endcase
    end

endmodule

