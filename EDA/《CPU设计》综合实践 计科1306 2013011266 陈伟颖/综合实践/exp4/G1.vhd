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

ENTITY G1 IS 
	port
	(
		T3 :  IN  STD_LOGIC;
		U5_1 :  IN  STD_LOGIC;
		U5_2 :  IN  STD_LOGIC;
		U5_3 :  IN  STD_LOGIC;
		U4_1 :  IN  STD_LOGIC;
		U4_2 :  IN  STD_LOGIC;
		U6_1 :  IN  STD_LOGIC;
		U6_2 :  IN  STD_LOGIC;
		U6_3 :  IN  STD_LOGIC;
		U6_45 :  IN  STD_LOGIC;
		CLR :  IN  STD_LOGIC;
		MIR0 :  IN  STD_LOGIC;
		MIR1 :  IN  STD_LOGIC;
		MIR2 :  IN  STD_LOGIC;
		MIR3 :  IN  STD_LOGIC;
		MIR4 :  IN  STD_LOGIC;
		MIR5 :  IN  STD_LOGIC;
		MIR6 :  IN  STD_LOGIC;
		T4 :  IN  STD_LOGIC;
		IR0 :  IN  STD_LOGIC;
		IR1 :  IN  STD_LOGIC;
		IR2 :  IN  STD_LOGIC;
		IR3 :  IN  STD_LOGIC;
		IR4 :  IN  STD_LOGIC;
		IR5 :  IN  STD_LOGIC;
		IR6 :  IN  STD_LOGIC;
		IR7 :  IN  STD_LOGIC;
		CY :  IN  STD_LOGIC;
		TX1 :  IN  STD_LOGIC;
		TX2 :  IN  STD_LOGIC;
		TX3 :  IN  STD_LOGIC;
		TX4 :  IN  STD_LOGIC;
		TX5 :  IN  STD_LOGIC;
		TX6 :  IN  STD_LOGIC;
		TX7 :  IN  STD_LOGIC;
		RIL :  IN  STD_LOGIC;
		a0F :  IN  STD_LOGIC;
		CLK_273 :  OUT  STD_LOGIC;
		LDDR1 :  OUT  STD_LOGIC;
		LDDR2 :  OUT  STD_LOGIC;
		P1 :  OUT  STD_LOGIC;
		P2 :  OUT  STD_LOGIC;
		P3 :  OUT  STD_LOGIC;
		P4 :  OUT  STD_LOGIC;
		P5 :  OUT  STD_LOGIC;
		P6 :  OUT  STD_LOGIC;
		P7 :  OUT  STD_LOGIC;
		P9 :  OUT  STD_LOGIC;
		P10 :  OUT  STD_LOGIC;
		LDPC :  OUT  STD_LOGIC;
		LDR1N :  OUT  STD_LOGIC;
		LDR3N :  OUT  STD_LOGIC;
		CN :  OUT  STD_LOGIC;
		MAR0 :  OUT  STD_LOGIC;
		MAR1 :  OUT  STD_LOGIC;
		MAR2 :  OUT  STD_LOGIC;
		MAR3 :  OUT  STD_LOGIC;
		MAR4 :  OUT  STD_LOGIC;
		MAR5 :  OUT  STD_LOGIC;
		MAR6 :  OUT  STD_LOGIC;
		TX_4 :  OUT  STD_LOGIC;
		TX_5 :  OUT  STD_LOGIC;
		TX_6 :  OUT  STD_LOGIC;
		TX_7 :  OUT  STD_LOGIC;
		LDIRN :  OUT  STD_LOGIC;
		P11 :  OUT  STD_LOGIC;
		P12 :  OUT  STD_LOGIC;
		P7N :  OUT  STD_LOGIC;
		RSBUS :  OUT  STD_LOGIC;
		RDBUS :  OUT  STD_LOGIC;
		R2BUSN :  OUT  STD_LOGIC;
		SWBUS :  OUT  STD_LOGIC;
		ALUBUS :  OUT  STD_LOGIC;
		PCBUS :  OUT  STD_LOGIC
	);
END G1;

ARCHITECTURE bdf_type OF G1 IS 

