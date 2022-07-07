library ieee;
use ieee.std_logic_1164.all;

-- 74LS138's logic diagram is referenced, since it uses fewer logic gates than 'when else' statements.

entity decode38 is

	port(                 C,  B,  A,  E: in  std_logic;
	     Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7: out std_logic);

end decode38;

architecture circuit of decode38 is
begin

	Y7 <= not C and not B and not A and E;
	Y6 <= not C and not B and     A and E;
	Y5 <= not C and     B and not A and E;
	Y4 <= not C and     B and     A and E;
	Y3 <=     C and not B and not A and E;
	Y2 <=     C and not B and     A and E;
	Y1 <=     C and     B and not A and E;
	Y0 <=     C and     B and     A and E;

end circuit;