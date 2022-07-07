library ieee;
use ieee.std_logic_1164.all;

entity Lab1Ex5 is
	port(                   v3, v2, v1, v0: in     std_logic;
	                         e, a, b, c, d: buffer std_logic;
	     d1a, d1b, d1c, d1d, d1e, d1f, d1g: out    std_logic;
	     d0a, d0b, d0c, d0d, d0e, d0f, d0g: out    std_logic);
end Lab1Ex5;

architecture decade_counter of Lab1Ex5 is
begin

	e <= v3 and (v2 or v1);
	a <= v3 and (not v2) and (not v1);
	b <= v2 and ((not v3) or v1);
	c <= ((not v3) and v1) or (v3 and v2 and (not v1));
	d <= v0;

	d0a <= (not a) and (not c) and (b xor d);
	d0b <= b and (c xor d);
	d0c <= (not b) and c and (not d);
	d0d <= ((not a) and (not c) and (b xor d)) or ((not a) and b and c and d);
	d0e <= (b and (not c)) or d;
	d0f <= ((not a) and (not b) and (c or d)) or ((not a) and c and d);
	d0g <= (not a) and (((not b) and (not c)) or (b and c and d));
	
	d1a <= e;
	d1b <= '0';
	d1c <= '0';
	d1d <= e;
	d1e <= e;
	d1f <= e;
	d1g <= '1';
	
end decade_counter;