component a74138
	PORT(G1 : IN STD_LOGIC;
		 G2AN : IN STD_LOGIC;
		 G2BN : IN STD_LOGIC;
		 A : IN STD_LOGIC;
		 B : IN STD_LOGIC;
		 C : IN STD_LOGIC;
		 Y0N : OUT STD_LOGIC;
		 Y1N : OUT STD_LOGIC;
		 Y2N : OUT STD_LOGIC;
		 Y3N : OUT STD_LOGIC;
		 Y4N : OUT STD_LOGIC;
		 Y5N : OUT STD_LOGIC;
		 Y6N : OUT STD_LOGIC;
		 Y7N : OUT STD_LOGIC
	);
end component;

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

component a7410
	PORT(b : IN STD_LOGIC;
		 c : IN STD_LOGIC;
		 d : IN STD_LOGIC;
		 a : OUT STD_LOGIC
	);
end component;

component a74240
	PORT(a1GN : IN STD_LOGIC;
		 a1A1 : IN STD_LOGIC;
		 a1A2 : IN STD_LOGIC;
		 a1A3 : IN STD_LOGIC;
		 a1A4 : IN STD_LOGIC;
		 a2GN : IN STD_LOGIC;
		 a2A1 : IN STD_LOGIC;
		 a2A2 : IN STD_LOGIC;
		 a2A3 : IN STD_LOGIC;
		 a2A4 : IN STD_LOGIC;
		 a1Y1 : OUT STD_LOGIC;
		 a1Y2 : OUT STD_LOGIC;
		 a1Y3 : OUT STD_LOGIC;
		 a1Y4 : OUT STD_LOGIC;
		 a2Y1 : OUT STD_LOGIC;
		 a2Y2 : OUT STD_LOGIC;
		 a2Y3 : OUT STD_LOGIC;
		 a2Y4 : OUT STD_LOGIC
	);
end component;

signal	LDIRN_ALTERA_SYNTHESIZED :  STD_LOGIC;
signal	P7N_ALTERA_SYNTHESIZED :  STD_LOGIC;
signal	P_ALTERA_SYNTHESIZED1 :  STD_LOGIC;
signal	P_ALTERA_SYNTHESIZED2 :  STD_LOGIC;
signal	P_ALTERA_SYNTHESIZED3 :  STD_LOGIC;
signal	P_ALTERA_SYNTHESIZED4 :  STD_LOGIC;
signal	P_ALTERA_SYNTHESIZED5 :  STD_LOGIC;
signal	P_ALTERA_SYNTHESIZED6 :  STD_LOGIC;
signal	RDBUS_ALTERA_SYNTHESIZED :  STD_LOGIC;
signal	RSBUS_ALTERA_SYNTHESIZED :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_47 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_48 :  STD_LOGIC;
signal	DFF_inst21 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_49 :  STD_LOGIC;
signal	DFF_inst22 :  STD_LOGIC;
signal	DFF_inst23 :  STD_LOGIC;
signal	DFF_inst24 :  STD_LOGIC;
signal	DFF_inst25 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_11 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_13 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_14 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_50 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_16 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_17 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_19 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_51 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_21 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_22 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_23 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_24 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_26 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_27 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_29 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_30 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_31 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_32 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_34 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_35 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_36 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_37 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_52 :  STD_LOGIC;
signal	DFF_inst19 :  STD_LOGIC;
signal	DFF_inst20 :  STD_LOGIC;


BEGIN 
SYNTHESIZED_WIRE_47 <= '1';
SYNTHESIZED_WIRE_48 <= '0';
SYNTHESIZED_WIRE_9 <= '0';
SYNTHESIZED_WIRE_50 <= '0';
SYNTHESIZED_WIRE_51 <= '0';



b2v_inst : a74138
PORT MAP(G1 => SYNTHESIZED_WIRE_47,
		 G2AN => SYNTHESIZED_WIRE_48,
		 G2BN => SYNTHESIZED_WIRE_48,
		 A => U4_1,
		 B => U4_2,
		 C => SYNTHESIZED_WIRE_48,
		 Y1N => SYNTHESIZED_WIRE_16,
		 Y2N => SYNTHESIZED_WIRE_19,
		 Y3N => SYNTHESIZED_WIRE_17);

