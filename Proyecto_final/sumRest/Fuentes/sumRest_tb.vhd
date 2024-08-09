library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sumRest_tb is
end;

architecture sumRest_tb_arq of sumRest_tb is
	
	constant N_tb: natural := 6;
	
	-- Declaracion de senales de prueba
	--signal a_tb: std_logic_vector(N_tb-1 downto 0) := (N_tb-1 downto 0 => '0');
	--signal b_tb: std_logic_vector(N_tb-1 downto 0) := (N_tb-1 downto 0 => '0');
	signal a_tb: std_logic_vector(N_tb-1 downto 0) := std_logic_vector(to_unsigned(0,N_tb));
	signal b_tb: std_logic_vector(N_tb-1 downto 0) := std_logic_vector(to_unsigned(3,N_tb));
	signal sr_tb: std_logic := '0';
	signal s_tb: std_logic_vector(N_tb-1 downto 0);
	signal co_tb: std_logic;

begin

	--a_tb <=  "000111" after 100 ns, "010000" after 300 ns;
	--b_tb <=  "001000" after 200 ns;
	a_tb <=  std_logic_vector(to_unsigned(7,N_tb)) after 100 ns, "010000" after 300 ns;
	b_tb <=  std_logic_vector(to_unsigned(8,N_tb)) after 200 ns;
	sr_tb <= '1' after 400 ns;

	DUT: entity work.sumRest
		generic map(
			N => N_tb
		)
		port map(
			a_i	 => a_tb, 
			b_i	 => b_tb,
			sr_i => sr_tb,
			s_o	 => s_tb,
			co_o => co_tb
		);
	
end;