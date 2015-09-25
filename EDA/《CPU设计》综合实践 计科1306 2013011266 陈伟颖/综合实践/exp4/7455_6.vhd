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

ENTITY 7455_6 IS 
PORT 
( 
	H	:	IN	 STD_LOGIC;
	A	:	IN	 STD_LOGIC;
	B	:	IN	 STD_LOGIC;
	C	:	IN	 STD_LOGIC;
	D	:	IN	 STD_LOGIC;
	E	:	IN	 STD_LOGIC;
	F	:	IN	 STD_LOGIC;
	G	:	IN	 STD_LOGIC;
	YN	:	OUT	 STD_LOGIC
); 
END 7455_6;

ARCHITECTURE bdf_type OF 7455_6 IS 
BEGIN 

-- instantiate macrofunction 

b2v_inst29 : 7455
PORT MAP(H => H,
		 A => A,
		 B => B,
		 C => C,
		 D => D,
		 E => E,
		 F => F,
		 G => G,
		 YN => YN);

END; 