process(DFF_inst21,SYNTHESIZED_WIRE_49)
begin
if (SYNTHESIZED_WIRE_49 = '1') then
	MAR4 <= DFF_inst21;
else
	MAR4 <= 'Z';
end if;
end process;


process(DFF_inst22,SYNTHESIZED_WIRE_49)
begin
if (SYNTHESIZED_WIRE_49 = '1') then
	MAR3 <= DFF_inst22;
else
	MAR3 <= 'Z';
end if;
end process;


process(DFF_inst23,SYNTHESIZED_WIRE_49)
begin
if (SYNTHESIZED_WIRE_49 = '1') then
	MAR2 <= DFF_inst23;
else
	MAR2 <= 'Z';
end if;
end process;


process(DFF_inst24,SYNTHESIZED_WIRE_49)
begin
if (SYNTHESIZED_WIRE_49 = '1') then
	MAR1 <= DFF_inst24;
else
	MAR1 <= 'Z';
end if;
end process;


process(DFF_inst25,SYNTHESIZED_WIRE_49)
begin
if (SYNTHESIZED_WIRE_49 = '1') then
	MAR0 <= DFF_inst25;
else
	MAR0 <= 'Z';
end if;
end process;


process(T3,CLR,TX1)
begin
if (CLR = '0') then
	DFF_inst19 <= '0';
elsif (TX1 = '0') then
	DFF_inst19 <= '1';
elsif (rising_edge(T3)) then
	DFF_inst19 <= MIR6;
end if;
end process;

process(T3,CLR,TX2)
begin
if (CLR = '0') then
	DFF_inst20 <= '0';
elsif (TX2 = '0') then
	DFF_inst20 <= '1';
elsif (rising_edge(T3)) then
	DFF_inst20 <= MIR5;
end if;
end process;

process(T3,CLR,TX3)
begin
if (CLR = '0') then
	DFF_inst21 <= '0';
elsif (TX3 = '0') then
	DFF_inst21 <= '1';
elsif (rising_edge(T3)) then
	DFF_inst21 <= MIR4;
end if;
end process;

process(T3,CLR,TX4)
begin
if (CLR = '0') then
	DFF_inst22 <= '0';
elsif (TX4 = '0') then
	DFF_inst22 <= '1';
elsif (rising_edge(T3)) then
	DFF_inst22 <= MIR3;
end if;
end process;

process(T3,CLR,TX5)
begin
if (CLR = '0') then
	DFF_inst23 <= '0';
elsif (TX5 = '0') then
	DFF_inst23 <= '1';
elsif (rising_edge(T3)) then
	DFF_inst23 <= MIR2;
end if;
end process;

process(T3,CLR,TX6)
begin
if (CLR = '0') then
	DFF_inst24 <= '0';
elsif (TX6 = '0') then
	DFF_inst24 <= '1';
elsif (rising_edge(T3)) then
	DFF_inst24 <= MIR1;
end if;
end process;

process(T3,CLR,TX7)
begin
if (CLR = '0') then
	DFF_inst25 <= '0';
elsif (TX7 = '0') then
	DFF_inst25 <= '1';
elsif (rising_edge(T3)) then
	DFF_inst25 <= MIR0;
end if;
end process;

b2v_inst26 : a7455
PORT MAP(A => T4,
		 B => P_ALTERA_SYNTHESIZED1,
		 C => IR7,
		 D => IR7,
		 E => T4,
		 F => P_ALTERA_SYNTHESIZED3,
		 G => CY,
		 H => CY,
		 YN => TX_4);

b2v_inst28 : a7455
PORT MAP(A => T4,
		 B => P_ALTERA_SYNTHESIZED1,
		 C => IR6,
		 D => IR6,
		 E => T4,
		 F => P_ALTERA_SYNTHESIZED6,
		 G => a0F,
		 H => a0F,
		 YN => TX_5);

