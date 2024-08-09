library IEEE;
use IEEE.std_logic_1164.all;

entity contBCD_Lento_tb is
end;

architecture contBCD_Lento_tb_arq of contBCD_Lento_tb is

	component contBCD_Lento is
		generic(
			N: natural := 5
		);
		port(
			clk_i: in std_logic;
			rst_i: in std_logic;
			ena_i: in std_logic;
			q_o: out std_logic_vector(3 downto 0);
			max_o: out std_logic
		);
	end component;

	signal clk_tb: std_logic := '0';
	signal rst_tb: std_logic := '1';
	signal ena_tb: std_logic := '1';
	signal q_tb: std_logic_vector(3 downto 0);
	signal max_tb : std_logic;
	
begin

	clk_tb <= not clk_tb after 10 ns;
	rst_tb <= '0' after 40 ns;
	ena_tb <= '0' after 220 ns, '1' after 300 ns;
	
	DUT: contBCD_Lento
		generic map(
			N => 6  -- si quisiera cada un segundo en esta placa a 125 Mhz, sería 125E6 (notación científica es válida)
		)
		port map(
			clk_i => clk_tb,
			rst_i => rst_tb,
			ena_i => ena_tb,
			q_o => q_tb,
			max_o => max_tb
		);
		
end;