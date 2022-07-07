library ieee;
use ieee.std_logic_1164.all;

entity CU_counter is

	port(CNT, RES, ACLR: in  std_logic;
	     Q0, Q1, Q2, Q3: out std_logic);

end CU_counter;

architecture circuit of CU_counter is

component T_FF is

	port(             T: in  std_logic;
	     CLK, RST, ARES: in  std_logic;
	                  Q: out std_logic);

end component;

signal T0, T1, T2, T3: std_logic;
signal         W2, W3: std_logic;

begin

	W2 <= T1 and T0;
	W3 <= T2 and W2;

	FF0: T_FF port map(
		T    => '1',
		CLK  => CNT,
		RST  => RES,
		ARES => ACLR,
		Q    => T0
	);

	FF1: T_FF port map(
		T    => T0,
		CLK  => CNT,
		RST  => RES,
		ARES => ACLR,
		Q    => T1
	);

	FF2: T_FF port map(
		T    => W2,
		CLK  => CNT,
		RST  => RES,
		ARES => ACLR,
		Q    => T2
	);

	FF3: T_FF port map(
		T    => W3,
		CLK  => CNT,
		RST  => RES,
		ARES => ACLR,
		Q    => T3
	);

	Q0 <= T0;
	Q1 <= T1;
	Q2 <= T2;
	Q3 <= T3;

end circuit;