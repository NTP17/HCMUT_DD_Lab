library ieee;
use ieee.std_logic_1164.all;

--

entity Lab4Ex3 is

	port(w, CLOCK, RESET: in  std_logic;
	     z              : out std_logic);

end Lab4Ex3;

--

architecture detector of Lab4Ex3 is

signal ones, zeroes: std_logic;
signal PRESET      : std_logic := '0';
signal os, zs      : std_logic_vector(4 downto 1);

component shift_reg is

	port(INP, CLKs, RSTs, SETs: in  std_logic;
	            L1, L2, L3, L4: out std_logic);

end component;

--

begin

	sr1: shift_reg port map(
		INP  => w,
		CLKs => CLOCK,
		RSTs => RESET,
		SETs => '1',
		L1   => os(1),
		L2   => os(2),
		L3   => os(3),
		L4   => os(4)
	);

	sr2: shift_reg port map(
		INP  => w,
		CLKs => CLOCK,
		RSTs => RESET,
		SETs => PRESET,
		L1   => zs(1),
		L2   => zs(2),
		L3   => zs(3),
		L4   => zs(4)
	);

	process(RESET)
	begin
		if (RESET = '0') then
			PRESET <= '0'; else PRESET <= '1';
		end if;
	end process;

	z <= (os(1) and os(2) and os(3) and os(4)) or (not(zs(1)) and not(zs(2)) and not(zs(3)) and not(zs(4)));

end detector;