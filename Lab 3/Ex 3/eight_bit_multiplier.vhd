library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

entity eight_bit_multiplier is

	port(a:      in  std_logic_vector(7 downto 0);
	     b:      in  std_logic_vector(7 downto 0);
	     result: out std_logic_vector(15 downto 0));

end eight_bit_multiplier;

architecture behavior of eight_bit_multiplier is

begin

	result <= a * b;

end behavior;