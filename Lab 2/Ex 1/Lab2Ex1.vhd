library ieee;
use ieee.std_logic_1164.all;

entity Lab2Ex1 is

	port(   a: in  std_logic_vector(3 downto 0);
	        b: in  std_logic_vector(3 downto 0);
		  cin: in  std_logic;
		    s: out std_logic_vector(3 downto 0);
		 cout: out std_logic);

end Lab2Ex1;

architecture action of Lab2Ex1 is

	component FA is

		port(a, b, c_in : in  std_logic;
		        s, c_out: out std_logic);

	end component;
	
	signal c: std_logic_vector(4 downto 0);

begin

	gen: for i in 0 to 3 generate

		u: FA port map(a     => a(i),
		               b     => b(i),
					   c_in  => c(i),
					   s     => s(i),
					   c_out => c(i+1));

	end generate;
	
	c(0) <= cin;
	cout <= c(4);

end action;