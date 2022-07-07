library ieee;
use ieee.std_logic_1164.all;

entity binary_to_unary is

	port(        i3, i2, i1, enable: in  std_logic;
	     o7, o6, o5, o4, o3, o2, o1: out std_logic);

end binary_to_unary;

architecture behavior of binary_to_unary is

signal inps: std_logic_vector(3 downto 1) := "000";
signal outs: std_logic_vector(7 downto 1) := "0000000";

begin

	inps(3) <= i3;
	inps(2) <= i2;
	inps(1) <= i1;

	outs <= "0000000" when (inps = "000") else
	        "1000000" when (inps = "001") else
			  "1100000" when (inps = "010") else
			  "1110000" when (inps = "011") else
			  "1111000" when (inps = "100") else
			  "1111100" when (inps = "101") else
			  "1111110" when (inps = "110") else
			  "1111111" when (inps = "111");

	o7 <= outs(7) and enable;
	o6 <= outs(6) and enable;
	o5 <= outs(5) and enable;
	o4 <= outs(4) and enable;
	o3 <= outs(3) and enable;
	o2 <= outs(2) and enable;
	o1 <= outs(1) and enable;

end behavior;