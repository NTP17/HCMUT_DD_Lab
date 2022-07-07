library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Lab2Ex2 is

	port(                             x, y: in  std_logic_vector(3 downto 0);
	                                   cin: in  std_logic;
		                              error: out std_logic;
	     d10, d11, d12, d13, d14, d15, d16: out std_logic;
	     d00, d01, d02, d03, d04, d05, d06: out std_logic);

end Lab2Ex2;

architecture behavior of Lab2Ex2 is

component two_digit_decoder is
	port(                    e, a, b, c, d: in  std_logic;
	     d1a, d1b, d1c, d1d, d1e, d1f, d1g: out std_logic;
	     d0a, d0b, d0c, d0d, d0e, d0f, d0g: out std_logic);
end component;

signal s, z: std_logic_vector(4 downto 0);
signal adjust: std_logic;

begin

	z <= ('0' & x) + y + cin;
	adjust <= '1' when (z > 9) else '0';

	process(x, y)
	begin
		if ((x > 9) or (y > 9)) then
			error <= '1'; else error <= '0';
		end if;
	end process;
	
	s <= "00000"      when ((x > 9) or (y > 9)) 
	     else z       when (adjust = '0')
	     else (z + 6) when (adjust = '1');

	u: two_digit_decoder port map(
		e => s(4),
		a => s(3),
		b => s(2),
		c => s(1),
		d => s(0),

		d1a => d10,
		d1b => d11,
		d1c => d12,
		d1d => d13,
		d1e => d14,
		d1f => d15,
		d1g => d16,

		d0a => d00,
		d0b => d01,
		d0c => d02,
		d0d => d03,
		d0e => d04,
		d0f => d05,
		d0g => d06
	);
		
end behavior;