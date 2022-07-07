library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

--

entity Lab2Ex6 is

	port(                    Bs: in  std_logic_vector(7 downto 0);
		           CLOCK, RESET: in  std_logic;
		                  CARRY: out std_logic;
		 H5, H4, H3, H2, H1, H0: out std_logic_vector(6 downto 0));

end Lab2Ex6;

--
--

architecture crude_calculator of Lab2Ex6 is

	signal R7, R6, R5, R4, R3, R2, R1, R0: std_logic;
	signal                              S: std_logic_vector(8 downto 0);
	signal                             As: std_logic_vector(7 downto 0);

--

	component eight_bit_register is

		port(D7, D6, D5, D4, D3, D2, D1, D0: in  std_logic;
	                               CLK, RST: in  std_logic;
	         Q7, Q6, Q5, Q4, Q3, Q2, Q1, Q0: out std_logic);

	end component;

--

	component eight_bit_adder is
	
		port(a:      in  std_logic_vector(7 downto 0);
	         b:      in  std_logic_vector(7 downto 0);
	         result: out std_logic_vector(8 downto 0));

	end component;

--

	component hex_to_7_seg is
	
		port(                A, B, C, D: in  std_logic;
	         ha, hb, hc, hd, he, hf, hg: out std_logic);

	end component;

--
--

begin

	reg: eight_bit_register port map(
		CLK => CLOCK,
		RST => RESET,

		D7  => Bs(7),
		D6  => Bs(6),
		D5  => Bs(5),
		D4  => Bs(4),
		D3  => Bs(3),
		D2  => Bs(2),
		D1  => Bs(1),
		D0  => Bs(0),

		Q7  => R7,
		Q6  => R6,
		Q5  => R5,
		Q4  => R4,
		Q3  => R3,
		Q2  => R2,
		Q1  => R1,
		Q0  => R0
	);

--
	
	add: eight_bit_adder port map(
		a      => As,
		b      => Bs,
		result => S
	);

--

	d5: hex_to_7_seg port map(
		A  => S(7),
		B  => S(6),
		C  => S(5),
		D  => S(4),

		ha => H5(0),
		hb => H5(1),
		hc => H5(2),
		hd => H5(3),
		he => H5(4),
		hf => H5(5),
		hg => H5(6)
	);

	d4: hex_to_7_seg port map(
		A  => S(3),
		B  => S(2),
		C  => S(1),
		D  => S(0),

		ha => H4(0),
		hb => H4(1),
		hc => H4(2),
		hd => H4(3),
		he => H4(4),
		hf => H4(5),
		hg => H4(6)
	);

	d3: hex_to_7_seg port map(
		A  => As(7),
		B  => As(6),
		C  => As(5),
		D  => As(4),

		ha => H3(0),
		hb => H3(1),
		hc => H3(2),
		hd => H3(3),
		he => H3(4),
		hf => H3(5),
		hg => H3(6)
	);

	d2: hex_to_7_seg port map(
		A  => As(3),
		B  => As(2),
		C  => As(1),
		D  => As(0),

		ha => H2(0),
		hb => H2(1),
		hc => H2(2),
		hd => H2(3),
		he => H2(4),
		hf => H2(5),
		hg => H2(6)
	);

	d1: hex_to_7_seg port map(
		A  => Bs(7),
		B  => Bs(6),
		C  => Bs(5),
		D  => Bs(4),

		ha => H1(0),
		hb => H1(1),
		hc => H1(2),
		hd => H1(3),
		he => H1(4),
		hf => H1(5),
		hg => H1(6)
	);

	d0: hex_to_7_seg port map(
		A  => Bs(3),
		B  => Bs(2),
		C  => Bs(1),
		D  => Bs(0),

		ha => H0(0),
		hb => H0(1),
		hc => H0(2),
		hd => H0(3),
		he => H0(4),
		hf => H0(5),
		hg => H0(6)
	);

--

	As(7) <= R7;
	As(6) <= R6;
	As(5) <= R5;
	As(4) <= R4;
	As(3) <= R3;
	As(2) <= R2;
	As(1) <= R1;
	As(0) <= R0;

--

	CARRY <= S(8);

end crude_calculator;