library IEEE;
use IEEE.std_logic_1164.all;

entity protocheck_tb is
end;

architecture protocheck_tb_arq of protocheck_tb is


	signal clk_tb: std_logic := '0';
	signal rst_tb: std_logic := '1';
	signal ena_tb: std_logic := '0';
	signal data_i_tb: std_logic := '0';
	signal data_o_tb: std_logic_vector(11 downto 0);
	signal q_o_tb : std_logic;
	
begin

	clk_tb <= not clk_tb after 10 ns;
	rst_tb <= '0' after 20 ns, '1' after 300 ns, '0' after 320 ns; --terminada la secuencia se realiza un reset para dejar en condición 0
	ena_tb <= '1' after 38 ns, '0' after 280 ns; --luego del pulso 12 master deshabilita el esclavo
	data_i_tb <= '1' after 40 ns, '1' after 60 ns,'0' after 80 ns,'0' after 100 ns, '1' after 120 ns,'1' after 140 ns,'0' 
	after 160 ns,'0' after 180 ns,'1' after 200 ns,'1' after 220 ns,'1' after 240 ns,'1' after 260 ns;

	--descomentar para generar errores en la comparación de módulo
	--data_i_tb <= '0' after 40 ns, '1' after 60 ns,'0' after 80 ns,'0' after 100 ns, '1' after 120 ns,'1' after 140 ns,'0' 
	--after 160 ns,'0' after 180 ns,'1' after 200 ns,'1' after 220 ns,'1' after 240 ns,'1' after 260 ns;
	
	DUT: entity work.protocheck

		generic map(
			N => 12
		)
		port map(
			clk_i 	=> clk_tb,
			rst_i 	=> rst_tb,
			ena_i 	=> ena_tb,
			data_i 	=> data_i_tb ,
			data_o 	=> data_o_tb,
			q_o    	=> q_o_tb
		);
		
end;