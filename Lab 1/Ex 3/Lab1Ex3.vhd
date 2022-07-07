library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------------

entity Lab1Ex3 is

	port(                                    s: in     std_logic_vector(1 downto 0);
	     u1,  u0,  v1,  v0,  w1,  w0,  x1,  x0: in     std_logic;
	     m7,  m6,  m5,  m4,  m3,  m2,  m1,  m0: buffer std_logic;
	         d0a, d0b, d0c, d0d, d0e, d0f, d0g: out    std_logic;
	         d1a, d1b, d1c, d1d, d1e, d1f, d1g: out    std_logic;
	         d2a, d2b, d2c, d2d, d2e, d2f, d2g: out    std_logic;
	         d3a, d3b, d3c, d3d, d3e, d3f, d3g: out    std_logic;
	                                       ind: out    std_logic_vector(1 downto 0));		

end Lab1Ex3;

-------------------------------------------------------------------------------------

architecture rotating_displays of Lab1Ex3 is

begin

-- Connect switches to LEDs

	ind <= s;

-- Four 2-bit wide 4-to-1 muxes

	with s select
		m7 <= u1 when "00", v1 when "01", w1 when "10", x1 when "11";
	with s select
		m6 <= u0 when "00", v0 when "01", w0 when "10", x0 when "11";
				
-------------------------------------------------------------------------------------

	with s select
		m5 <= u1 when "00", v1 when "01", w1 when "10", x1 when "11";
	with s select
		m4 <= u0 when "00", v0 when "01", w0 when "10", x0 when "11";
				
-------------------------------------------------------------------------------------

	with s select
		m3 <= u1 when "00", v1 when "01", w1 when "10", x1 when "11";
	with s select
		m2 <= u0 when "00", v0 when "01", w0 when "10", x0 when "11";
				
-------------------------------------------------------------------------------------

	with s select
		m1 <= u1 when "00", v1 when "01", w1 when "10", x1 when "11";
	with s select
		m0 <= u0 when "00", v0 when "01", w0 when "10", x0 when "11";
	
-- Boolean algebra for every segment in four displays

	d0a <= not m6;
	d0b <= (not m7) and m6;
	d0c <= (not m7) and m6;
	d0d <= m7 and (not m6);
	d0e <= m7 and (not m6);
	d0f <= not m6;
	d0g <= m7;
	
-------------------------------------------------------------------------------------

	d1a <= m4;
	d1b <= m5 nor m4;
	d1c <= m5 nor m4;
	d1d <= (not m5) and m4;
	d1e <= (not m5) and m4;
	d1f <= m4;
	d1g <= m5 xor m4;
	
-------------------------------------------------------------------------------------

	d2a <= not m2;
	d2b <= m3 and m2;
	d2c <= m3 and m2;
	d2d <= m3 nor m2;
	d2e <= m3 nor m2;
	d2f <= not m2;
	d2g <= not m3;
	
-------------------------------------------------------------------------------------

	d3a <= m0;
	d3b <= m1 and (not m0);
	d3c <= m1 and (not m0);
	d3d <= m1 and m0;
	d3e <= m1 and m0;
	d3f <= m0;
	d3g <= m1 xnor m0;
	
end rotating_displays;