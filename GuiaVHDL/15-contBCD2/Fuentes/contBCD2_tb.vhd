
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity contadorBCD_tb is
end;

architecture contadorBCD_tb_arq of contadorBCD_tb is
	
	constant N_tb: natural := 4;
	
	-- Declaracion de senales de prueba


	signal clk_tb: std_logic := '0';
	signal ld_tb: std_logic:= '0';	
	signal rst_tb: std_logic:= '1';
	--Nota sobre initial_value_tb, arranca en cero luego del reset (por funcionamiento del reset) y solo cargará cuando ld pase a 1
	signal initial_value_tb: std_logic_vector(N_tb-1 downto 0):= std_logic_vector(to_unsigned(0,N_tb)); -- "0000";
	signal count_tb: std_logic_vector(N_tb-1 downto 0);


begin

	--a_tb <=  "000111" after 100 ns, "010000" after 300 ns;
	--b_tb <=  "001000" after 200 ns;
	--a_tb <=  std_logic_vector(to_unsigned(7,N_tb)) after 100 ns, "010000" after 300 ns;
	--b_tb <=  std_logic_vector(to_unsigned(8,N_tb)) after 200 ns;
	--ci_tb <= '1' after 400 ns;

	clk_tb <= not clk_tb after 10 ns;
	rst_tb <= '0' after 50 ns;
	ld_tb <= '1' after 80 ns, '0' after 120 ns;
	initial_value_tb <= std_logic_vector(to_unsigned(3,N_tb)) after 70 ns;
 

	DUT: entity work.contadorBCD
		generic map(
			N => N_tb
		)
		port map(
			clk 				=> clk_tb,
			ld					=> ld_tb,
			rst					=> rst_tb,
			initial_value		=> initial_value_tb,
			count				=> count_tb
		);
	
end;