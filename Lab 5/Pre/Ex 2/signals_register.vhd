library ieee;
use ieee.std_logic_1164.all;

entity signals_register is

	port(            Ds: in  std_logic_vector(22 downto 0);
	     CLKs, RSTs, EN: in  std_logic;
	                 Qs: out std_logic_vector(22 downto 0));

end signals_register;

architecture behavior of signals_register is

begin

	process(Ds, CLKs, RSTs)

	begin

		if (falling_edge(CLKs) and (RSTs = '1') and (EN = '1')) then
			Qs <= Ds;
		end if;
		
		if (RSTs = '0') then
			Qs <= (others => '0');
		end if;

	end process;

end behavior;