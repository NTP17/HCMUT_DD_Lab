library ieee;
use ieee.std_logic_1164.all;

entity hex_to_7_seg is

	port(                A, B, C, D: in  std_logic;
	     ha, hb, hc, hd, he, hf, hg: out std_logic);

end hex_to_7_seg;

architecture behavior of hex_to_7_seg is

begin

	ha <= ((not A) and (not C) and (B xor D)) or (A and D and (B xor C));
	hb <= (B and (not D) and (A or C)) or (D and ((A and C) or ((not A) and B and (not C))));
	hc <= (A and B and (C or (not D))) or ((not A) and (not B) and C and (not D));
	hd <= ((not A) and (not C) and (B xor D)) or (C and ((B and D) or (A and (not B) and (not D))));
	he <= ((not A) and ((B and (not C)) or D)) or ((not B) and (not C) and D);
	hf <= ((not A) and (not B) and (C or D)) or (D and (((not A) and C) or (A and B and (not C))));
	hg <= (B and (((not A) and C and D) or (A and (not C) and (not D)))) or ((not A) and (not B) and (not C));

end behavior;