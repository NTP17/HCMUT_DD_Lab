library ieee;
use ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity RAM is

	port(    RAM_ADDR: in  std_logic_vector(6 downto 0);
         RAM_DATA_IN: in  std_logic_vector(8 downto 0);
              RAM_WR: in  std_logic;
           RAM_CLOCK: in  std_logic;
        RAM_DATA_OUT: out std_logic_vector(8 downto 0));

end RAM;

architecture behavior of RAM is

type RAM_ARRAY is array (0 to 127 ) of std_logic_vector (8 downto 0);

signal R: RAM_ARRAY := (

   "001000111","001001001","000010000","000011001",
   "010010001","011011000","010000000","010001001",
   "000100010","000101011","010100000","010101001",
   "000110100","000111101","011110010","011111011",
   "000000000","000000000","000000000","000000000",
   "000000000","000000000","000000000","000000000",
   "000000000","000000000","000000000","000000000",
   "000000000","000000000","000000000","000000000",
   "000000000","000000000","000000000","000000000",
   "000000000","000000000","000000000","000000000",
   "000000000","000000000","000000000","000000000",
   "000000000","000000000","000000000","000000000",
   "000000000","000000000","000000000","000000000",
   "000000000","000000000","000000000","000000000",
   "000000000","000000000","000000000","000000000",
   "000000000","000000000","000000000","000000000",
   "000000000","000000000","000000000","000000000",
   "000000000","000000000","000000000","000000000",
   "000000000","000000000","000000000","000000000",
   "000000000","000000000","000000000","000000000",
   "000000000","000000000","000000000","000000000",
   "000000000","000000000","000000000","000000000",
   "000000000","000000000","000000000","000000000",
   "000000000","000000000","000000000","000000000",
   "000000000","000000000","000000000","000000000",
   "000000000","000000000","000000000","000000000",
   "000000000","000000000","000000000","000000000",
   "000000000","000000000","000000000","000000000",
   "000000000","000000000","000000000","000000000",
   "000000000","000000000","000000000","000000000",
   "000000000","000000000","000000000","000000000",
   "000000000","000000000","000000000","000000000"

	);

begin

	process(RAM_CLOCK)
	begin

		if(falling_edge(RAM_CLOCK)) then

			if(RAM_WR = '1') then

				R(to_integer(unsigned(RAM_ADDR))) <= RAM_DATA_IN;

			end if;

		end if;

	end process;

	RAM_DATA_OUT <= R(to_integer(unsigned(RAM_ADDR)));

end behavior;