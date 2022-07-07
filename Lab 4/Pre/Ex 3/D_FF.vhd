library ieee;
use ieee.std_logic_1164.all;

entity D_FF is

	port(       D: in  std_logic;
	     CLK, RST: in  std_logic;
	            Q: out std_logic);

end D_FF;

architecture behavior of D_FF is

begin

	process(D, CLK, RST)

	begin

		if (falling_edge(CLK) and (RST = '1')) then
			Q <= D;
		end if;
		
		if (RST = '0') then
			Q <= '0';
		end if;

	end process;

end behavior;