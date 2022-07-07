library ieee;
use ieee.std_logic_1164.all;

entity sixteen_bit_register is

	port(        Ds: in  std_logic_vector(15 downto 0);
	     CLKs, RSTs: in  std_logic;
	             Qs: out std_logic_vector(15 downto 0));

end sixteen_bit_register;

architecture behavior of sixteen_bit_register is

begin

	process(Ds, CLKs, RSTs)

	begin

		if (falling_edge(CLKs) and (RSTs = '0')) then
			Qs <= Ds;
		end if;
		
		if (RSTs = '1') then
			Qs <= "0000000000000000";
		end if;

	end process;

end behavior;