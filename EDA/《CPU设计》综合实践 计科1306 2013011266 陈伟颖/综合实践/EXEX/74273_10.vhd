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

ENTITY 74273_10 IS 
PORT 
( 
	D2	:	IN	 STD_LOGIC;
	D3	:	IN	 STD_LOGIC;
	D1	:	IN	 STD_LOGIC;
	D4	:	IN	 STD_LOGIC;
	D7	:	IN	 STD_LOGIC;
	D6	:	IN	 STD_LOGIC;
	D5	:	IN	 STD_LOGIC;
	D8	:	IN	 STD_LOGIC;
	CLK	:	IN	 STD_LOGIC;
	CLRN	:	IN	 STD_LOGIC;
	Q4	:	OUT	 STD_LOGIC;
	Q1	:	OUT	 STD_LOGIC;
	Q2	:	OUT	 STD_LOGIC;
	Q3	:	OUT	 STD_LOGIC;
	Q6	:	OUT	 STD_LOGIC;
	Q5	:	OUT	 STD_LOGIC;
	Q7	:	OUT	 STD_LOGIC;
	Q8	:	OUT	 STD_LOGIC
); 
END 74273_10;

ARCHITECTURE bdf_type OF 74273_10 IS 
BEGIN 

-- instantiate macrofunction 

b2v_inst2 : 74273
PORT MAP(D2 => D2,
		 D3 => D3,
		 D1 => D1,
		 D4 => D4,
		 D7 => D7,
		 D6 => D6,
		 D5 => D5,
		 D8 => D8,
		 CLK => CLK,
		 CLRN => CLRN,
		 Q4 => Q4,
		 Q1 => Q1,
		 Q2 => Q2,
		 Q3 => Q3,
		 Q6 => Q6,
		 Q5 => Q5,
		 Q7 => Q7,
		 Q8 => Q8);

END; 