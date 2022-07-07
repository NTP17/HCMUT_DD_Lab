library ieee;
use ieee.std_logic_1164.all;

entity eight_bit_register is

	port(D7, D6, D5, D4, D3, D2, D1, D0: in  std_logic;
	                           CLK, RST: in  std_logic;
	     Q7, Q6, Q5, Q4, Q3, Q2, Q1, Q0: out std_logic);

end eight_bit_register;

architecture behavior of eight_bit_register is

begin

	process(D7, D6, D5, D4, D3, D2, D1, D0, CLK)

	begin

		if (falling_edge(CLK) and (RST = '1')) then
			Q7 <= D7;
			Q6 <= D6;
			Q5 <= D5;
			Q4 <= D4;
			Q3 <= D3;
			Q2 <= D2;
			Q1 <= D1;
			Q0 <= D0;
		end if;
		
		if (RST = '0') then
			Q7 <= '0';
			Q6 <= '0';
			Q5 <= '0';
			Q4 <= '0';
			Q3 <= '0';
			Q2 <= '0';
			Q1 <= '0';
			Q0 <= '0';
		end if;

	end process;

end behavior;