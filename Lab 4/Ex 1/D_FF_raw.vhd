library ieee;
use ieee.std_logic_1164.all;

entity D_FF_raw is

	port(D, CLK, RST: in  std_logic;
	               Q: out std_logic);

end D_FF_raw;

architecture action of D_FF_raw is

	component D_Latch is

		port(  I, CK: in  std_logic;
	             Qa: out std_logic);

	end component;
	
	signal Qi: std_logic;

begin

	u1: D_Latch port map(I => D,  CK => not(CLK), Qa => Qi);
	u2: D_Latch port map(I => Qi, CK =>     CLK , Qa => Q);

end action;