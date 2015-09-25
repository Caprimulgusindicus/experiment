LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY cnt_n6 IS
	PORT
	(
		clk	: IN	STD_LOGIC;
		cs  : out 	std_logic_vector(0 to 5);
		q	: OUT	STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END cnt_n6;
ARCHITECTURE a OF cnt_n6 IS
	
BEGIN

PROCESS (clk)
	variable qq:std_logic_vector(2 downto 0);
BEGIN
---------------
if clk='1' and clk 'event
	then if qq<"101"
			then qq:=qq+1;
			else qq:="000";
			end if;
		end if;
		q<=qq;

---------------
CASE qq IS
	WHEN "000" =>cs<="100000";
	WHEN "001" =>cs<="010000";
	WHEN "010" =>cs<="001000";
	WHEN "011" =>cs<="000100";
	WHEN "100" =>cs<="000010";
	WHEN "101" =>cs<="000001";
	WHEN others =>NULL;
	
	
END CASE;


END PROCESS; 

END a;
