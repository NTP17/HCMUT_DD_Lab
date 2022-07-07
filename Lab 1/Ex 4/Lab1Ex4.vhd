library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------------------------------------------------------

entity Lab1Ex4 is

	port(d0a, d0b, d0c, d0d, d0e, d0f, d0g: out    std_logic;
	     d1a, d1b, d1c, d1d, d1e, d1f, d1g: out    std_logic;
	     d2a, d2b, d2c, d2d, d2e, d2f, d2g: out    std_logic;
	     d3a, d3b, d3c, d3d, d3e, d3f, d3g: out    std_logic;
	     d4a, d4b, d4c, d4d, d4e, d4f, d4g: out    std_logic;
	     d5a, d5b, d5c, d5d, d5e, d5f, d5g: out    std_logic;           
	                            u2, u1, u0: buffer std_logic;
	                            v2, v1, v0: buffer std_logic;
	                            w2, w1, w0: buffer std_logic;
	                            x2, x1, x0: buffer std_logic;
	                            y2, y1, y0: buffer std_logic;
	                            z2, z1, z0: buffer std_logic;
	                            A0, B0, C0: buffer std_logic;
	                            A1, B1, C1: buffer std_logic;
	                            A2, B2, C2: buffer std_logic;
	                            A3, B3, C3: buffer std_logic;
	                            A4, B4, C4: buffer std_logic;
	                            A5, B5, C5: buffer std_logic;
	                                     s: in     std_logic_vector(2 downto 0);
	                                   ind: out    std_logic_vector(2 downto 0));

end Lab1Ex4;

------------------------------------------------------------------------------------------------------------------------

architecture rotating_displays of Lab1Ex4 is

begin

-- Connect switches to LEDs

	ind <= s;

-- Set constants for the muxes

	u2 <= '0'; v2 <= '0'; w2 <= '0'; x2 <= '0'; y2 <= '1'; z2 <= '1';
	u1 <= '0'; v1 <= '0'; w1 <= '1'; x1 <= '1'; y1 <= '0'; z1 <= '0';
	u0 <= '0'; v0 <= '1'; w0 <= '0'; x0 <= '1'; y0 <= '0'; z0 <= '1';

-- Six 3-bit wide 6-to-1 muxes

	with s select
		A0 <= u2 when "000", v2 when "001", w2 when "010", x2 when "011", y2 when "100", z2 when "101", '0' when others;
	with s select
		B0 <= u1 when "000", v1 when "001",	w1 when "010", x1 when "011", y1 when "100", z1 when "101", '0' when others;
	with s select
		C0 <= u0 when "000", v0 when "001", w0 when "010", x0 when "011", y0 when "100", z0 when "101", '0' when others;

------------------------------------------------------------------------------------------------------------------------

	with s select
		A1 <= u2 when "000", v2 when "001", w2 when "010", x2 when "011", y2 when "100", z2 when "101", '0' when others;
	with s select
		B1 <= u1 when "000", v1 when "001",	w1 when "010", x1 when "011", y1 when "100", z1 when "101", '0' when others;
	with s select
		C1 <= u0 when "000", v0 when "001", w0 when "010", x0 when "011", y0 when "100", z0 when "101", '0' when others;

------------------------------------------------------------------------------------------------------------------------

	with s select
		A2 <= u2 when "000", v2 when "001", w2 when "010", x2 when "011", y2 when "100", z2 when "101", '0' when others;
	with s select
		B2 <= u1 when "000", v1 when "001",	w1 when "010", x1 when "011", y1 when "100", z1 when "101", '0' when others;
	with s select
		C2 <= u0 when "000", v0 when "001", w0 when "010", x0 when "011", y0 when "100", z0 when "101", '0' when others;

------------------------------------------------------------------------------------------------------------------------

	with s select
		A3 <= u2 when "000", v2 when "001", w2 when "010", x2 when "011", y2 when "100", z2 when "101", '0' when others;
	with s select
		B3 <= u1 when "000", v1 when "001",	w1 when "010", x1 when "011", y1 when "100", z1 when "101", '0' when others;
	with s select
		C3 <= u0 when "000", v0 when "001", w0 when "010", x0 when "011", y0 when "100", z0 when "101", '0' when others;

------------------------------------------------------------------------------------------------------------------------

	with s select
		A4 <= u2 when "000", v2 when "001", w2 when "010", x2 when "011", y2 when "100", z2 when "101", '0' when others;
	with s select
		B4 <= u1 when "000", v1 when "001",	w1 when "010", x1 when "011", y1 when "100", z1 when "101", '0' when others;
	with s select
		C4 <= u0 when "000", v0 when "001", w0 when "010", x0 when "011", y0 when "100", z0 when "101", '0' when others;

------------------------------------------------------------------------------------------------------------------------

	with s select
		A5 <= u2 when "000", v2 when "001", w2 when "010", x2 when "011", y2 when "100", z2 when "101", '0' when others;
	with s select
		B5 <= u1 when "000", v1 when "001",	w1 when "010", x1 when "011", y1 when "100", z1 when "101", '0' when others;
	with s select
		C5 <= u0 when "000", v0 when "001", w0 when "010", x0 when "011", y0 when "100", z0 when "101", '0' when others;

-- Decoders for all six displays

	d0a <= ((not B0) and (not C0)) or ((not A0) and C0);
	d0b <= A0 or C0;
	d0c <= A0 or C0;
	d0d <= (not A0) and (not B0);
	d0e <= (not A0) and (not B0) and C0;
	d0f <= (not A0) and (not B0) and C0;
	d0g <= B0 or (A0 xor C0);

------------------------------------------------------------------------------------------------------------------------

	d1a <= A1 or (B1 xor C1);
	d1b <= A1 or (not C1);
	d1c <= A1 or (not C1);
	d1d <= (B1 and (not C1)) or ((not A1) and (not B1) and C1);
	d1e <= B1 and (not C1);
	d1f <= B1 and (not C1);
	d1g <= A1 or B1;

------------------------------------------------------------------------------------------------------------------------

	d2a <= B2 or (A2 xnor C2);
	d2b <= C2 or ((not A2) and (not B2));
	d2c <= C2 or ((not A2) and (not B2));
	d2d <= B2;
	d2e <= B2 and C2;
	d2f <= B2 and C2;
	d2g <= A2 or (B2 xnor C2);

------------------------------------------------------------------------------------------------------------------------

	d3a <= ((not B3) and (not C3)) or ((not A3) and C3);
	d3b <= (not C3) or ((not A3) and (not B3));
	d3c <= (not C3) or ((not A3) and (not B3));
	d3d <= (B3 and C3) or (A3 and (not C3));
	d3e <= A3 and (not C3);
	d3f <= A3 and (not C3);
	d3g <= not B3;

------------------------------------------------------------------------------------------------------------------------

	d4a <= A4 or (B4 xor C4);
	d4b <= B4 or C4;
	d4c <= B4 or C4;
	d4d <= A4;
	d4e <= A4 and C4;
	d4f <= A4 and C4;
	d4g <= ((not A4) and (not c4)) or ((not B4) and C4);

------------------------------------------------------------------------------------------------------------------------

	d5a <= B5 or (A5 xnor C5);
	d5b <= B5 or (not C5);
	d5c <= B5 or (not C5);
	d5d <= (A5 and C5) or ((not A5) and (not B5) and (not C5));
	d5e <= (not A5) and (not B5) and (not C5);
	d5f <= (not A5) and (not B5) and (not C5);
	d5g <= not A5;

end rotating_displays;