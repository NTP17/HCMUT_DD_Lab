library ieee;
use ieee.std_logic_1164.all;

entity D_FF is

	port(D, CLK, RST, SET: in  std_logic;
	                    Q: out std_logic);

end D_FF;

architecture behavior of D_FF is

signal u: std_logic := '0';

begin

	process(D, CLK, RST, SET)
	begin

		if (falling_edge(CLK) and (RST = '0') and (SET = '0')) then
			u <= D;
		end if;
		
		if (RST = '1') then
			u <= '0';
		end if;

		if (SET = '1') then
			u <= '1';
		end if;

	end process;

	Q <= u;

end behavior;