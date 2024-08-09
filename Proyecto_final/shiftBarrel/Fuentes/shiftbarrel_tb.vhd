library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity BarrelShifter_tb is
end;

architecture BarrelShifter_tb_arq of BarrelShifter_tb is
	
	constant N_tb: natural := 4;
	constant M_tb: natural := 2;

	signal data_in_tb: std_logic_vector(N_tb-1 downto 0) := std_logic_vector(to_unsigned(5,N_tb));
	signal shift_amt_tb: std_logic_vector(M_tb-1 downto 0) := std_logic_vector(to_unsigned(0,M_tb));
	signal data_out_tb: std_logic_vector(N_tb-1 downto 0);

begin

	--a_tb <=  "000111" after 100 ns, "010000" after 300 ns;
	--b_tb <=  "001000" after 200 ns;
	data_in_tb <=  std_logic_vector(to_unsigned(7,N_tb)) after 100 ns;
	shift_amt_tb <=  std_logic_vector(to_unsigned(1,M_tb)) after 200 ns;


	DUT: entity work.BarrelShifter
		generic map(
			N => N_tb
		)
		port map(
			data_in 	=> data_in_tb, 
        	shift_amt 	=> shift_amt_tb, 
        	data_out	=> data_out_tb
		);
	
end;