b2v_inst29 : a7455
PORT MAP(A => T4,
		 B => P_ALTERA_SYNTHESIZED1,
		 C => IR5,
		 D => IR5,
		 E => T4,
		 F => P_ALTERA_SYNTHESIZED2,
		 G => IR3,
		 H => IR3,
		 YN => SYNTHESIZED_WIRE_10);

b2v_inst30 : a7455
PORT MAP(A => T4,
		 B => P_ALTERA_SYNTHESIZED4,
		 C => IR1,
		 D => IR1,
		 E => T4,
		 F => P_ALTERA_SYNTHESIZED5,
		 G => RIL,
		 H => RIL,
		 YN => SYNTHESIZED_WIRE_11);

SYNTHESIZED_WIRE_49 <= NOT(SYNTHESIZED_WIRE_9);


b2v_inst37 : a7411
PORT MAP(b => SYNTHESIZED_WIRE_10,
		 d => SYNTHESIZED_WIRE_11,
		 a => TX_6);

b2v_inst38 : a7411
PORT MAP(b => SYNTHESIZED_WIRE_12,
		 c => SYNTHESIZED_WIRE_13,
		 d => SYNTHESIZED_WIRE_14,
		 a => TX_7);

b2v_inst39 : a7411
PORT MAP(b => T4,
		 c => T4,
		 d => LDIRN_ALTERA_SYNTHESIZED,
		 a => CLK_273);

b2v_inst40 : a7410
PORT MAP(b => T4,
		 c => P_ALTERA_SYNTHESIZED1,
		 d => IR4,
		 a => SYNTHESIZED_WIRE_12);

b2v_inst41 : a7410
PORT MAP(b => T4,
		 c => P_ALTERA_SYNTHESIZED2,
		 d => IR2,
		 a => SYNTHESIZED_WIRE_13);

b2v_inst42 : a7410
PORT MAP(b => T4,
		 c => P_ALTERA_SYNTHESIZED4,
		 d => IR0,
		 a => SYNTHESIZED_WIRE_14);

b2v_inst43 : a74240
PORT MAP(a1GN => SYNTHESIZED_WIRE_50,
		 a1A1 => SYNTHESIZED_WIRE_16,
		 a1A2 => SYNTHESIZED_WIRE_17,
		 a2GN => SYNTHESIZED_WIRE_50,
		 a2A1 => RSBUS_ALTERA_SYNTHESIZED,
		 a2A2 => RDBUS_ALTERA_SYNTHESIZED,
		 a2A4 => SYNTHESIZED_WIRE_19,
		 a1Y1 => LDDR1,
		 a1Y2 => LDIRN_ALTERA_SYNTHESIZED,
		 a2Y2 => RSBUS_ALTERA_SYNTHESIZED,
		 a2Y3 => RDBUS_ALTERA_SYNTHESIZED,
		 a2Y4 => LDDR2);

b2v_inst44 : a74240
PORT MAP(a1GN => SYNTHESIZED_WIRE_51,
		 a1A1 => SYNTHESIZED_WIRE_21,
		 a1A2 => SYNTHESIZED_WIRE_22,
		 a1A3 => SYNTHESIZED_WIRE_23,
		 a1A4 => SYNTHESIZED_WIRE_24,
		 a2GN => SYNTHESIZED_WIRE_51,
		 a2A1 => SYNTHESIZED_WIRE_26,
		 a2A2 => SYNTHESIZED_WIRE_27,
		 a2A3 => U6_45,
		 a2A4 => P7N_ALTERA_SYNTHESIZED,
		 a1Y1 => P_ALTERA_SYNTHESIZED4,
		 a1Y2 => P_ALTERA_SYNTHESIZED2,
		 a1Y3 => P_ALTERA_SYNTHESIZED1,
		 a1Y4 => P_ALTERA_SYNTHESIZED3,
		 a2Y1 => P_ALTERA_SYNTHESIZED6,
		 a2Y2 => P_ALTERA_SYNTHESIZED5,
		 a2Y3 => SYNTHESIZED_WIRE_52,
		 a2Y4 => P7);

