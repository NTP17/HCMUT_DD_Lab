library ieee;
use ieee.std_logic_1164.all;

entity eight_bit_falling_register is

	port(        Ds: in  std_logic_vector(7 downto 0);
	     CLKs, RSTs: in  std_logic;
	             Qs: out std_logic_vector(7 downto 0));

end eight_bit_falling_register;

architecture behavior of eight_bit_falling_register is

begin

	process(Ds, CLKs, RSTs)

	begin

		if (rising_edge(CLKs) and (RSTs = '1')) then
			Qs <= Ds;
		end if;
		
		if (RSTs = '0') then
			Qs <= "00000000";
		end if;

	end process;

end behavior;