library ieee;
use ieee.std_logic_1164.all;

--

entity shift_reg is

	port(INP, CLKs, RSTs, SETs: in  std_logic;
	            L1, L2, L3, L4: out std_logic);

end shift_reg;

--

architecture FFs of shift_reg is

signal d1, d2, d3, d4: std_logic;

component D_FF is

	port(D, CLK, RST, SET: in  std_logic;
	                    Q: out std_logic);

end component;

--

begin

	FF1: D_FF port map(
		D   => INP,
		CLK => CLKs,
		RST => RSTs,
		SET => SETs,
		Q   => d1
	);

	FF2: D_FF port map(
		D   => d1,
		CLK => CLKs,
		RST => RSTs,
		SET => SETs,
		Q   => d2
	);

	FF3: D_FF port map(
		D   => d2,
		CLK => CLKs,
		RST => RSTs,
		SET => SETs,
		Q   => d3
	);

	FF4: D_FF port map(
		D   => d3,
		CLK => CLKs,
		RST => RSTs,
		SET => SETs,
		Q   => d4
	);

	L1 <= d1;
	L2 <= d2;
	L3 <= d3;
	L4 <= d4;

end FFs;