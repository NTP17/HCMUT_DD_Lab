library ieee;
use ieee.std_logic_1164.all;

entity Lab2Ex4 is

	port(Dee,  CLOCK: in  std_logic;
	              Q1: out std_logic);

end Lab2Ex4;

architecture action of Lab2Ex4 is

	component D_Latch is

		port( D, CLK: in  std_logic;
	        Qa,  Qb: out std_logic);

	end component;
	
	signal Q: std_logic;

begin

	u1: D_Latch port map(D => Dee, CLK => not(CLOCK), Qa => Q);
	u2: D_Latch port map(D => Q,   CLK =>     CLOCK , Qa => Q1);

end action;