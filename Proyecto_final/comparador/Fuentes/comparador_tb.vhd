
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity comparador_tb is
end;

architecture comparador_tb_arq of comparador_tb is
	
	constant N_tb: natural := 8;
	
	-- Declaracion de senales de prueba



	signal dataA_tb: std_logic_vector(N_tb-1 downto 0):= std_logic_vector(to_unsigned(5,N_tb)); -- "0000";
	signal dataB_tb: std_logic_vector(N_tb-1 downto 0):= std_logic_vector(to_unsigned(6,N_tb)); -- "0000";
	signal result_tb: std_logic;


begin

	--a_tb <=  "000111" after 100 ns, "010000" after 300 ns;
	--b_tb <=  "001000" after 200 ns;
	--a_tb <=  std_logic_vector(to_unsigned(7,N_tb)) after 100 ns, "010000" after 300 ns;
	--b_tb <=  std_logic_vector(to_unsigned(8,N_tb)) after 200 ns;
	--ci_tb <= '1' after 400 ns;
	
	-- cambio dataB para hacerla igual a dataA y que de 1 el resultado
	dataB_tb <= std_logic_vector(to_unsigned(5,N_tb)) after 100 ns;



	DUT: entity work.comparador
		generic map(
			N => N_tb
		)
		port map(
			dataA_i		=> dataA_tb,
			dataB_i		=> dataB_tb,
			result_o	=> result_tb
		);
	
end;