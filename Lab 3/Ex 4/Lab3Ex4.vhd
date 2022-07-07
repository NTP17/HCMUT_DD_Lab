library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

entity Lab3Ex4 is

	port(              A, B: in  std_logic_vector (7 downto 0);
	     ENA, ENB, CLK, RST: in  std_logic;
		                 SEL: in  std_logic_vector (1 downto 0);
	                      P: out std_logic_vector(15 downto 0));

end Lab3Ex4;

architecture AL of Lab3Ex4 is

signal RA, RB: std_logic_vector (7 downto 0);
signal     RP: std_logic_vector(15 downto 0);

component eight_bit_register_with_enable is

	port(            Ds: in  std_logic_vector(7 downto 0);
	     CLKs, RSTs, EN: in  std_logic;
	                 Qs: out std_logic_vector(7 downto 0));

end component;

component sixteen_bit_register is

	port(        Ds: in  std_logic_vector(15 downto 0);
	     CLKs, RSTs: in  std_logic;
	             Qs: out std_logic_vector(15 downto 0));

end component;

component ALU is

	port(a:      in  std_logic_vector (7 downto 0);
	     b:      in  std_logic_vector (7 downto 0);
		  s:      in  std_logic_vector (1 downto 0);
	     result: out std_logic_vector(15 downto 0));

end component;

begin

	A_reg: eight_bit_register_with_enable port map(
		Ds   => A,
		CLKs => CLK,
		RSTs => RST,
		EN   => ENA,
		Qs   => RA
	);

	B_reg: eight_bit_register_with_enable port map(
		Ds   => B,
		CLKs => CLK,
		RSTs => RST,
		EN   => ENB,
		Qs   => RB
	);

	arith: ALU port map(
		a      => RA,
		b      => RB,
		s      => SEL,
		result => RP
	);

	output: sixteen_bit_register port map(
		Ds   => RP,
		CLKs => CLK,
		RSTs => RST,
		Qs   => P
	);

end AL;