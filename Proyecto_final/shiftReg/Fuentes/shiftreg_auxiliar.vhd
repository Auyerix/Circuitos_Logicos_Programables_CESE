-- solo para escribir como sería la iteración....

library IEEE;
use IEEE.std_logic_1164.all;

entity shiftreg is
	generic(
		N: natural := 4
	);

	port(
		clk_i: in std_logic;
		rst_i: in std_logic;
		ena_i: in std_logic;
		d_i  : in std_logic;
		q_o  : out std_logic_vector(N-1 downto 0)
	);
end;

architecture shiftreg_arq of shiftreg is
	-- Parte declarativa
	signal aux_in: std_logic_vector(N downto 0);
	signal aux_out: std_logic_vector(N-1 downto 0);

begin
	--Parte descriptiva
	aux_in(0) <= d_i;
	aux_in(1) <= aux_out(0);
	aux_in(2) <= aux_out(1);
	aux_in(3) <= aux_out(2);
	aux_in(4) <= aux_out(3);

	shiftreg_gen: for i in 0 to N-1 generate
		ffd_inst: entity work.ffd 		 

			port map(

				clk_i =>clk_i,
				rst_i =>rst_i,
				ena_i =>ena_i,
				d_i   =>aux_in(i),     --d_i when i = 0 else d_i else in(i-1),
				q_o	  =>aux_out(i)

			);
	end generate;

	q_o <= aux_out;

end;

begin

	aux_in(0) <= d_i;

	ffd_0:ffd
		port map(

				clk_i =>clk_i,
				rst_i =>rst_i,
				ena_i =>ena_i,
				d_i   =>aux_in(0),
				q_o	  =>aux_in(1)

		);

	ffd_1:ffd
		port map(

				clk_i =>clk_i,
				rst_i =>rst_i,
				ena_i =>ena_i,
				d_i   =>aux_in(1),
				q_o	  =>aux_in(2)

		);

	ffd_2:ffd
		port map(

				clk_i =>clk_i,
				rst_i =>rst_i,
				ena_i =>ena_i,
				d_i   =>aux_in(2),
				q_o	  =>aux_in(3)

		);

	ffd_3:ffd
		port map(

				clk_i =>clk_i,
				rst_i =>rst_i,
				ena_i =>ena_i,
				d_i   =>aux_in(3),
				q_o	  =>aux_in(4)

		);




end;