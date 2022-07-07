library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

entity ALU is

	port(a:      in  std_logic_vector(8 downto 0);
	     b:      in  std_logic_vector(8 downto 0);
		  s:      in  std_logic;
	     result: out std_logic_vector(8 downto 0));

end ALU;

architecture behavior of ALU is

begin

	result <=      (a + b) when (s = '0')
	          else (a - b) when (s = '1')
				 else "000000000";

end behavior;