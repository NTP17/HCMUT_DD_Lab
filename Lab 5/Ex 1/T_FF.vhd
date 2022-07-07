library ieee;
use ieee.std_logic_1164.all;

entity T_FF is

	port(             T: in  std_logic;
	     CLK, RST, ARES: in  std_logic;
	                  Q: out std_logic);

end T_FF;

architecture behavior of T_FF is

signal temp: std_logic := '0';

begin

	process(T, temp, CLK, RST)

	begin

		if (rising_edge(CLK) and (RST = '0') and (T = '1') and (ARES = '1')) then
			temp <= not temp;
		end if;
		
		if (rising_edge(CLK) and (RST = '1') and (ARES = '1')) then
			temp <= '0';
		end if;

		if (ARES = '0') then
			temp <= '0';
		end if;

	end process;

	Q <= temp;

end behavior;