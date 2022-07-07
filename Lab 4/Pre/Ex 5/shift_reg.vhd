library ieee;
use ieee.std_logic_1164.all;

--

entity shift_reg is

	port(           INs, CLKs, RSTs: in  std_logic;
	     S1, S2, S3, S4, S5, S6, S7: in  std_logic;
	     L1, L2, L3, L4, L5, L6, L7: out std_logic);

end shift_reg;

--

architecture FFs of shift_reg is

signal b1, b2, b3, b4, b5, b6, b7: std_logic := '0';

component D_FF is

	port(D, CLK, RST, SET: in  std_logic;
	                    Q: out std_logic);

end component;

--

begin

	FF1: D_FF port map(
		D   => INs,
		CLK => CLKs,
		RST => RSTs,
		SET => S1,
		Q   => b1
	);

	FF2: D_FF port map(
		D   => b1,
		CLK => CLKs,
		RST => RSTs,
		SET => S2,
		Q   => b2
	);

	FF3: D_FF port map(
		D   => b2,
		CLK => CLKs,
		RST => RSTs,
		SET => S3,
		Q   => b3
	);

	FF4: D_FF port map(
		D   => b3,
		CLK => CLKs,
		RST => RSTs,
		SET => S4,
		Q   => b4
	);

	FF5: D_FF port map(
		D   => b4,
		CLK => CLKs,
		RST => RSTs,
		SET => S5,
		Q   => b5
	);

	FF6: D_FF port map(
		D   => b5,
		CLK => CLKs,
		RST => RSTs,
		SET => S6,
		Q   => b6
	);

	FF7: D_FF port map(
		D   => b6,
		CLK => CLKs,
		RST => RSTs,
		SET => S7,
		Q   => b7
	);

	L1 <= b1;
	L2 <= b2;
	L3 <= b3;
	L4 <= b4;
	L5 <= b5;
	L6 <= b6;
	L7 <= b7;

end FFs;