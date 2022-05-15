// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Tue Mar 22 17:55:02 2022
// Host        : DESKTOP-S66I69I running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               D:/ES_2022/WT_MML/ES_DCMotor_BaseProj/ES_DCMotor_BaseProj.sim/sim_1/synth/timing/xsim/tb_main_time_synth.v
// Design      : ES_DCMotor_Main
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* NotValidForBitStream *)
module ES_DCMotor_Main
   (CLK100MHz,
    Enc1_A,
    Enc1_B,
    Enc2_A,
    Enc2_B,
    Therm,
    PWM,
    Dir,
    Brake,
    Switch,
    LED);
  input CLK100MHz;
  input Enc1_A;
  input Enc1_B;
  input Enc2_A;
  input Enc2_B;
  input Therm;
  output PWM;
  output Dir;
  output Brake;
  input [15:0]Switch;
  output [15:0]LED;

  wire Brake;
  wire Brake_OBUF;
  wire CLK100MHz;
  wire CLK100MHz_IBUF;
  wire CLK100MHz_IBUF_BUFG;
  wire Dir;
  wire Dir_OBUF;
  wire Enc1_A;
  wire Enc1_A_IBUF;
  wire Enc1_B;
  wire Enc1_B_IBUF;
  wire Enc2_A;
  wire Enc2_A_IBUF;
  wire Enc2_B;
  wire Enc2_B_IBUF;
  wire [15:0]LED;
  wire [15:0]LED_OBUF;
  wire PWM;
  wire PWM_OBUF;
  wire [15:0]Switch;
  wire [15:0]Switch_IBUF;
  wire Therm;
  wire Therm_IBUF;

initial begin
 $sdf_annotate("tb_main_time_synth.sdf",,,,"tool_control");
