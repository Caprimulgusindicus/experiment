-- Copyright (C) 1991-2006 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM "Quartus II"
-- VERSION "Version 6.0 Build 178 04/27/2006 SJ Full Version"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY EXEX IS 
	port
	(
		CLK_273 :  IN  STD_LOGIC;
		BUS2 :  IN  STD_LOGIC;
		BUS1 :  IN  STD_LOGIC;
		BUS3 :  IN  STD_LOGIC;
		BUS4 :  IN  STD_LOGIC;
		BUS5 :  IN  STD_LOGIC;
		BUS6 :  IN  STD_LOGIC;
		BUS7 :  IN  STD_LOGIC;
		BUS0 :  IN  STD_LOGIC;
		LDRi :  IN  STD_LOGIC;
		LDR1N :  IN  STD_LOGIC;
		LDR3N :  IN  STD_LOGIC;
		R2BUSN :  IN  STD_LOGIC;
		RSBUS :  IN  STD_LOGIC;
		RDBUS :  IN  STD_LOGIC;
		IR7 :  OUT  STD_LOGIC;
		IR6 :  OUT  STD_LOGIC;
		IR5 :  OUT  STD_LOGIC;
		IR4 :  OUT  STD_LOGIC;
		IR3 :  OUT  STD_LOGIC;
		IR2 :  OUT  STD_LOGIC;
		IR1 :  OUT  STD_LOGIC;
		IR0 :  OUT  STD_LOGIC;
		LDR0 :  OUT  STD_LOGIC;
		LDR1 :  OUT  STD_LOGIC;
		LDR2 :  OUT  STD_LOGIC;
		LDR3 :  OUT  STD_LOGIC;
		TEST1 :  OUT  STD_LOGIC;
		TEST2 :  OUT  STD_LOGIC;
		R0BUS :  OUT  STD_LOGIC;
		R1BUS :  OUT  STD_LOGIC;
		R2BUS :  OUT  STD_LOGIC
	);
END EXEX;

ARCHITECTURE bdf_type OF EXEX IS 

component a7455
	PORT(A : IN STD_LOGIC;
		 B : IN STD_LOGIC;
		 C : IN STD_LOGIC;
		 D : IN STD_LOGIC;
		 E : IN STD_LOGIC;
		 F : IN STD_LOGIC;
		 G : IN STD_LOGIC;
		 H : IN STD_LOGIC;
		 YN : OUT STD_LOGIC
	);
end component;

component a7411
	PORT(b : IN STD_LOGIC;
		 c : IN STD_LOGIC;
		 d : IN STD_LOGIC;
		 a : OUT STD_LOGIC
	);
end component;

component a7432
	PORT(b : IN STD_LOGIC;
		 c : IN STD_LOGIC;
		 a : OUT STD_LOGIC
	);
end component;

component a74240
	PORT(b : IN STD_LOGIC;
		 c : IN STD_LOGIC;
		 d : IN STD_LOGIC;
		 e : IN STD_LOGIC;
		 a : OUT STD_LOGIC
	);
end component;

component a74273
	PORT(D1 : IN STD_LOGIC;
		 D2 : IN STD_LOGIC;
		 D3 : IN STD_LOGIC;
		 D4 : IN STD_LOGIC;
		 D5 : IN STD_LOGIC;
		 D6 : IN STD_LOGIC;
		 D7 : IN STD_LOGIC;
		 D8 : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 CLRN : IN STD_LOGIC;
		 Q1 : OUT STD_LOGIC;
		 Q2 : OUT STD_LOGIC;
		 Q3 : OUT STD_LOGIC;
		 Q4 : OUT STD_LOGIC;
		 Q5 : OUT STD_LOGIC;
		 Q6 : OUT STD_LOGIC;
		 Q7 : OUT STD_LOGIC;
		 Q8 : OUT STD_LOGIC
	);
end component;

signal	a :  STD_LOGIC;
signal	b :  STD_LOGIC;
signal	c :  STD_LOGIC;
signal	d :  STD_LOGIC;
signal	e :  STD_LOGIC;
signal	f :  STD_LOGIC;
signal	g :  STD_LOGIC;
signal	h :  STD_LOGIC;
signal	IR_ALTERA_SYNTHESIZED0 :  STD_LOGIC;
signal	IR_ALTERA_SYNTHESIZED1 :  STD_LOGIC;
signal	IR_ALTERA_SYNTHESIZED2 :  STD_LOGIC;
signal	IR_ALTERA_SYNTHESIZED3 :  STD_LOGIC;
signal	LDE1 :  STD_LOGIC;
signal	R1BUS_ALTERA_SYNTHESIZED :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_11 :  STD_LOGIC;


