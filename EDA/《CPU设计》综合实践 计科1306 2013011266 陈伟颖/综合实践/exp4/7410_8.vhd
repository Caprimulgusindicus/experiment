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

ENTITY 7410_8 IS 
PORT 
( 
	2	:	IN	 STD_LOGIC;
	3	:	IN	 STD_LOGIC;
	4	:	IN	 STD_LOGIC;
	1	:	OUT	 STD_LOGIC
); 
END 7410_8;

ARCHITECTURE bdf_type OF 7410_8 IS 
BEGIN 

-- instantiate macrofunction 

b2v_inst34 : 7410
PORT MAP(2 => 2,
		 3 => 3,
		 4 => 4,
		 1 => 1);

END; 