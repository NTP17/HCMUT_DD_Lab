library ieee;
use ieee.std_logic_1164.all;

entity D_Latch is
	port( I, CK: in std_logic;
	         Qa: buffer std_logic);
end D_Latch;

architecture circuit of D_Latch is

signal Rg, Sg, Qb: std_logic;

begin
	Rg <= (not I) nand CK;
	Sg <= I nand CK;
	Qa <= Sg nand Qb;
	Qb <= Rg nand Qa;
end circuit;