b2v_inst45 : a74240
PORT MAP(a1GN => SYNTHESIZED_WIRE_51,
		 a1A1 => SYNTHESIZED_WIRE_29,
		 a1A2 => SYNTHESIZED_WIRE_30,
		 a1A3 => SYNTHESIZED_WIRE_31,
		 a1A4 => SYNTHESIZED_WIRE_32,
		 a2GN => SYNTHESIZED_WIRE_51,
		 a2A1 => SYNTHESIZED_WIRE_34,
		 a2A2 => SYNTHESIZED_WIRE_35,
		 a2A3 => SYNTHESIZED_WIRE_36,
		 a2A4 => SYNTHESIZED_WIRE_37,
		 a1Y1 => LDR3N,
		 a1Y2 => P9,
		 a1Y3 => P11,
		 a1Y4 => LDPC,
		 a2Y1 => CN,
		 a2Y2 => P12,
		 a2Y3 => P10,
		 a2Y4 => LDR1N);

b2v_inst49 : a74138
PORT MAP(G1 => SYNTHESIZED_WIRE_47,
		 G2AN => SYNTHESIZED_WIRE_48,
		 G2BN => SYNTHESIZED_WIRE_48,
		 A => U5_1,
		 B => U5_2,
		 C => U5_3,
		 Y1N => SWBUS,
		 Y2N => R2BUSN,
		 Y3N => ALUBUS,
		 Y4N => RSBUS_ALTERA_SYNTHESIZED,
		 Y5N => RDBUS_ALTERA_SYNTHESIZED,
		 Y6N => PCBUS);

b2v_inst50 : a74138
PORT MAP(G1 => SYNTHESIZED_WIRE_47,
		 G2AN => U6_45,
		 G2BN => U6_45,
		 A => U6_1,
		 B => U6_2,
		 C => U6_3,
		 Y1N => SYNTHESIZED_WIRE_23,
		 Y2N => SYNTHESIZED_WIRE_22,
		 Y3N => SYNTHESIZED_WIRE_24,
		 Y4N => SYNTHESIZED_WIRE_21,
		 Y5N => SYNTHESIZED_WIRE_27,
		 Y6N => SYNTHESIZED_WIRE_26,
		 Y7N => P7N_ALTERA_SYNTHESIZED);

b2v_inst51 : a74138
PORT MAP(G1 => SYNTHESIZED_WIRE_47,
		 G2AN => SYNTHESIZED_WIRE_52,
		 G2BN => SYNTHESIZED_WIRE_52,
		 A => U6_1,
		 B => U6_2,
		 C => U6_3,
		 Y0N => SYNTHESIZED_WIRE_37,
		 Y1N => SYNTHESIZED_WIRE_30,
		 Y2N => SYNTHESIZED_WIRE_36,
		 Y3N => SYNTHESIZED_WIRE_31,
		 Y4N => SYNTHESIZED_WIRE_35,
		 Y5N => SYNTHESIZED_WIRE_32,
		 Y6N => SYNTHESIZED_WIRE_34,
		 Y7N => SYNTHESIZED_WIRE_29);

process(DFF_inst19,SYNTHESIZED_WIRE_49)
begin
if (SYNTHESIZED_WIRE_49 = '1') then
	MAR6 <= DFF_inst19;
else
	MAR6 <= 'Z';
end if;
end process;


process(DFF_inst20,SYNTHESIZED_WIRE_49)
begin
if (SYNTHESIZED_WIRE_49 = '1') then
	MAR5 <= DFF_inst20;
else
	MAR5 <= 'Z';
end if;
end process;

P1 <= P_ALTERA_SYNTHESIZED1;
P2 <= P_ALTERA_SYNTHESIZED2;
P3 <= P_ALTERA_SYNTHESIZED3;
P4 <= P_ALTERA_SYNTHESIZED4;
P5 <= P_ALTERA_SYNTHESIZED5;
P6 <= P_ALTERA_SYNTHESIZED6;
LDIRN <= LDIRN_ALTERA_SYNTHESIZED;
P7N <= P7N_ALTERA_SYNTHESIZED;
RSBUS <= RSBUS_ALTERA_SYNTHESIZED;
RDBUS <= RDBUS_ALTERA_SYNTHESIZED;

END; 