BEGIN 
IR7 <= SYNTHESIZED_WIRE_6;
IR6 <= SYNTHESIZED_WIRE_5;
IR5 <= SYNTHESIZED_WIRE_4;
IR4 <= SYNTHESIZED_WIRE_3;
TEST1 <= SYNTHESIZED_WIRE_12;
SYNTHESIZED_WIRE_11 <= '1';



f <= NOT(e);


e <= NOT(IR_ALTERA_SYNTHESIZED3);


b2v_inst22 : a7455
PORT MAP(A => RSBUS,
		 B => e,
		 C => g,
		 D => g,
		 E => c,
		 F => a,
		 G => RDBUS,
		 H => RDBUS,
		 YN => R0BUS);

b2v_inst23 : a7455
PORT MAP(A => RSBUS,
		 B => e,
		 C => h,
		 D => h,
		 E => RDBUS,
		 F => RDBUS,
		 G => a,
		 H => d,
		 YN => R1BUS_ALTERA_SYNTHESIZED);

b2v_inst24 : a7455
PORT MAP(A => RSBUS,
		 B => f,
		 C => g,
		 D => g,
		 E => RDBUS,
		 F => b,
		 G => b,
		 H => c,
		 YN => SYNTHESIZED_WIRE_0);

b2v_inst26 : a7411
PORT MAP(b => R1BUS_ALTERA_SYNTHESIZED,
		 c => R1BUS_ALTERA_SYNTHESIZED,
		 d => SYNTHESIZED_WIRE_0,
		 a => R2BUS);

b2v_inst27 : a7411
PORT MAP(b => a,
		 c => c,
		 d => LDRi,
		 a => LDR0);

b2v_inst28 : a7411
PORT MAP(b => a,
		 c => d,
		 d => LDRi,
		 a => SYNTHESIZED_WIRE_1);

b2v_inst29 : a7411
PORT MAP(b => b,
		 c => c,
		 d => LDRi,
		 a => LDR2);

h <= NOT(g);


b2v_inst30 : a7411
PORT MAP(b => b,
		 c => d,
		 d => LDRi,
		 a => SYNTHESIZED_WIRE_2);

b2v_inst31 : a7432
PORT MAP(b => LDR1N,
		 c => SYNTHESIZED_WIRE_1);

b2v_inst32 : a7432
PORT MAP(b => SYNTHESIZED_WIRE_2,
		 c => LDR3N,
		 a => LDR3);

b2v_inst33 : a74240
PORT MAP(b => SYNTHESIZED_WIRE_3,
		 c => SYNTHESIZED_WIRE_4,
		 d => SYNTHESIZED_WIRE_5,
		 e => SYNTHESIZED_WIRE_6,
		 a => SYNTHESIZED_WIRE_12);

b2v_inst34 : a74240
PORT MAP(b => SYNTHESIZED_WIRE_12,
		 c => SYNTHESIZED_WIRE_12,
		 d => SYNTHESIZED_WIRE_12,
		 e => SYNTHESIZED_WIRE_12,
		 a => TEST2);

b2v_inst35 : a74273
PORT MAP(D1 => BUS0,
		 D2 => BUS1,
		 D3 => BUS2,
		 D4 => BUS3,
		 D5 => BUS4,
		 D6 => BUS5,
		 D7 => BUS6,
		 D8 => BUS7,
		 CLK => CLK_273,
		 CLRN => SYNTHESIZED_WIRE_11,
		 Q1 => IR_ALTERA_SYNTHESIZED0,
		 Q2 => IR_ALTERA_SYNTHESIZED1,
		 Q3 => IR_ALTERA_SYNTHESIZED2,
		 Q4 => IR_ALTERA_SYNTHESIZED3,
		 Q5 => SYNTHESIZED_WIRE_3,
		 Q6 => SYNTHESIZED_WIRE_4,
		 Q7 => SYNTHESIZED_WIRE_5,
		 Q8 => SYNTHESIZED_WIRE_6);

g <= NOT(IR_ALTERA_SYNTHESIZED2);


b <= NOT(a);


a <= NOT(IR_ALTERA_SYNTHESIZED1);


d <= NOT(c);


c <= NOT(IR_ALTERA_SYNTHESIZED0);

IR3 <= IR_ALTERA_SYNTHESIZED3;
IR2 <= IR_ALTERA_SYNTHESIZED2;
IR1 <= IR_ALTERA_SYNTHESIZED1;
IR0 <= IR_ALTERA_SYNTHESIZED0;
R1BUS <= R1BUS_ALTERA_SYNTHESIZED;

END; 