library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Pre4Ex2 is
	Port (
		RESET: in std_logic;
		CLK: in std_logic;
		w: in std_logic;
		z: out std_logic
		);
end Pre4Ex2;

architecture behavior of Pre4Ex2 is

type states is (A, B, F, C, G, D, H, E, I);
signal state: states;
signal current: std_logic;

begin

current<=w;

process(RESET, CLK)
begin
if RESET='0' then
	state<=A;
elsif falling_edge(CLK) then
	case state is
		when A =>
			case current is
				when '0' => state<=B;
				when '1' => state<=F;
				when others => state<=A;
			end case;
		when B =>
			case current is
				when '0' => state<=C;
				when '1' => state<=F;
				when others => state<=A;
			end case;
		when F =>
			case current is
				when '0' => state<=B;
				when '1' => state<=G;
				when others => state<=A;
			end case;
		when C =>
			case current is
				when '0' => state<=D;
				when '1' => state<=F;
				when others => state<=A;
			end case;
		when G =>
			case current is
				when '0' => state<=B;
				when '1' => state<=H;
				when others => state<=A;
			end case;
		when D =>
			case current is
				when '0' => state<=E;
				when '1' => state<=F;
				when others => state<=A;
			end case;
		when H =>
			case current is
				when '0' => state<=B;
				when '1' => state<=I;
				when others => state<=A;
			end case;
		when E =>
			case current is
				when '0' => state<=E;
				when '1' => state<=F;
				when others => state<=A;
			end case;
		when I =>
			case current is
				when '0' => state<=B;
				when '1' => state<=I;
				when others => state<=A;
			end case;
		when others => state<=A;
	end case;
end if;
end process;

process(state)
begin
case state is
	when A =>
		z<='0';
	when B =>
		z<='0';
	when F =>
		z<='0';
	when C =>
		z<='0';
	when G =>
		z<='0';
	when D =>
		z<='0';
	when H =>
		z<='0';
	when E =>
		z<='1';
	when I =>
		z<='1';
end case;
end process;

end behavior;