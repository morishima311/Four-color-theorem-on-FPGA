`timescale 1ps/1ps

module register
(
  input  wire       clk,
  input  wire       rst_n,
  input  wire       we,
  input  wire [3:0] src0,
  input  wire [3:0] src1,
  input  wire [3:0] dst,
  input  wire [7:0] data,
  output wire [7:0] data0,
  output wire [7:0] data1
);

  reg [7:0] regis [15:0];

  always @(posedge clk) begin
    if(!rst_n) begin
      regis[0]  <= 0;
      regis[1]  <= 0;
      regis[2]  <= 0;
      regis[3]  <= 0;
      regis[4]  <= 0;
      regis[5]  <= 0;
      regis[6]  <= 0;
      regis[7]  <= 0;
      regis[8]  <= 0;
      regis[9]  <= 0;
      regis[10] <= 0;
      regis[11] <= 0;
      regis[12] <= 0;
      regis[13] <= 0;
      regis[14] <= 0;
      regis[15] <= 0;
    end else begin
      if (we) begin
        regis[dst] <= data;
      end
    end
  end
  
  assign data0 = regis[src0];
  assign data1 = regis[src1];

  wire [7:0] reg0;
  wire [7:0] reg1;
  wire [7:0] reg2;
  wire [7:0] reg3;
  wire [7:0] reg4;
  wire [7:0] reg5;
  wire [7:0] reg6;
  wire [7:0] reg7;
  wire [7:0] reg8;
  wire [7:0] reg9;
  wire [7:0] reg10;
  wire [7:0] reg11;
  wire [7:0] reg12;
  wire [7:0] reg13;
  wire [7:0] reg14;
  wire [7:0] reg15;

  assign reg1 = regis[1];
  assign reg2 = regis[2];
  assign reg3 = regis[3];
  assign reg4 = regis[4];
  assign reg5 = regis[5];
  assign reg6 = regis[6];
  assign reg7 = regis[7];
  assign reg8 = regis[8];
  assign reg9 = regis[9];
  assign reg10 = regis[10];
  assign reg11 = regis[11];
  assign reg12 = regis[12];
  assign reg13 = regis[13];
  assign reg14 = regis[14];
  assign reg15 = regis[15];
endmodule
