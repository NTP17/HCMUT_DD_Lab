library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

entity ALU is

	port(a:      in  std_logic_vector (7 downto 0);
	     b:      in  std_logic_vector (7 downto 0);
		  s:      in  std_logic_vector (1 downto 0);
	     result: out std_logic_vector(15 downto 0));

end ALU;

architecture behavior of ALU is

begin

	result <=      (("00000000" & a) + ("00000000" & b)) when (s = "00")
	          else (("00000000" & a) - ("00000000" & b)) when (s = "01")
				 else                               (a * b) when (s = "10")
				 else "0000000000000000";

end behavior;