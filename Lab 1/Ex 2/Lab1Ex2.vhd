library ieee;
use ieee.std_logic_1164.all;

entity Lab1Ex2 is
	port(                              s: in  std_logic_vector(1 downto 0);
	      u1, u0, v1, v0, w1, w0, x1, x0: in  std_logic;
			                        m1, m0: out std_logic);
end Lab1Ex2;

architecture mux of Lab1Ex2 is
begin
	with s select
		m1 <= u1 when "00",
		      v1 when "01",
			   w1 when "10",
			   x1 when "11";
	with s select
		m0 <= u0 when "00",
		      v0 when "01",
			   w0 when "10",
			   x0 when "11";
end mux;