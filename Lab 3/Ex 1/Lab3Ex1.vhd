library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

entity Lab3Ex1 is

	port(            As: in     std_logic_vector(7 downto 0);
		             SUM: buffer std_logic_vector(8 downto 0);
	       CLOCK, RESET: in     std_logic;
		   Qover, Qcarry: out    std_logic;
		  h3, h2, h1, h0: out    std_logic_vector(6 downto 0));

end  Lab3Ex1;

architecture accumulator of Lab3Ex1 is

	signal S:           std_logic_vector(7 downto 0);
	signal Qi:          std_logic_vector(7 downto 0);
	signal OVER, CARRY: std_logic;
	
	component eight_bit_adder is
	
		port(a:      in  std_logic_vector(7 downto 0);
	        b:      in  std_logic_vector(7 downto 0);
	        result: out std_logic_vector(8 downto 0));

	end component;

	component eight_bit_register is
	
		port(        Ds: in  std_logic_vector(7 downto 0);
	        CLKs, RSTs: in  std_logic;
	                Qs: out std_logic_vector(7 downto 0));

	end component;

	component eight_bit_falling_register is
	
		port(        Ds: in  std_logic_vector(7 downto 0);
	        CLKs, RSTs: in  std_logic;
	                Qs: out std_logic_vector(7 downto 0));

	end component;

	component D_FF is
	
		port(       D: in  std_logic;
	        CLK, RST: in  std_logic;
	               Q: out std_logic);

	end component;

	component hex_to_7_seg is
	
		port(                A, B, C, D: in  std_logic;
	        ha, hb, hc, hd, he, hf, hg: out std_logic);

	end component;

begin

	A_reg: eight_bit_register port map(
		CLKs => CLOCK,
		RSTs => RESET,
		
		Ds => As,
		Qs => Qi
	);
	
	FA_8: eight_bit_adder port map(
		a      => Qi,
		b      => S,
		result => SUM
	);
	
	CARRY <= SUM(8);

	S_reg: eight_bit_falling_register port map(
		CLKs => CLOCK,
		RSTs => RESET,
		
		Ds(7) => SUM(7),
		Ds(6) => SUM(6),
		Ds(5) => SUM(5),
		Ds(4) => SUM(4),
		Ds(3) => SUM(3),
		Ds(2) => SUM(2),
		Ds(1) => SUM(1),
		Ds(0) => SUM(0),
		
		Qs(7) => S(7),
		Qs(6) => S(6),
		Qs(5) => S(5),
		Qs(4) => S(4),
		Qs(3) => S(3),
		Qs(2) => S(2),
		Qs(1) => S(1),
		Qs(0) => S(0)
	);
	
	OVER <= (S(7) xor SUM(7)) and (S(7) xnor Qi(7));
	
	O_reg: D_FF port map(
		CLK => CLOCK,
		RST => RESET,
		
		D   => OVER,
		Q   => Qover
	);

	C_reg: D_FF port map(
		CLK => CLOCK,
		RST => RESET,
		
		D   => CARRY,
		Q   => Qcarry
	);

	hex3: hex_to_7_seg port map(
		A  => As(7),
		B  => As(6),
		C  => As(5),
		D  => As(4),
		
		ha => h3(0),
		hb => h3(1),
		hc => h3(2),
		hd => h3(3),
		he => h3(4),
		hf => h3(5),
		hg => h3(6)
	);

	hex2: hex_to_7_seg port map(
		A  => As(3),
		B  => As(2),
		C  => As(1),
		D  => As(0),
		
		ha => h2(0),
		hb => h2(1),
		hc => h2(2),
		hd => h2(3),
		he => h2(4),
		hf => h2(5),
		hg => h2(6)
	);

	hex1: hex_to_7_seg port map(
		A  => S(7),
		B  => S(6),
		C  => S(5),
		D  => S(4),
		
		ha => h1(0),
		hb => h1(1),
		hc => h1(2),
		hd => h1(3),
		he => h1(4),
		hf => h1(5),
		hg => h1(6)
	);

	hex0: hex_to_7_seg port map(
		A  => S(3),
		B  => S(2),
		C  => S(1),
		D  => S(0),
		
		ha => h0(0),
		hb => h0(1),
		hc => h0(2),
		hd => h0(3),
		he => h0(4),
		hf => h0(5),
		hg => h0(6)
	);

end accumulator;