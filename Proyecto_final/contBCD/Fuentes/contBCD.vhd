library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity contBCD is
	port(
		clk_i: in std_logic;
		rst_i: in std_logic;
		ena_i: in std_logic;
		q_o: out std_logic_vector(3 downto 0);
		max_o: out std_logic
	);
end;

architecture contBCD_arq of contBCD is
	--Parte declarativa

	component reg is
		generic(
			N: natural := 4
		);
		port(
			clk_i: in std_logic;
			rst_i: in std_logic;
			ena_i: in std_logic;
			d_i: in std_logic_vector(N-1 downto 0);
			q_o: out std_logic_vector(N-1 downto 0)
		);
	end component;
	
	signal salReg: std_logic_vector(3 downto 0);
	signal salOr: std_logic;
	signal salSum: std_logic_vector(3 downto 0);
	signal salAnd: std_logic;
	signal salComp: std_logic;

	
begin
	--Parte descriptiva
	--rst_aux <= (salComp or rst_i);
	
	reg_inst: reg
		generic map(
			N => 4
		)
		port map(
			clk_i => clk_i,
			rst_i => salOr,
			ena_i => ena_i,
			d_i   => salSum,
			q_o   => salReg
		);
	
	salSum <= std_logic_vector(unsigned(salReg) + "0001"); --to_integer(unsigned(salReg)) + 1;
	salComp <= salReg(3) and not salReg(2) and not salReg(1) and salReg(0); --"1001"
	-- Alternativa sugerida salCom <= '1' when salReg = "1001" ese '0';
	salAnd <= ena_i and salComp;
	salOr <= rst_i or salAnd;
	max_o <= salComp;
	q_o <= salReg;


	-- todo esto estaba en el archivo original
	-- Multiplexer
	--salMux <= salInc when ena_i = '1' else salReg;
	
	-- Comparador
	--salComp <= salReg(3) and not salReg(2) and not salReg(1) and salReg(0) and ena_i; -- "1001"
	
	--salInc <= std_logic_vector(unsigned(salReg) + 1);
	
	--s_o <= salReg;
 		
end;