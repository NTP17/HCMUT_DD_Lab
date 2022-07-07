library ieee;
use ieee.std_logic_1164.all;

entity Lab2Ex5 is
	port(D, CLK: in std_logic;
	     Qa, Qb, Qc: out std_logic);
end Lab2Ex5;

architecture behavior of Lab2Ex5 is
begin
	process(D, CLK)
	begin
		if CLK = '1' then
			Qa <= D;
		end if;
		if rising_edge(CLK) then
			Qb <= D;
		end if;
		if falling_edge(CLK) then
			Qc <= D;
		end if;
	end process;
end behavior;