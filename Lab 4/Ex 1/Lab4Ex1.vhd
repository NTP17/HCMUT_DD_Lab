library ieee;
use ieee.std_logic_1164.all;

--

entity Lab4Ex1 is

	port(                   w, CLOCK, RESET: in     std_logic;
	     q8, q7, q6, q5, q4, q3, q2, q1, q0: buffer std_logic;
	                                      z: out    std_logic);

end Lab4Ex1;

--

architecture FSM of Lab4Ex1 is

	component D_FF is

		port(       D: in  std_logic;
		     CLK, RST: in  std_logic;
		            Q: out std_logic);

	end component;	

	signal d8, d7, d6, d5, d4, d3, d2, d1, d0: std_logic;

--

begin

	FF0: D_FF port map(
		D   => d0,
		CLK => CLOCK,
		RST => RESET,
		Q   => q0
	);

	FF1: D_FF port map(
		D   => d1,
		CLK => CLOCK,
		RST => RESET,
		Q   => q1
	);

	FF2: D_FF port map(
		D   => d2,
		CLK => CLOCK,
		RST => RESET,
		Q   => q2
	);

	FF3: D_FF port map(
		D   => d3,
		CLK => CLOCK,
		RST => RESET,
		Q   => q3
	);

	FF4: D_FF port map(
		D   => d4,
		CLK => CLOCK,
		RST => RESET,
		Q   => q4
	);

	FF5: D_FF port map(
		D   => d5,
		CLK => CLOCK,
		RST => RESET,
		Q   => q5
	);

	FF6: D_FF port map(
		D   => d6,
		CLK => CLOCK,
		RST => RESET,
		Q   => q6
	);

	FF7: D_FF port map(
		D   => d7,
		CLK => CLOCK,
		RST => RESET,
		Q   => q7
	);

	FF8: D_FF port map(
		D   => d8,
		CLK => CLOCK,
		RST => RESET,
		Q   => q8
	);

	d0 <= '1';
	d1 <= ((not w) and (not q0)) or ((not w) and q0 and (q5 or q6 or q7 or q8));
	d2 <= (not w) and q0 and q1;
	d3 <= (not w) and q0 and q2;
	d4 <= (not w) and q0 and (q3 or q4);
	d5 <= (w and (not q0)) or (w and q0 and (q1 or q2 or q3 or q4));
	d6 <= w and q0 and q5;
	d7 <= w and q0 and q6;
	d8 <= w and q0 and (q7 or q8);
	z <= q4 or q8;

end FSM;