library ieee;
use ieee.std_logic_1164.all;

entity reg is

	port(            Ds: in  std_logic_vector(8 downto 0);
	     CLKs, RSTs, EN: in  std_logic;
	                 Qs: out std_logic_vector(8 downto 0));

end reg;

architecture behavior of reg is

begin

	process(Ds, CLKs, RSTs)

	begin

		if (rising_edge(CLKs) and (RSTs = '1') and (EN = '1')) then
			Qs <= Ds;
		end if;
		
		if (RSTs = '0') then
			Qs <= "000000000";
		end if;

	end process;

end behavior;