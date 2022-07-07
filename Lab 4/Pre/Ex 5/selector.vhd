library ieee;
use ieee.std_logic_1164.all;

entity selector is

	port(     i: in  std_logic_vector(2 downto 0);
	      rcode: out std_logic_vector(3 downto 0);
	       rlen: out std_logic_vector(2 downto 0));

end selector;

architecture sel of selector is
begin

	rcode <= "0010" when (i = "000") else
	         "0001" when (i = "001") else
			   "0101" when (i = "010") else
			   "0001" when (i = "011") else
			   "0000" when (i = "100") else
			   "0100" when (i = "101") else
			   "0011" when (i = "110") else
			   "0000" when (i = "111");

	rlen  <= "010" when (i = "000") else
	         "100" when (i = "001") else
			   "100" when (i = "010") else
			   "011" when (i = "011") else
			   "001" when (i = "100") else
			   "100" when (i = "101") else
			   "011" when (i = "110") else
			   "100" when (i = "111");


end sel;