library ieee;
use ieee.std_logic_1164.all;

entity FA is

	port(a, b, c_in : in  std_logic;
	        s, c_out: out std_logic);

end FA;

architecture inside of FA is
begin

	s <= a xor b xor c_in;
	c_out <= ((a xor b) and c_in) or (a and b);

end inside;