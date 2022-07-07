library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity program_counter is

	port(                  Ds: in  std_logic_vector(8 downto 0);
	     CLKs, RSTs, JMP, INC: in  std_logic;
	                       Qs: out std_logic_vector(8 downto 0));

end program_counter;

architecture behavior of program_counter is

signal addr: std_logic_vector(8 downto 0);

begin

	process(CLKs, RSTs, JMP, INC)

	begin

		if (rising_edge(CLKs) and (RSTs = '1') and (JMP = '1') and (INC = '0')) then
			addr <= Ds;
		end if;

		if (rising_edge(CLKs) and (RSTs = '1') and (JMP = '0') and (INC = '1')) then
			addr <= addr + "000000001";
		end if;
		
		if (RSTs = '0') then
			addr <= "000000000";
		end if;

	end process;

	Qs <= addr;

end behavior;