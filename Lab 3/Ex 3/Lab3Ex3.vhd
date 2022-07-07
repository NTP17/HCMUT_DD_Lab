library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

entity Lab3Ex3 is

	port(               DIN: in  std_logic_vector(7 downto 0);
	     ENA, ENB, CLK, RST: in  std_logic;
		                LEDs: out std_logic_vector(7 downto 0);
	         H3, H2, H1, H0: out std_logic_vector(6 downto 0));

end Lab3Ex3;

architecture reg_mult of Lab3Ex3 is

signal RA, RB: std_logic_vector (7 downto 0);
signal  P, RP: std_logic_vector(15 downto 0);

component eight_bit_multiplier is

	port(a:      in  std_logic_vector(7 downto 0);
	     b:      in  std_logic_vector(7 downto 0);
	     result: out std_logic_vector(15 downto 0));

end component;

component sixteen_bit_register is

	port(        Ds: in  std_logic_vector(15 downto 0);
	     CLKs, RSTs: in  std_logic;
	             Qs: out std_logic_vector(15 downto 0));

end component;

component eight_bit_register_with_enable is

	port(            Ds: in  std_logic_vector(7 downto 0);
	     CLKs, RSTs, EN: in  std_logic;
	                 Qs: out std_logic_vector(7 downto 0));

end component;

component hex_to_7_seg is

	port(                A, B, C, D: in  std_logic;
	     ha, hb, hc, hd, he, hf, hg: out std_logic);

end component;

begin

	A_reg: eight_bit_register_with_enable port map(
		Ds   => DIN,
		CLKs => CLK,
		RSTs => RST,
		EN   => ENA,
		Qs   => RA
	);

	B_reg: eight_bit_register_with_enable port map(
		Ds   => DIN,
		CLKs => CLK,
		RSTs => RST,
		EN   => ENB,
		Qs   => RB
	);

	mult: eight_bit_multiplier port map(
		a      => RA,
		b      => RB,
		result => RP
	);
	
	prod: sixteen_bit_register port map(
		Ds   => RP,
		CLKs => CLK,
		RSTs => RST,
		Qs   => P
	);
	
	hex3: hex_to_7_seg port map(
		A  => P(15),
		B  => P(14),
		C  => P(13),
		D  => P(12),
		
		ha => h3(0),
		hb => h3(1),
		hc => h3(2),
		hd => h3(3),
		he => h3(4),
		hf => h3(5),
		hg => h3(6)
	);

	hex2: hex_to_7_seg port map(
		A  => P(11),
		B  => P(10),
		C  => P(9),
		D  => P(8),
		
		ha => h2(0),
		hb => h2(1),
		hc => h2(2),
		hd => h2(3),
		he => h2(4),
		hf => h2(5),
		hg => h2(6)
	);

	hex1: hex_to_7_seg port map(
		A  => P(7),
		B  => P(6),
		C  => P(5),
		D  => P(4),
		
		ha => h1(0),
		hb => h1(1),
		hc => h1(2),
		hd => h1(3),
		he => h1(4),
		hf => h1(5),
		hg => h1(6)
	);

	hex0: hex_to_7_seg port map(
		A  => P(3),
		B  => P(2),
		C  => P(1),
		D  => P(0),
		
		ha => h0(0),
		hb => h0(1),
		hc => h0(2),
		hd => h0(3),
		he => h0(4),
		hf => h0(5),
		hg => h0(6)
	);
	
	LEDs <=      RA when ((ENA = '1') and (ENB = '0'))
	        else RB when ((ENA = '0') and (ENB = '1'))
			  else "00000000";

end reg_mult;