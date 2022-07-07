library ieee;
use ieee.std_logic_1164.all;

entity D_Latch is
	port(        D, CLK: in     std_logic;
	     Rg, Sg, Qa, Qb: buffer std_logic);
end D_Latch;

architecture circuit of D_Latch is
begin
	Rg <= (not D) nand CLK;
	Sg <= D nand CLK;
	Qa <= Sg nand Qb;
	Qb <= Rg nand Qa;
end circuit;