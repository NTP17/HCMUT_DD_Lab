library ieee;
use ieee.std_logic_1164.all;

entity Lab1Ex1 is
	port(s, x0, y0, x1, y1, x2, y2, x3, y3: in  std_logic;
							m0, m1, m2, m3: out std_logic);
end Lab1Ex1;

architecture mux of Lab1Ex1 is
begin
	m0 <= (NOT(s) AND x0) OR (s AND y0);
	m1 <= (NOT(s) AND x1) OR (s AND y1);
	m2 <= (NOT(s) AND x2) OR (s AND y2);
	m3 <= (NOT(s) AND x3) OR (s AND y3);
end mux;