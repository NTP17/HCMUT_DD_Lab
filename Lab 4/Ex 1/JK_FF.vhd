library ieee;
use ieee.std_logic_1164.all;

entity JK_FF is

	port(    J, K: in  std_logic;
	     CLK, RST: in  std_logic;
	            Q: out std_logic);

end JK_FF;

architecture behavior of JK_FF is

	signal temp: std_logic;

begin

	process(J, K, CLK, RST)

	begin

		if    (falling_edge(CLK) and (RST = '1') and (J = '0') and (K = '1')) then
			temp <= '0';
		elsif (falling_edge(CLK) and (RST = '1') and (J = '1') and (K = '0')) then
			temp <= '1';
		elsif (falling_edge(CLK) and (RST = '1') and (J = '1') and (K = '1')) then
			temp <= not temp;
		end if;
		
		if (RST = '0') then
			temp <= '0';
		end if;

	end process;

	Q <= temp;

end behavior;