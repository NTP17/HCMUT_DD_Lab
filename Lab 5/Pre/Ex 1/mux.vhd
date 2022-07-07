library ieee;
use ieee.std_logic_1164.all;

entity mux is

	port(R0, R1, R2, R3, R4, R5, R6, R7, G, DIN: in  std_logic_vector(8 downto 0);
	                                       outs: in  std_logic_vector(9 downto 0);
	                                      buses: out std_logic_vector(8 downto 0));

end mux;

-- Elements of vector 'outs' follow the above signal order:
-- outs(9)  = R0_out
-- outs(8)  = R1_out
-- ...
-- outs(1)  = G_out
-- outs(0)  = DIN_out

architecture behavior of mux is
begin

	buses <= R0  when (outs = "1000000000") else
	         R1  when (outs = "0100000000") else
				R2  when (outs = "0010000000") else
				R3  when (outs = "0001000000") else
				R4  when (outs = "0000100000") else
				R5  when (outs = "0000010000") else
				R6  when (outs = "0000001000") else
				R7  when (outs = "0000000100") else
				G   when (outs = "0000000010") else
				DIN when (outs = "0000000001") else "000000000";
	
end behavior;