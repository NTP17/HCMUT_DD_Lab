library ieee;
use ieee.std_logic_1164.all;

--

entity almost_processor is

	port(XTAL, CLOCK, RUN, CLEAR: in     std_logic;
	                    data_in : in     std_logic_vector(8 downto 0);
			            data_bus: buffer std_logic_vector(8 downto 0);
	                         Fin: out    std_logic);

end almost_processor;

--

architecture mumbojumbo of almost_processor is

component mux is

	port(R0, R1, R2, R3, R4, R5, R6, R7, G, DIN: in  std_logic_vector(8 downto 0);
	                                       outs: in  std_logic_vector(9 downto 0);
	                                      buses: out std_logic_vector(8 downto 0));

end component;

component reg is

	port(            Ds: in  std_logic_vector(8 downto 0);
	     CLKs, RSTs, EN: in  std_logic;
	                 Qs: out std_logic_vector(8 downto 0));

end component;

component ALU is

	port(a:      in  std_logic_vector(8 downto 0);
	     b:      in  std_logic_vector(8 downto 0);
		  s:      in  std_logic;
	     result: out std_logic_vector(8 downto 0));

end component;

component CU is

	port(      ENABLE, CLEAR, CLK: in  std_logic;
	                       CU_ins: in  std_logic_vector(8 downto 0);
	     IR_in,
		  R0_out, R1_out, R2_out, R3_out, R4_out, R5_out, R6_out, R7_out,
		  G_out, DIN_out,
		  R0_in, R1_in, R2_in, R3_in, R4_in, R5_in, R6_in, R7_in,
		  A_in, G_in, AddSub, Done: out std_logic);

end component;

signal IRd, R0d, R1d, R2d, R3d, R4d, R5d, R6d, R7d, Ad, Sd, Gd: std_logic_vector(8 downto 0);
signal IRi, R0o, R1o, R2o, R3o, R4o, R5o, R6o, R7o, Go, Do,
            R0i, R1i, R2i, R3i, R4i, R5i, R6i, R7i, Ai, Gi, Sb: std_logic;
signal RESET: std_logic := '0';
signal count: natural range 0 to 1;

--

begin

	process(XTAL, CLEAR, count)
	begin

		if (rising_edge(XTAL) and (count < 1)) then

			RESET   <= '0';
			count <= count + 1;

		end if;

		if ((count = 1) and (CLEAR = '1')) then

			RESET <= '1'; else RESET <= '0';

		end if;

	end process;

	I_reg: reg port map(

		Ds   => data_in,

		CLKs => CLOCK,
		RSTs => RESET,

		EN   => IRi,

		Qs   => IRd

	);

	reg0: reg port map(

		Ds   => data_bus,

		CLKs => CLOCK,
		RSTs => RESET,

		EN   => R0i,

		Qs   => R0d

	);

	reg1: reg port map(

		Ds   => data_bus,

		CLKs => CLOCK,
		RSTs => RESET,

		EN   => R1i,

		Qs   => R1d

	);

	reg2: reg port map(

		Ds   => data_bus,

		CLKs => CLOCK,
		RSTs => RESET,

		EN   => R2i,

		Qs   => R2d

	);

	reg3: reg port map(

		Ds   => data_bus,

		CLKs => CLOCK,
		RSTs => RESET,

		EN   => R3i,

		Qs   => R3d

	);

	reg4: reg port map(

		Ds   => data_bus,

		CLKs => CLOCK,
		RSTs => RESET,

		EN   => R4i,

		Qs   => R4d

	);

	reg5: reg port map(

		Ds   => data_bus,

		CLKs => CLOCK,
		RSTs => RESET,

		EN   => R5i,

		Qs   => R5d

	);

	reg6: reg port map(

		Ds   => data_bus,

		CLKs => CLOCK,
		RSTs => RESET,

		EN   => R6i,

		Qs   => R6d

	);

	reg7: reg port map(

		Ds   => data_bus,

		CLKs => CLOCK,
		RSTs => RESET,

		EN   => R7i,

		Qs   => R7d

	);

	A_reg: reg port map(

		Ds   => data_bus,

		CLKs => CLOCK,
		RSTs => RESET,

		EN   => Ai,

		Qs   => Ad

	);

	G_reg: reg port map(

		Ds   => Sd,

		CLKs => CLOCK,
		RSTs => RESET,

		EN   => Gi,

		Qs   => Gd

	);

	sel: mux port map(

		R0      => R0d,
		R1      => R1d,
		R2      => R2d,
		R3      => R3d,
		R4      => R4d,
		R5      => R5d,
		R6      => R6d,
		R7      => R7d,
		G       => Gd,
		DIN     => data_in,

		outs(9) => R0o,
		outs(8) => R1o,
		outs(7) => R2o,
		outs(6) => R3o,
		outs(5) => R4o,
		outs(4) => R5o,
		outs(3) => R6o,
		outs(2) => R7o,
		outs(1) => Go,
		outs(0) => Do,

		buses   => data_bus

	);

	arith: ALU port map(

		a      => Ad,
		b      => data_bus,
		s      => Sb,
		result => Sd

	);

	brain: CU port map(

		ENABLE => RUN,
		CLEAR  => RESET,
		CLK    => CLOCK,

		CU_ins => IRd,

		IR_in   => IRi,
		R0_out  => R0o,
		R1_out  => R1o,
		R2_out  => R2o,
		R3_out  => R3o,
		R4_out  => R4o,
		R5_out  => R5o,
		R6_out  => R6o,
		R7_out  => R7o,
		G_out   => Go,
		DIN_out => Do,
		R0_in   => R0i,
		R1_in   => R1i,
		R2_in   => R2i,
		R3_in   => R3i,
		R4_in   => R4i,
		R5_in   => R5i,
		R6_in   => R6i,
		R7_in   => R7i,
		A_in    => Ai,
		G_in    => Gi,
		AddSub  => Sb,
		Done    => Fin

	);

end mumbojumbo;