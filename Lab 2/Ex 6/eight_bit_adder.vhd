library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

entity eight_bit_adder is

	port(a:      in  std_logic_vector(7 downto 0);
	     b:      in  std_logic_vector(7 downto 0);
	     result: out std_logic_vector(8 downto 0));

end eight_bit_adder;

architecture behavior of eight_bit_adder is

begin

	result <= ('0' & a) + ('0' & b);

end behavior;
