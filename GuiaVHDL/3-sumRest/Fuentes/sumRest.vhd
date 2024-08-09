library IEEE;
use IEEE.std_logic_1164.all;

entity sumRest is
	generic(
		N: natural := 4
	);
	port(
		a_i: in std_logic_vector(N-1 downto 0);
		b_i: in std_logic_vector(N-1 downto 0);
		sr_i: in std_logic;
		s_o: out std_logic_vector(N-1 downto 0);
		co_o: out std_logic
	);
end;

architecture sumRest_arq of sumRest is
	--Parte declarativa

	signal aux: std_logic_vector(N+1 downto 0);
	signal b_aux: std_logic_vector(N-1 downto 0);

begin
	--Parte descriptiva

	b_aux <= b_i xor (N-1 downto 0 => sr_i);

	--aux(0) <= ci_i;
	aux(0) <= sr_i;
	co_o <= aux(N);

	sumRest_gen: for i in 0 to N-1 generate
		sum1b_inst: entity work.sum1b 		 
		--sum1b_inst: sum1b  (en clase escribió esto) // pero tuvo que declarar el component aca
		--uso entity work.sum1b
			port map(
				a_i  	=> a_i(i),
				b_i  	=> b_aux(i),
				ci_i 	=> aux(i),
				s_o  	=> s_o(i),
				co_o 	=> aux(i+1)
			);
	end generate;

end;