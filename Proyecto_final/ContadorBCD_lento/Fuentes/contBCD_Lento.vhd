library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity contBCD_Lento is
	generic(
		N: natural := 5	-- Cantidad de ciclos a contar
	);
	port(
		clk_i	: in std_logic;
		rst_i	: in std_logic;
		ena_i	: in std_logic;
		q_o		: out std_logic_vector(3 downto 0);
		max_o 	: out std_logic
	);
end;

architecture contBCD_Lento_arq of contBCD_Lento is
	-- Parte declarativa
	signal genEna_sal: std_logic;
	
begin

	--Parte descriptiva
	inst_contBCD: entity work.contBCD
		port map(
			clk_i => clk_i,
			rst_i => rst_i,
			ena_i => genEna_sal,
			q_o => q_o,
			max_o => max_o
		);
	

	inst_gen_ena: entity work.genEna
		generic map(
			N => N
		)
		port map(
			clk_i 	=> clk_i,
			rst_i 	=> rst_i,
			ena_i	=> ena_i,
			q_o 	=> genEna_sal
		);
		

 		
end;