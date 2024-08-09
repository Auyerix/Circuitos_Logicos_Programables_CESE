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
		clk_i: in std_logic;
		q_o: out std_logic_vector(N-1 downto 0)
	);
end;

architecture binarycounter_arq of binarycounter is
	-- Parte declarativa	
	signal aux: std_logic_vector(N-1 downto 0);
	signal aux_q: std_logic_vector(N-1 downto 0); --:= (others => '0');


begin
	--Parte descriptiva



	aux(0)	<= ena_i xor aux_q(0);
	aux(1)  <= (ena_i and aux_q(0)) xor aux_q(1);
	aux(2)  <= (((ena_i and aux_q(0)) and aux_q(1))) xor aux_q(2);
	aux(3)  <= (((ena_i and aux_q(0)) and aux_q(1)) and aux_q(2)) xor aux_q(3);

	binarycounter_gen: for i in 0 to N-1 generate
	ffd_inst: entity work.ffd 		 

		port map(

			clk_i =>clk_i,
			rst_i =>rst_i,
			ena_i =>ena_gen_i,
			d_i   =>aux(i),   
			q_o	  =>aux_q(i)

		);
	end generate;

	q_o <= aux_q;

end;