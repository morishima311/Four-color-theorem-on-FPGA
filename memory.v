`timescale 1ps/1ps

module memory
(
  input  wire       clk,
  input  wire       rst_n,
  input  wire       we,
  input  wire [7:0] in,
  input  wire [7:0] addr,
  output wire [7:0] out
);

  integer i;
  reg [7:0] mem [255:0];

  always @(posedge clk) begin
    if (!rst_n) begin
      mem[0] <= 8'd1; mem[1] <= 8'd5; mem[2] <= 8'd3; mem[3] <= 8'd2; mem[4] <= 8'd0; mem[5] <= 8'd3; mem[6] <= 8'd1; mem[7] <= 8'd4; mem[8] <= 8'd5; mem[9] <= 8'd1; mem[10] <= 8'd2; 
      mem[11] <= 8'd5; mem[12] <= 8'd3; mem[13] <= 8'd7; mem[14] <= 8'd6; mem[15] <= 8'd12; mem[16] <= 8'd7; mem[17] <= 8'd4; mem[18] <= 8'd3; mem[19] <= 8'd1; mem[20] <= 8'd5; 
      mem[21] <= 8'd11; mem[22] <= 8'd12; mem[23] <= 8'd5; mem[24] <= 8'd4; mem[25] <= 8'd10; mem[26] <= 8'd9; mem[27] <= 8'd8; mem[28] <= 8'd18; mem[29] <= 8'd9; mem[30] <= 8'd7; 
      mem[31] <= 8'd10; mem[32] <= 8'd7; mem[33] <= 8'd8; mem[34] <= 8'd18; mem[35] <= 8'd16; mem[36] <= 8'd13; mem[37] <= 8'd11; mem[38] <= 8'd7; mem[39] <= 8'd9; mem[40] <= 8'd16; 
      mem[41] <= 8'd12; mem[42] <= 8'd12; mem[43] <= 8'd10; mem[44] <= 8'd7; mem[45] <= 8'd14; mem[46] <= 8'd13; mem[47] <= 8'd10; mem[48] <= 8'd11; mem[49] <= 8'd7; mem[50] <= 8'd5; 
      mem[51] <= 8'd14; mem[52] <= 8'd12; mem[53] <= 8'd10; mem[54] <= 8'd16; mem[55] <= 8'd24; mem[56] <= 8'd23; mem[57] <= 8'd15; mem[58] <= 8'd16; mem[59] <= 8'd13; mem[60] <= 8'd12; 
      mem[61] <= 8'd14; mem[62] <= 8'd23; mem[63] <= 8'd16; mem[64] <= 8'd15; mem[65] <= 8'd14; mem[66] <= 8'd13; mem[67] <= 8'd10; mem[68] <= 8'd9; mem[69] <= 8'd18; mem[70] <= 8'd17; 
      mem[71] <= 8'd22; mem[72] <= 8'd23; mem[73] <= 8'd16; mem[74] <= 8'd18; mem[75] <= 8'd22; mem[76] <= 8'd17; mem[77] <= 8'd16; mem[78] <= 8'd9; mem[79] <= 8'd8; mem[80] <= 8'd22; 
      mem[81] <= 8'd21; mem[82] <= 8'd20; mem[83] <= 8'd19; mem[84] <= 8'd18; mem[85] <= 8'd20; mem[86] <= 8'd21; mem[87] <= 8'd19; mem[88] <= 8'd28; mem[89] <= 8'd18; mem[90] <= 8'd22; 
      mem[91] <= 8'd18; mem[92] <= 8'd20; mem[93] <= 8'd28; mem[94] <= 8'd27; mem[95] <= 8'd23; mem[96] <= 8'd16; mem[97] <= 8'd17; mem[98] <= 8'd18; mem[99] <= 8'd21; mem[100] <= 8'd27; 
      mem[101] <= 8'd25; mem[102] <= 8'd24; mem[103] <= 8'd14; mem[104] <= 8'd15; mem[105] <= 8'd16; mem[106] <= 8'd22; mem[107] <= 8'd24; mem[108] <= 8'd14; mem[109] <= 8'd23; mem[110] <= 8'd22; 
      mem[111] <= 8'd25; mem[112] <= 8'd26; mem[113] <= 8'd29; mem[114] <= 8'd24; mem[115] <= 8'd22; mem[116] <= 8'd27; mem[117] <= 8'd26; mem[118] <= 8'd24; mem[119] <= 8'd25; mem[120] <= 8'd27; 
      mem[121] <= 8'd28; mem[122] <= 8'd29; mem[123] <= 8'd25; mem[124] <= 8'd22; mem[125] <= 8'd21; mem[126] <= 8'd28; mem[127] <= 8'd26; mem[128] <= 8'd27; mem[129] <= 8'd20; mem[130] <= 8'd26; 
      mem[131] <= 8'd29; mem[132] <= 8'd30; mem[133] <= 8'd31; mem[134] <= 8'd32; mem[135] <= 8'd21; mem[136] <= 8'd24; mem[137] <= 8'd26; mem[138] <= 8'd28; mem[139] <= 8'd30; mem[140] <= 8'd29; 
      mem[141] <= 8'd28; mem[142] <= 8'd31; mem[143] <= 8'd30; mem[144] <= 8'd28; mem[145] <= 8'd32; mem[146] <= 8'd28; mem[147] <= 8'd31; 

      mem[148] <= 8'd0; mem[149] <= 8'd1; mem[150] <= 8'd5; 
      mem[151] <= 8'd7; mem[152] <= 8'd11; mem[153] <= 8'd14; mem[154] <= 8'd20; mem[155] <= 8'd21; mem[156] <= 8'd28; mem[157] <= 8'd31; mem[158] <= 8'd36; mem[159] <= 8'd42; mem[160] <= 8'd45; 
      mem[161] <= 8'd51; mem[162] <= 8'd55; mem[163] <= 8'd61; mem[164] <= 8'd64; mem[165] <= 8'd73; mem[166] <= 8'd76; mem[167] <= 8'd84; mem[168] <= 8'd86; mem[169] <= 8'd90; mem[170] <= 8'd95; 
      mem[171] <= 8'd103; mem[172] <= 8'd108; mem[173] <= 8'd114; mem[174] <= 8'd118; mem[175] <= 8'd123; mem[176] <= 8'd128; mem[177] <= 8'd136; mem[178] <= 8'd140; mem[179] <= 8'd143; mem[180] <= 8'd146;
      mem[181] <= 8'd148;
      for(i = 182; i < 214+1; i = i + 1) begin
        mem[i] <= 8'h0;
      end
      mem[215] <= 8'b1100_0000;
      mem[216] <= 8'b1111_1001;
      mem[217] <= 8'b1010_0100;
      mem[218] <= 8'b1011_0000;
      mem[219] <= 8'b1001_1001;
      mem[220] <= 8'b1001_0010;
      mem[221] <= 8'b1000_0010;
      mem[222] <= 8'b1101_1000;
      mem[223] <= 8'b1000_0000;
      mem[224] <= 8'b1001_0000;
    end else begin
      if (we) begin
        mem[addr] <= in;
      end
    end
  end

  assign out = mem[addr];

wire[7:0] mem0;
wire[7:0] mem1;
wire[7:0] mem2;
wire[7:0] mem3;
wire[7:0] mem4;
wire[7:0] mem5;
wire[7:0] mem6;
wire[7:0] mem7;
wire[7:0] mem8;
wire[7:0] mem9;
wire[7:0] mem10;
wire[7:0] mem11;
wire[7:0] mem12;
wire[7:0] mem13;
wire[7:0] mem14;
wire[7:0] mem15;
wire[7:0] mem16;
wire[7:0] mem17;
wire[7:0] mem18;
wire[7:0] mem19;
wire[7:0] mem20;
wire[7:0] mem21;
wire[7:0] mem22;
wire[7:0] mem23;
wire[7:0] mem24;
wire[7:0] mem25;
wire[7:0] mem26;
wire[7:0] mem27;
wire[7:0] mem28;
wire[7:0] mem29;
wire[7:0] mem30;
wire[7:0] mem31;
wire[7:0] mem32;

assign mem0 = mem[182];
assign mem1 = mem[183];
assign mem2 = mem[184];
assign mem3 = mem[185];
assign mem4 = mem[186];
assign mem5 = mem[187];
assign mem6 = mem[188];
assign mem7 = mem[189];
assign mem8 = mem[190];
assign mem9 = mem[191];
assign mem10 = mem[192];
assign mem11 = mem[193];
assign mem12 = mem[194];
assign mem13 = mem[195];
assign mem14 = mem[196];
assign mem15 = mem[197];
assign mem16 = mem[198];
assign mem17 = mem[199];
assign mem18 = mem[200];
assign mem19 = mem[201];
assign mem20 = mem[202];
assign mem21 = mem[203];
assign mem22 = mem[204];
assign mem23 = mem[205];
assign mem24 = mem[206];
assign mem25 = mem[207];
assign mem26 = mem[208];
assign mem27 = mem[209];
assign mem28 = mem[210];
assign mem29 = mem[211];
assign mem30 = mem[212];
assign mem31 = mem[213];
assign mem32 = mem[214];

endmodule
