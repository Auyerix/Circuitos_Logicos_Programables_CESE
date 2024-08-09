
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity genEna_tb is
end;

architecture genEna_tb_arq of genEna_tb is
	
	constant N_tb: natural := 5;
	
	-- Declaracion de senales de prueba


	signal clk_tb: std_logic := '0';
	signal ena_tb: std_logic:= '1';	
	signal rst_tb: std_logic:= '1';
	signal q_tb: std_logic;

begin

	--a_tb <=  "000111" after 100 ns, "010000" after 300 ns;
	--b_tb <=  "001000" after 200 ns;
	--a_tb <=  std_logic_vector(to_unsigned(7,N_tb)) after 100 ns, "010000" after 300 ns;
	--b_tb <=  std_logic_vector(to_unsigned(8,N_tb)) after 200 ns;
	--ci_tb <= '1' after 400 ns;

	clk_tb <= not clk_tb after 10 ns;
	rst_tb <= '0' after 50 ns;

 

	DUT: entity work.genEna
		generic map(
			N => N_tb
		)
		port map(
			clk_i  		=> clk_tb,
			ena_i		=> ena_tb,
			rst_i		=> rst_tb,
			q_o			=> q_tb
		);
	
end;