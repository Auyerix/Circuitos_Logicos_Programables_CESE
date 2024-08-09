library IEEE;
use IEEE.std_logic_1164.all;

entity shiftregserie_tb is
end;

architecture shiftregserie_tb_arq of shiftregserie_tb is
		-- Parte declarativa

	constant N_tb: natural := 4;

	signal clk_tb: std_logic := '0';
	signal rst_tb: std_logic := '0';
	signal ena_tb: std_logic := '1';
	signal d_tb: std_logic := '0';
	signal q_tb: std_logic_vector(N_tb-1 downto 0);
	signal serial_tb: std_logic;

begin
	--Parte descriptiva
	clk_tb <= not clk_tb after 10 ns;
	d_tb <= '1' after 25 ns, '0' after 45 ns;   --, '1' after 20 ns, '0' after 20 ns, '1' after 20 ns;


	DUT: entity work.shiftregserie
		generic map(
			N => N_tb
		)
		port map(
			clk_i	=> clk_tb, 
			rst_i	=> rst_tb,
			ena_i  	=> ena_tb,
			d_i	 	=> d_tb,
			q_o 	=> q_tb,
			serial_o=> serial_tb
		);
	
	
end;