module gated_RS (clk, R, S, Q, Qnot, en);
   input  R, S, clk, en;
   output Q, Qnot;
   
   wire   R_g, S_g, Qa, Qb /* synthesis keep */;
   
   assign R_g = ~(R&clk & en);
   assign S_g = ~(S & en);
   assign Qa = ~(Qnot&S_g);
   assign Qb = ~(Q&R_g);
   
   assign Q = Qa;
   assign Qnot = Qb;
   
endmodule

module gated_DLatch (clk, D, Q, Qnot, en);
   input  D, clk, en;
   output Q, Qnot;
   
   // You will need to instantiate gated_RS and modify relevant signals

   
   wire R, S;

   // Instantiate gated_RS module
   gated_RS gated_rs_instance (
      .clk(clk),   
      .R(R),        
      .S(S),
      .en(en),       
      .Q(Q),     
      .Qnot(Qnot) 
   );

  
   assign R = ~D;
   assign S = D;
   
endmodule

module master_slave (clk, D, Q, Qnot, en);
   input  D, clk, en;
   output Q, Qnot;
   
   wire Qm;
   wire Qs, Qnots;

gated_DLatch gated_dLatch1 (  //this is the master
      .D(D),
      .clk(~clk),
      .Q(Qm),
      .en(en)
   );

   gated_DLatch gated_dLatch2 ( // this is the slave
      .D(Qm), // Connect the output of the first latch to the second latch input
      .clk(clk),
      .Q(Qs),
      .Qnot(Qnots),
      .en(en)
   );

   assign Q = Qs;
   assign Qnot = Qnots;
   
endmodule

module reg16_bit(
    input wire clk,        // Clock input
    input wire en,
    input wire [15:0] data_in,  // Data input (16 bits)
    output wire [15:0] data_out // Data output (16 bits)
);

// Instantiating 16 instances of the master_slave module
master_slave winterfell (
   .clk(clk), 
   .D(data_in[0]), 
   .Q(data_out[0]), 
   .en(en)
);

master_slave casterlyrock (
   .clk(clk), 
   .D(data_in[1]), 
   .Q(data_out[1]), 
   .en(en)
);

master_slave riverun (
   .clk(clk), 
   .D(data_in[2]), 
   .Q(data_out[2]), 
   .en(en)
);

master_slave vale (
   .clk(clk), 
   .D(data_in[3]), 
   .Q(data_out[3]), 
   .en(en)
);

master_slave sunspear (
   .clk(clk), 
   .D(data_in[4]), 
   .Q(data_out[4]), 
   .en(en)
);

master_slave meereen (
   .clk(clk), 
   .D(data_in[5]), 
   .Q(data_out[5]), 
   .en(en)
);

master_slave braavos (
   .clk(clk), 
   .D(data_in[6]), 
   .Q(data_out[6]), 
   .en(en)
);

master_slave hardhome (
   .clk(clk), 
   .D(data_in[7]), 
   .Q(data_out[7]), 
   .en(en)
);

master_slave harrenhall (
   .clk(clk), 
   .D(data_in[8]), 
   .Q(data_out[8]), 
   .en(en)
);

master_slave kingslanding (
   .clk(clk), 
   .D(data_in[9]), 
   .Q(data_out[9]), 
   .en(en)
);

master_slave dragonstone (
   .clk(clk), 
   .D(data_in[10]), 
   .Q(data_out[10]), 
   .en(en)
);

master_slave highgarden (
   .clk(clk), 
   .D(data_in[11]), 
   .Q(data_out[11]), 
   .en(en)
);

master_slave pyke (
   .clk(clk), 
   .D(data_in[12]), 
   .Q(data_out[12]), 
   .en(en)
);

master_slave thewall (
   .clk(clk), 
   .D(data_in[13]), 
   .Q(data_out[13]), 
   .en(en)
);

master_slave astapor (
   .clk(clk), 
   .D(data_in[14]), 
   .Q(data_out[14]), 
   .en(en)
);

master_slave valyria (
   .clk(clk), 
   .D(data_in[15]), 
   .Q(data_out[15]), 
   .en(en)
);

endmodule

module reg8_bit(
    input wire clk,        // Clock input
    input wire en,
    input wire [7:0] data_in,  // Data input (16 bits)
    output wire [7:0] data_out // Data output (16 bits)
);

// Instantiating 16 instances of the master_slave module
master_slave winterfell (
   .clk(clk), 
   .D(data_in[0]), 
   .Q(data_out[0]), 
   .en(en)
);

master_slave casterlyrock (
   .clk(clk), 
   .D(data_in[1]), 
   .Q(data_out[1]), 
   .en(en)
);

master_slave riverun (
   .clk(clk), 
   .D(data_in[2]), 
   .Q(data_out[2]), 
   .en(en)
);

master_slave vale (
   .clk(clk), 
   .D(data_in[3]), 
   .Q(data_out[3]), 
   .en(en)
);

master_slave sunspear (
   .clk(clk), 
   .D(data_in[4]), 
   .Q(data_out[4]), 
   .en(en)
);

master_slave meereen (
   .clk(clk), 
   .D(data_in[5]), 
   .Q(data_out[5]), 
   .en(en)
);

master_slave braavos (
   .clk(clk), 
   .D(data_in[6]), 
   .Q(data_out[6]), 
   .en(en)
);

master_slave hardhome (
   .clk(clk), 
   .D(data_in[7]), 
   .Q(data_out[7]), 
   .en(en)
);

endmodule