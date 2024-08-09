library IEEE;
use IEEE.std_logic_1164.all;

entity serial_sender_tb is
end;

architecture serial_sender_tb_arq of serial_sender_tb is


	signal clk_tb: std_logic := '0';
	signal rst_tb: std_logic := '1';
	signal serial_out: std_logic := '0';
	
begin

	clk_tb <= not clk_tb after 10 ns;
	rst_tb <= '0' after 5 ns;

	
	DUT: entity work.serial_sender


		port map(
			clk 		=> clk_tb,
			reset 		=> rst_tb,
			serial_out 	=> serial_out


		);
		
end;