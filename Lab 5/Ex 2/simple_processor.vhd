library ieee;
use ieee.std_logic_1164.all;

entity simple_processor is

	port(OSC, C_CLK, P_CLK, C_RST, P_RST, P_EN: in  std_logic;
	                                      dbus: out std_logic_vector(8 downto 0);
		                                   done: out std_logic);

end simple_processor;

architecture uP of simple_processor is

component almost_processor is

	port(XTAL, CLOCK, RUN, CLEAR: in     std_logic;
	                    data_in : in     std_logic_vector(8 downto 0);
			              data_bus: buffer std_logic_vector(8 downto 0);
	                         Fin: out    std_logic);

end component;

component program_counter is

	port(                  Ds: in  std_logic_vector(8 downto 0);
	     CLKs, RSTs, JMP, INC: in  std_logic;
	                       Qs: out std_logic_vector(8 downto 0));

end component;

component RAM is

	port(    RAM_ADDR: in  std_logic_vector(6 downto 0);
         RAM_DATA_IN: in  std_logic_vector(8 downto 0);
              RAM_WR: in  std_logic;
           RAM_CLOCK: in  std_logic;
        RAM_DATA_OUT: out std_logic_vector(8 downto 0));

end component;

signal ADDR: std_logic_vector(6 downto 0);
signal  DIN: std_logic_vector(8 downto 0);

begin

	counter: program_counter port map(

		Ds   => "000000000",
		CLKs => C_CLK,
		RSTs => C_RST,
		JMP  => '0',
		INC  => '1',
		Qs(6 downto 0) => ADDR

	);

	memory: RAM port map(

		RAM_ADDR     => ADDR,
		RAM_DATA_IN  => "000000000",
		RAM_WR       => '0',
		RAM_CLOCK    => '0',
		RAM_DATA_OUT => DIN

	);

	processor: almost_processor port map(

		XTAL     => OSC,
		CLOCK    => P_CLK,
		RUN      => P_EN,
		CLEAR    => P_RST,
		data_in  => DIN,
		data_bus => dbus,
		Fin      => done

	);

end uP;