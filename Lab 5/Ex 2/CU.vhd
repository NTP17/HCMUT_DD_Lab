library ieee;
use ieee.std_logic_1164.all;

entity CU is

	port(      ENABLE, CLEAR, CLK: in  std_logic;
	                       CU_ins: in  std_logic_vector(8 downto 0);
	     IR_in,
		  R0_out, R1_out, R2_out, R3_out, R4_out, R5_out, R6_out, R7_out,
		  G_out, DIN_out,
		  R0_in, R1_in, R2_in, R3_in, R4_in, R5_in, R6_in, R7_in,
		  A_in, G_in, AddSub, Done: out std_logic);

end CU;

-- CU_ins(8 downto 6) = III
-- CU_ins(5 downto 3) = XXX
-- CU_ins(2 downto 0) = YYY

architecture bunch_of_mess of CU is

signal                   op, step: std_logic_vector(2  downto 0);
signal Ro, Ri, RXo, RXi, RYo, RYi: std_logic_vector(7  downto 0);
signal                       pack: std_logic_vector(10 downto 0);

-- pack(10) = Ii

-- pack(9)  = Xo
-- pack(8)  = Yo
-- pack(7)  = Go
-- pack(6)  = Do

-- pack(5)  = Xi
-- pack(4)  = Yi
-- pack(3)  = Gi
-- pack(2)  = Ai

-- pack(1)  = Sb
-- pack(0)  = Dn

component decode38 is

	port(                 C,  B,  A,  E: in  std_logic;
	     Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7: out std_logic);

end component;

component CU_counter is

	port(CNT, RES, ACLR: in  std_logic;
	     Q0, Q1, Q2, Q3: out std_logic);

end component;

component signals_register is

	port(            Ds: in  std_logic_vector(22 downto 0);
	     CLKs, RSTs, EN: in  std_logic;
	                 Qs: out std_logic_vector(22 downto 0));

end component;

begin

	op <= CU_ins(8 downto 6);

	ustep: CU_counter port map(
		CNT  => CLK and ENABLE,
		RES  => pack(0),
		ACLR => CLEAR,
		Q0   => step(0),
		Q1   => step(1),
		Q2   => step(2)
	);

	process(op, step)
	begin

		if (step = "000") then -- T0 is always IR_in

			pack <= (10 => '1', others => '0');

		else

			case op is

				when "000" => -- mv

					case step is

						when "001"  => pack <= (8|5|0 => '1', others => '0');
						when others =>	pack <= (others => '0');

					end case;

				when "001" => -- mvi

					case step is

						when "001"  => pack <= (6|5|0 => '1', others => '0');
						when others => pack <= (others => '0');

					end case;

				when "010" => -- add

					case step is

						when "001"  => pack <= (9|2   => '1', others => '0');
						when "010"  => pack <= (8|3   => '1', others => '0');
						when "011"  => pack <= (7|5|0 => '1', others => '0');
						when others =>	pack <= (others => '0');

					end case;

				when "011" => -- sub

					case step is

						when "001"  => pack <= (9|2   => '1', others => '0');
						when "010"  =>	pack <= (8|3|1 => '1', others => '0');
						when "011"  =>	pack <= (7|5|0 => '1', others => '0');
						when others =>	pack <= (others => '0');

					end case;

				when others => pack <= (others => '0');

			end case;

		end if;

	end process;

	RX_out: decode38 port map(
		C  => CU_ins(5),
		B  => CU_ins(4),
		A  => CU_ins(3),

		E  => pack(9),

		Y7 => RXo(7),
		Y6 => RXo(6),
		Y5 => RXo(5),
		Y4 => RXo(4),
		Y3 => RXo(3),
		Y2 => RXo(2),
		Y1 => RXo(1),
		Y0 => RXo(0)
	);

	RY_out: decode38 port map(
		C  => CU_ins(2),
		B  => CU_ins(1),
		A  => CU_ins(0),

		E  => pack(8),

		Y7 => RYo(7),
		Y6 => RYo(6),
		Y5 => RYo(5),
		Y4 => RYo(4),
		Y3 => RYo(3),
		Y2 => RYo(2),
		Y1 => RYo(1),
		Y0 => RYo(0)
	);

	RX_in: decode38 port map(
		C  => CU_ins(5),
		B  => CU_ins(4),
		A  => CU_ins(3),

		E  => pack(5),

		Y7 => RXi(7),
		Y6 => RXi(6),
		Y5 => RXi(5),
		Y4 => RXi(4),
		Y3 => RXi(3),
		Y2 => RXi(2),
		Y1 => RXi(1),
		Y0 => RXi(0)
	);

	RY_in: decode38 port map(
		C  => CU_ins(2),
		B  => CU_ins(1),
		A  => CU_ins(0),

		E  => pack(4),

		Y7 => RYi(7),
		Y6 => RYi(6),
		Y5 => RYi(5),
		Y4 => RYi(4),
		Y3 => RYi(3),
		Y2 => RYi(2),
		Y1 => RYi(1),
		Y0 => RYi(0)
	);

	Ro <= RXo xor RYo;
	Ri <= RXi xor RYi;

	ready: signals_register port map(
		Ds(22)           => pack(10),
		Ds(21 downto 14) => Ro(7 downto 0),
		Ds(13)           => pack(7),
		Ds(12)           => pack(6),
		Ds(11 downto 4)  => Ri(7 downto 0),
		Ds(3)            => pack(2),
		Ds(2)            => pack(3),
		Ds(1)            => pack(1),
		Ds(0)            => pack(0),

		CLKs             => CLK,
		RSTs             => CLEAR,
		EN               => ENABLE,

		Qs(22)           => IR_in,
		Qs(21)           => R0_out,
		Qs(20)           => R1_out,
		Qs(19)           => R2_out,
		Qs(18)           => R3_out,
		Qs(17)           => R4_out,
		Qs(16)           => R5_out,
		Qs(15)           => R6_out,
		Qs(14)           => R7_out,
		Qs(13)           => G_out,
		Qs(12)           => DIN_out,
		Qs(11)           => R0_in,
		Qs(10)           => R1_in,
		Qs(9)            => R2_in,
		Qs(8)            => R3_in,
		Qs(7)            => R4_in,
		Qs(6)            => R5_in,
		Qs(5)            => R6_in,
		Qs(4)            => R7_in,
		Qs(3)            => A_in,
		Qs(2)            => G_in,
		Qs(1)            => AddSub,
		Qs(0)            => Done
	);

end bunch_of_mess;