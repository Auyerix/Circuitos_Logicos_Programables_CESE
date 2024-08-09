library IEEE;
use IEEE.std_logic_1164.all;

entity binarycounter is
	generic(
		N: natural := 4
	);
	port(
		ena_i: in std_logic;		--habilitador general
		ena_gen_i: in std_logic;	--habilitador a nivel de ffd
		rst_i: in std_logic;
		ci_i: in std_logic;
		q_o: out std_logic_vector(N-1 downto 0)
	);
end;

architecture binarycounter_arq of binarycounter is
	-- Parte declarativa	
	signal aux: std_logic_vector(N-1 downto 0);


begin
	--Parte descriptiva


--	aux(0) <= ci_i;
--	co_o <= aux(N);

--	aux_in(0) <= d_i;


	aux(0)	<= ena_i xor q_o(0);
	aux(1)  <= (ena_i and q_o(0)) xor q_o(1);
	aux(2)  <= (((ena_i and q_o(0)) and q_o(1))) xor q_o(2);
	aux(3)  <= (((ena_i and q_o(0)) and q_o(1)) and q_o(2)) xor q_o(3);



	ffd_0:ffd
		port map(

				clk_i =>clk_i,
				rst_i =>rst_i,
				ena_i =>ena_gen_i,
				d_i   => aux(0),
				q_o	  => q_o(0);

		);

	ffd_1:ffd
		port map(

				clk_i =>clk_i,
				rst_i =>rst_i,
				ena_i =>ena_i,
				d_i   =>aux(1),
				q_o	  =>q_o(1)

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