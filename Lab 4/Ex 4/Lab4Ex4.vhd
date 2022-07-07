library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Lab4Ex4 is

	port(         CL, XTAL, RES: in  std_logic;
	              in3, in2, in1: in  std_logic;
				              R, G: out std_logic);

end Lab4Ex4;

architecture behavior of Lab4Ex4 is

component shift_reg is

	port(           INs, CLKs, RSTs: in  std_logic;
	     S1, S2, S3, S4, S5, S6, S7: in  std_logic;
	     L1, L2, L3, L4, L5, L6, L7: out std_logic);

end component;

component half_sec is

	port(S:   in  std_logic;
	     PUL: in  std_logic;
	     T:   out std_logic);

end component;

component binary_to_unary is

	port(        i3, i2, i1, enable: in  std_logic;
	     o7, o6, o5, o4, o3, o2, o1: out std_logic);

end component;

component selector is

	port(     i: in  std_logic_vector(2 downto 0);
	      rcode: out std_logic_vector(3 downto 0);
	       rlen: out std_logic_vector(2 downto 0));

end component;

signal count: natural range 0 to 1;
signal code4, code3, code2, code1: std_logic;
signal           len3, len2, len1: std_logic;
signal             M1, M2, M3, M4: std_logic;
signal                        RST: std_logic := '1';
signal       data, buf, step, cin: std_logic := '0';
signal W1, W2, W3, W4, W5, W6, W7: std_logic := '0';

begin

	cin <= CL nor buf;

	process(XTAL, count)
	begin

		if (rising_edge(XTAL) and (count < 1)) then

			RST   <= '1';
			count <= count + 1;

		end if;

		if ((count = 1) and (RES = '1')) then

			RST <= '0'; else RST <= '1';

		end if;

	end process;

	sel: selector port map(
		i(2) => in3,
		i(1) => in2,
		i(0) => in1,

		rlen(2) => len3,
		rlen(1) => len2,
		rlen(0) => len1,

		rcode(3) => code4,
		rcode(2) => code3,
		rcode(1) => code2,
		rcode(0) => code1
	);

	converter: binary_to_unary port map(
		i1     => len1,
		i2     => len2,
		i3     => len3,
		enable => cin,
		
		o1     => W1,
		o2     => W2,
		o3     => W3,
		o4     => W4,
		o5     => W5,
		o6     => W6,
		o7     => W7
	);

	count_reg: shift_reg port map(
		INs  => '0',
		CLKs => step,
		RSTs => RST,

		S1   => W1,
		S2   => W2,
		S3   => W3,
		S4   => W4,
		S5   => W5,
		S6   => W6,
		S7   => W7,

		L7   => buf
	);

	morse_reg: shift_reg port map(
		INs  => '0',
		CLKs => step,
		RSTs => RST,
		
		S1   => '0',
		S2   => '0',
		S3   => '0',
		S4   => code4 and cin,
		S5   => code3 and cin,
		S6   => code2 and cin,
		S7   => code1 and cin,

		L7   => data
	);

	blink: half_sec port map(
		S   => buf,
		PUL => XTAL,
		T   => step
	);

	R <= (not data) and step;
	G <=      data  and step;

end behavior;