end
  OBUF Brake_OBUF_inst
       (.I(Brake_OBUF),
        .O(Brake));
  FDRE #(
    .INIT(1'b0)) 
    Brake_reg
       (.C(CLK100MHz_IBUF_BUFG),
        .CE(1'b1),
        .D(Switch_IBUF[2]),
        .Q(Brake_OBUF),
        .R(1'b0));
  BUFG CLK100MHz_IBUF_BUFG_inst
       (.I(CLK100MHz_IBUF),
        .O(CLK100MHz_IBUF_BUFG));
  IBUF CLK100MHz_IBUF_inst
       (.I(CLK100MHz),
        .O(CLK100MHz_IBUF));
  OBUF Dir_OBUF_inst
       (.I(Dir_OBUF),
        .O(Dir));
  FDRE #(
    .INIT(1'b0)) 
    Dir_reg
       (.C(CLK100MHz_IBUF_BUFG),
        .CE(1'b1),
        .D(Switch_IBUF[1]),
        .Q(Dir_OBUF),
        .R(1'b0));
  IBUF Enc1_A_IBUF_inst
       (.I(Enc1_A),
        .O(Enc1_A_IBUF));
  IBUF Enc1_B_IBUF_inst
       (.I(Enc1_B),
        .O(Enc1_B_IBUF));
  IBUF Enc2_A_IBUF_inst
       (.I(Enc2_A),
        .O(Enc2_A_IBUF));
  IBUF Enc2_B_IBUF_inst
       (.I(Enc2_B),
        .O(Enc2_B_IBUF));
  OBUF \LED_OBUF[0]_inst 
       (.I(LED_OBUF[0]),
        .O(LED[0]));
  OBUF \LED_OBUF[10]_inst 
       (.I(LED_OBUF[10]),
        .O(LED[10]));
  OBUF \LED_OBUF[11]_inst 
       (.I(LED_OBUF[11]),
        .O(LED[11]));
  OBUF \LED_OBUF[12]_inst 
       (.I(LED_OBUF[12]),
        .O(LED[12]));
  OBUF \LED_OBUF[13]_inst 
       (.I(LED_OBUF[13]),
        .O(LED[13]));
  OBUF \LED_OBUF[14]_inst 
       (.I(LED_OBUF[14]),
        .O(LED[14]));
  OBUF \LED_OBUF[15]_inst 
       (.I(LED_OBUF[15]),
        .O(LED[15]));
  OBUF \LED_OBUF[1]_inst 
       (.I(LED_OBUF[1]),
        .O(LED[1]));
  OBUF \LED_OBUF[2]_inst 
       (.I(LED_OBUF[2]),
        .O(LED[2]));
  OBUF \LED_OBUF[3]_inst 
       (.I(LED_OBUF[3]),
        .O(LED[3]));
  OBUF \LED_OBUF[4]_inst 
       (.I(LED_OBUF[4]),
        .O(LED[4]));
  OBUF \LED_OBUF[5]_inst 
       (.I(LED_OBUF[5]),
        .O(LED[5]));
  OBUF \LED_OBUF[6]_inst 
       (.I(LED_OBUF[6]),
        .O(LED[6]));
  OBUF \LED_OBUF[7]_inst 
       (.I(LED_OBUF[7]),
        .O(LED[7]));
  OBUF \LED_OBUF[8]_inst 
       (.I(LED_OBUF[8]),
        .O(LED[8]));
  OBUF \LED_OBUF[9]_inst 
       (.I(LED_OBUF[9]),
        .O(LED[9]));
  FDRE #(
    .INIT(1'b0)) 
    \LED_reg[0] 
       (.C(CLK100MHz_IBUF_BUFG),
        .CE(1'b1),
        .D(Enc1_A_IBUF),
        .Q(LED_OBUF[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \LED_reg[10] 
       (.C(CLK100MHz_IBUF_BUFG),
        .CE(1'b1),
        .D(Switch_IBUF[10]),
        .Q(LED_OBUF[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \LED_reg[11] 
       (.C(CLK100MHz_IBUF_BUFG),
        .CE(1'b1),
        .D(Switch_IBUF[11]),
        .Q(LED_OBUF[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \LED_reg[12] 
       (.C(CLK100MHz_IBUF_BUFG),
        .CE(1'b1),
        .D(Switch_IBUF[12]),
        .Q(LED_OBUF[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \LED_reg[13] 
       (.C(CLK100MHz_IBUF_BUFG),
        .CE(1'b1),
        .D(Switch_IBUF[13]),
        .Q(LED_OBUF[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \LED_reg[14] 
       (.C(CLK100MHz_IBUF_BUFG),
        .CE(1'b1),
        .D(Switch_IBUF[14]),
        .Q(LED_OBUF[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \LED_reg[15] 
       (.C(CLK100MHz_IBUF_BUFG),
        .CE(1'b1),
        .D(Switch_IBUF[15]),
        .Q(LED_OBUF[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \LED_reg[1] 
       (.C(CLK100MHz_IBUF_BUFG),
        .CE(1'b1),
        .D(Enc1_B_IBUF),
        .Q(LED_OBUF[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \LED_reg[2] 
       (.C(CLK100MHz_IBUF_BUFG),
        .CE(1'b1),
        .D(Enc2_A_IBUF),
        .Q(LED_OBUF[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \LED_reg[3] 
       (.C(CLK100MHz_IBUF_BUFG),
        .CE(1'b1),
        .D(Enc2_B_IBUF),
        .Q(LED_OBUF[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \LED_reg[4] 
       (.C(CLK100MHz_IBUF_BUFG),
        .CE(1'b1),
        .D(Therm_IBUF),
        .Q(LED_OBUF[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \LED_reg[5] 
       (.C(CLK100MHz_IBUF_BUFG),
        .CE(1'b1),
        .D(Switch_IBUF[5]),
        .Q(LED_OBUF[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \LED_reg[6] 
       (.C(CLK100MHz_IBUF_BUFG),
        .CE(1'b1),
        .D(Switch_IBUF[6]),
        .Q(LED_OBUF[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \LED_reg[7] 
       (.C(CLK100MHz_IBUF_BUFG),
        .CE(1'b1),
        .D(Switch_IBUF[7]),
        .Q(LED_OBUF[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \LED_reg[8] 
       (.C(CLK100MHz_IBUF_BUFG),
        .CE(1'b1),
        .D(Switch_IBUF[8]),
        .Q(LED_OBUF[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \LED_reg[9] 
       (.C(CLK100MHz_IBUF_BUFG),
        .CE(1'b1),
        .D(Switch_IBUF[9]),
        .Q(LED_OBUF[9]),
        .R(1'b0));
  OBUF PWM_OBUF_inst
       (.I(PWM_OBUF),
        .O(PWM));
  FDRE #(
    .INIT(1'b0)) 
    PWM_reg
       (.C(CLK100MHz_IBUF_BUFG),
        .CE(1'b1),
        .D(Switch_IBUF[0]),
        .Q(PWM_OBUF),
        .R(1'b0));
  IBUF \Switch_IBUF[0]_inst 
       (.I(Switch[0]),
        .O(Switch_IBUF[0]));
  IBUF \Switch_IBUF[10]_inst 
       (.I(Switch[10]),
        .O(Switch_IBUF[10]));
  IBUF \Switch_IBUF[11]_inst 
       (.I(Switch[11]),
        .O(Switch_IBUF[11]));
  IBUF \Switch_IBUF[12]_inst 
       (.I(Switch[12]),
        .O(Switch_IBUF[12]));
  IBUF \Switch_IBUF[13]_inst 
       (.I(Switch[13]),
        .O(Switch_IBUF[13]));
  IBUF \Switch_IBUF[14]_inst 
       (.I(Switch[14]),
        .O(Switch_IBUF[14]));
  IBUF \Switch_IBUF[15]_inst 
       (.I(Switch[15]),
        .O(Switch_IBUF[15]));
  IBUF \Switch_IBUF[1]_inst 
       (.I(Switch[1]),
        .O(Switch_IBUF[1]));
  IBUF \Switch_IBUF[2]_inst 
       (.I(Switch[2]),
        .O(Switch_IBUF[2]));
  IBUF \Switch_IBUF[5]_inst 
       (.I(Switch[5]),
        .O(Switch_IBUF[5]));
  IBUF \Switch_IBUF[6]_inst 
       (.I(Switch[6]),
        .O(Switch_IBUF[6]));
  IBUF \Switch_IBUF[7]_inst 
       (.I(Switch[7]),
        .O(Switch_IBUF[7]));
  IBUF \Switch_IBUF[8]_inst 
       (.I(Switch[8]),
        .O(Switch_IBUF[8]));
  IBUF \Switch_IBUF[9]_inst 
       (.I(Switch[9]),
        .O(Switch_IBUF[9]));
  IBUF Therm_IBUF_inst
       (.I(Therm),
        .O(Therm_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
