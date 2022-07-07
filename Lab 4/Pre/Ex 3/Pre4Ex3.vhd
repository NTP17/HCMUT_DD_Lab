library ieee;
use ieee.std_logic_1164.all;

entity Pre4Ex3 is

	port(INPUT, CLOCK, RESET: in  std_logic;
	        L1, L2, L3, L4: out std_logic);

end Pre4Ex3;

architecture shift_reg of Pre4Ex3 is

signal d1, d2, d3, d4: std_logic;

component D_FF is

	port(       D: in  std_logic;
	     CLK, RST: in  std_logic;
	            Q: out std_logic);

end component;

begin

	FF1: D_FF port map(
		D   => INPUT,
		CLK => CLOCK,
		RST => RESET,
		Q   => d1
	);

	FF2: D_FF port map(
		D   => d1,
		CLK => CLOCK,
		RST => RESET,
		Q   => d2
	);

	FF3: D_FF port map(
		D   => d2,
		CLK => CLOCK,
		RST => RESET,
		Q   => d3
	);

	FF4: D_FF port map(
		D   => d3,
		CLK => CLOCK,
		RST => RESET,
		Q   => d4
	);

	L1 <= d1;
	L2 <= d2;
	L3 <= d3;
	L4 <= d4;

end shift_reg;