`timescale 1ps/1ps

module imem
(
  input  wire [7:0]  pc,
  output reg  [15:0] op
);

`include "def.h"

  always @(*) begin
    case (pc)

      /*
       * reg0(OFS_SEP) = 148; offset of mem address of separation of adjacent area
       * reg1(OFS_CLR) = 182; offset of mem address of stored color
       * reg2(OFS_LED) = 215; offset of mem address of led digit
       * reg3(OFS_RST) = 225; offset of mem address of rest of mem address
       * reg4(n); area # (0,1,2,...,32)
       * reg5(clr); color # (1,2,3,4) 
       * reg6; color # of adjacent area of n
       * regA; is a memory address of first adjacent area of area n
       * regB; is a memory address of first adjacent area of area n+1
       */
      0  : op = {LI, 8'd148, 4'h0};         // OFS_SEP = 148;
      1  : op = {LI, 8'd182, 4'h1};         // OFS_CLR = 182;
      2  : op = {LI, 8'd215, 4'h2};         // OFS_LED = 215;
      3  : op = {LI, 8'd225, 4'h3};         // OFS_RST = 225;
      4  : op = {LI, 8'd0, 4'h4};           // n = 0;
      5  : op = {LI, 8'd1, 4'h5};           // clr = 1;

      //check()
      6  : op = {ADD, 4'h0, 4'h4, 4'hF};    // regF = OFS_SEP + n;
      7  : op = {LOAD, 4'hF, 4'd0, 4'hA};   // regA = mem[regF];
      8  : op = {ADDI, 4'hF, 8'd1};         // regF++
      9  : op = {LOAD, 4'hF, 4'd0, 4'hB};   // regB = mem[regF];
      //return point1
      10 : op = {LOAD, 4'hA, 4'd0, 4'h6};   // reg6 = mem[regA];
      11 : op = {ADD, 4'h1, 4'h6, 4'hF};    // regF = OFS_CLR + reg6; 
      12 : op = {LOAD, 4'hF, 4'd0, 4'h6};   // reg6 = mem[regF];
      13 : op = {CMP, 4'h6, 4'h5, 4'b0};    // reg6 == clr? (color m is already taken?)
      14 : op = {JNZ, 8'd19, 4'h9};         // reg6 == clr (Yes, it's taken)
      15 : op = {ADDI, 4'hA, 8'd1};         // reg6 != clr (No, it's not) regA++;
      
      16 : op = {CMP, 4'ha, 4'hb, 4'b0};    // regA == regB? (checked all adjacent area?)
      17 : op = {JNZ, 8'd27, 4'h9};         // regA == regB (Yes, go to paint())
      18 : op = {JMP, 8'd10, 4'h9};         // regA != regB (No, go to point1)

      19 : op = {CMPI, 4'h5, 8'd4};         // clr == 4? (tried all color?)
      20 : op = {JNZ, 8'd23, 4'h9};         // clr == 4 (Yes, go back to prev n)
      21 : op = {ADDI, 4'h5, 8'd1};         // clr != 4 (No, clr++)
      22 : op = {JMP, 8'd6, 4'h9};          // go to check() again
      23 : op = {SUBI, 4'h4, 8'd1};         // n--
      24 : op = {ADD, 4'h1, 4'h4, 4'hf};    // regF = OFS_CLR + n;
      25 : op = {LOAD, 4'hf, 4'd0, 4'h5};   // clr = mem[regF];
      26 : op = {JMP, 8'd19, 4'h9};         // go to CMPI clr==4?
      
      //paint()
      27 : op = {ADD, 4'h1, 4'h4, 4'hf};    // regF = OFS_CLR + n;
      28 : op = {STORE, 4'hf, 4'h5, 4'd0};  // mem[regF] = clr;
      29 : op = {CMPI, 4'h4, 8'd32};        // n == 32? (checked all area?)
      30 : op = {JNZ, 8'd34, 4'h9};         // n == 32 (Yes! my work is done)
      31 : op = {ADDI, 4'h4, 8'd1};         // n != 32 (No, n++)
      32 : op = {LI, 8'd1, 4'h5};           // clr = 1;
      33 : op = {JMP, 8'd6, 4'h9};          // go to check()
      
      /*
       * reg5(ten) = 0; the ten's # of n
       * reg6(one) = 0; the one's # of n
       * reg7(clr) = 0; color # of n
       * reg8(bt_stat) = 0; bt_stat;
       * reg9(flag) = 0; 1=pushed 0=not pushed
       * regA;             the leftmost led
       * regB;             the 2nd leftmost led
       * regC = 1111_1111; the 2nd rightmost led, no led light
       * regD;             the rightmost led
       * regE(PB) = FB;    the mem address which push button's state is stored
       */
      34 : op = {LI, 8'd0, 4'h4};           // n = 0;
      35 : op = {LI, 8'd0, 4'h5};           // ten = 0;
      36 : op = {LI, 8'd0, 4'h6};           // one = 0;
      37 : op = {LI, 8'd0, 4'h7};           // clr = 0;
      38 : op = {LI, 8'd0, 4'h8};           // bt_stat = 0;
      39 : op = {LI, 8'd0, 4'h9};           // flag = 0;
      40 : op = {LI, 8'hFB, 4'hE};          // PB = 0xFB
      41 : op = {LI, 8'b1111_1111, 4'hC};   // regC = 1111_1111;

      42 : op = {LOAD, 4'hE, 4'd0, 4'h8};   // bt_stat = mem[PB];
      43 : op = {CMPI, 4'h8, 8'd0};         // bt_stat==0? 
      44 : op = {JNZ, 8'd52, 4'h0};         // unflag
      45 : op = {CMPI, 4'h9, 8'd1};         // flag==1?
      46 : op = {JNZ, 8'd95, 4'h0};        // go to indicate led
      47 : op = {CMPI, 4'h8, 8'b0000_0100}; // bt_stat==right? 
      48 : op = {JNZ, 8'd54, 4'h0};         // go to add_num()
      49 : op = {CMPI, 4'h8, 8'b0000_0010}; // bt_stat==left? 
      50 : op = {JNZ, 8'd70, 4'h0};        // go to sub_num()
      51 : op = {JMP, 8'd95, 4'h0};        // go to indicate led

      52 : op = {LI, 8'd0, 4'h9};          // flag = 0;
      53 : op = {JMP, 8'd86, 4'h0};       // go to set_led()

      //add_num()
      54 : op = {LI, 8'd1, 4'h9};          // flag = 1;
      55 : op = {CMPI, 4'h4, 8'd32};       // n == 32?
      56 : op = {JNZ, 8'd62, 4'h0};
      57 : op = {CMPI, 4'h6, 8'd9};        // one == 9?
      58 : op = {JNZ, 8'd66, 4'h0};

      59 : op = {ADDI, 4'h4, 8'd1};        // n++
      60 : op = {ADDI, 4'h6, 8'd1};        // one++
      61 : op = {JMP, 8'd86, 4'h0};        // go to set_led()

      62 : op = {LI, 8'd0, 4'h4};          // n = 0;
      63 : op = {LI, 8'd0, 4'h5};          // ten = 0;
      64 : op = {LI, 8'd0, 4'h6};          // one = 0;
      65 : op = {JMP, 8'd86, 4'h0};        // go to set_led()

      66 : op = {ADDI, 4'h4, 8'd1};        // n++
      67 : op = {ADDI, 4'h5, 8'd1};        // ten++
      68 : op = {LI, 8'd0, 4'h6};          // one = 0;
      69 : op = {JMP, 8'd86, 4'h0};        // go to set_led()

      //sub_num()
      70 : op = {LI, 8'd1, 4'h9};          // flag = 1;
      71 : op = {CMPI, 4'h4, 8'd0};        // n == 0?
      72 : op = {JNZ, 8'd78, 4'h0};
      73 : op = {CMPI, 4'h6, 8'd0};        // one == 0?
      74 : op = {JNZ, 8'd82, 4'h0};

      75 : op = {SUBI, 4'h4, 8'd1};        // n--
      76 : op = {SUBI, 4'h6, 8'd1};        // one--
      77 : op = {JMP, 8'd86, 4'h0};        // go to set_led()

      78 : op = {LI, 8'd32, 4'h4};         // n = 32;
      79 : op = {LI, 8'd3, 4'h5};          // ten = 3;
      80 : op = {LI, 8'd2, 4'h6};          // one = 2;
      81 : op = {JMP, 8'd86, 4'h0};        // go to set_led()

      82 : op = {SUBI, 4'h4, 8'd1};        // n--
      83 : op = {SUBI, 4'h5, 8'd1};        // ten--
      84 : op = {LI, 8'd9, 4'h6};          // one = 9;
      85 : op = {JMP, 8'd86, 4'h0};        // go to set_led()

      //set_led()
      86 : op = {ADD, 4'h1, 4'h4, 4'hF};    // regF = OFS_CLR + n;
      87 : op = {LOAD, 4'hF, 4'd0, 4'h7};   // clr = mem[regF];
      88 : op = {ADD, 4'h2, 4'h5, 4'hF};    // regF = OFS_LED + ten;
      89 : op = {LOAD, 4'hF, 4'd0, 4'hA};   // regA = mem[regF];
      90 : op = {ADD, 4'h2, 4'h6, 4'hF};    // regF = OFS_LED + one;
      91 : op = {LOAD, 4'hF, 4'd0, 4'hB};   // regB = mem[regF];
      92 : op = {ADD, 4'h2, 4'h7, 4'hF};    // regF = OFS_LED + clr;
      93 : op = {LOAD, 4'hF, 4'd0, 4'hD};   // regD = mem[regF];
      94 : op = {JMP, 8'd95, 4'h0};        // go to indicate led

      // indicate led()
      95 : op = {LI, 8'hFF, 4'hF};          // regF = FF;
      96 : op = {STORE, 4'hF, 4'hA, 4'd0};  // mem[regF] = regA;
      97 : op = {LI, 8'hFE, 4'hF};          // regF = FE;
      98 : op = {STORE, 4'hF, 4'hB, 4'd0};  // mem[regF] = regB;
      99 : op = {LI, 8'hFD, 4'hF};          // regF = FD;
     100 : op = {STORE, 4'hF, 4'hC, 4'd0};  // mem[regF] = regC;
     101 : op = {LI, 8'hFC, 4'hF};          // regF = FC;
     102 : op = {STORE, 4'hF, 4'hD, 4'd0};  // mem[regF] = regD;
     103 : op = {JMP, 8'd42, 4'h0};         // go to read PB
      
      default: op = 16'bx;
    endcase
  end

endmodule
