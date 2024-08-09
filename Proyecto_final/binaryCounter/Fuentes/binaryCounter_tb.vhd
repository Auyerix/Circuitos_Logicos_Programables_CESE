-- Aclaración para la prueba, tengo que arrancar con reset en 1, de manera de evitar undefined en q del ffd
-- de esta manera tomará un valor 0 y luego si cuando ponga el reset en 0 contará los flancos del clock
-- por eso tambien se agrega un delay para el para pasar el rst a 0 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity binarycounter_tb is
end;

architecture binarycounter_tb_arq of binarycounter_tb is
	
	constant N_tb: natural := 4;
	
	-- Declaracion de senales de prueba


	signal ena_i_tb: std_logic := '1';
	signal ena_gen_i_tb: std_logic:= '1';	--habilitador a nivel de ffd
	signal rst_i_tb: std_logic:= '1';
	signal clk_i_tb: std_logic:= '0';
	signal q_o_tb: std_logic_vector(N_tb-1 downto 0);


begin

	--a_tb <=  "000111" after 100 ns, "010000" after 300 ns;
	--b_tb <=  "001000" after 200 ns;
	--a_tb <=  std_logic_vector(to_unsigned(7,N_tb)) after 100 ns, "010000" after 300 ns;
	--b_tb <=  std_logic_vector(to_unsigned(8,N_tb)) after 200 ns;
	--ci_tb <= '1' after 400 ns;

	clk_i_tb <= not clk_i_tb after 10 ns;
	rst_i_tb <= '0' after 50 ns;
 

	DUT: entity work.binarycounter
		generic map(
			N => N_tb
		)
		port map(
			ena_i 		=> ena_i_tb,
			ena_gen_i	=> ena_gen_i_tb,
			rst_i		=> rst_i_tb,
			clk_i		=> clk_i_tb,
			q_o			=> q_o_tb
		);
	
end;