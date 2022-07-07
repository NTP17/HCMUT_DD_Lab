library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

entity eight_bit_add_sub is

	port(a:      in  std_logic_vector(7 downto 0);
	     b:      in  std_logic_vector(7 downto 0);
		  m:      in  std_logic;
	     result: out std_logic_vector(8 downto 0));

end eight_bit_add_sub;

architecture behavior of eight_bit_add_sub is

begin

	result <=      (('0' & a) + ('0' & b)) when (m = '0')
	          else (('0' & a) - ('0' & b)) when (m = '1');

end behavior;
