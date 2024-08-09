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

begin
	--Parte descriptiva
	aux_in(0) <= d_i;


	shiftreg_gen: for i in 0 to N-1 generate
		ffd_inst: entity work.ffd 		 

			port map(

				clk_i =>clk_i,
				rst_i =>rst_i,
				ena_i =>ena_i,
				d_i   =>aux_in(i),     --d_i when i = 0 else d_i else in(i-1),
				q_o	  =>aux_in(i+1)

			);
	end generate;

	q_o <= aux_in(N downto 1);

end;