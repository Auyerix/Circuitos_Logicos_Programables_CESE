library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity protocheck is
	generic(
		N: natural := 12	-- Cantidad de bits del protocolo simplificado
	);
	port(
		clk_i	: in std_logic;
		rst_i	: in std_logic;
		ena_i	: in std_logic;
		data_o	: out std_logic_vector(N-1 downto 0); 	--salida del shift register
		q_o 	: out std_logic 						--salida de dato válido
	);
end;

architecture protocheck_arq of protocheck is
	-- Parte declarativa

	--señales para ingresar con los datos del shift register a los comparadores
	-- 4 bits de señal / 2 bits de número de módulo
	signal comparador_dataA: std_logic_vector(3 downto 0);
	signal comparador_dataB: std_logic_vector(3 downto 0);
	signal comparador_dataC: std_logic_vector(1 downto 0);
	signal comparador_dataD: std_logic_vector(1 downto 0);

	signal auxi: std_logic_vector(11 downto 0);

	-- señales de salida de generador de enable (cuenta de pulsos) y comparadores
	signal salida_genEna: std_logic;
	signal salida_comparador1: std_logic;
	signal salida_comparador2: std_logic;

	signal serial: std_logic;
	
begin
	--Parte descriptiva

	--carga los datos de salida del shift register en las variables para entrar en los comparadores
	comparador_dataA(0) <= auxi(2);
	comparador_dataA(1) <= auxi(3);
	comparador_dataA(2) <= auxi(4);
	comparador_dataA(3) <= auxi(5);

	comparador_dataB(0) <= auxi(6);
	comparador_dataB(1) <= auxi(7);
	comparador_dataB(2) <= auxi(8);
	comparador_dataB(3) <= auxi(9);


	comparador_dataC(0) <= auxi(0);
	comparador_dataC(1) <= auxi(1);
	comparador_dataD(0) <= auxi(10);
	comparador_dataD(1) <= auxi(11);

	--vuelca el dato de salida de los shift registers en el puerto
	data_o	<= auxi;
	--lógica de salida de la validación de comparación y de cantidad de pulsos
	--se vuelca en la salida del módulo que servirá para latchear las salidas reales
	q_o 	<= salida_genEna and salida_comparador1 and salida_comparador2;


	--comparador que chequea el dato
	inst_comparador_dato: entity work.comparador
		generic map(
			N => 4 --compara 4 bits
		)
		port map(
			dataA_i => comparador_dataA,
			dataB_i => comparador_dataB,
			result_o => salida_comparador1
		);

	--comparador que chequea el número de de módulo al que se le manda la info
	inst_comparador_modulo: entity work.comparador
		generic map(
			N => 2 --compara 2 bits
		)
		port map(
			dataA_i => comparador_dataC,
			dataB_i => comparador_dataD,
			result_o => salida_comparador2 
		);
	
	--registro para guardar los 12 datos que vienen de la cpu
	inst_shiftreg: entity work.shiftreg
		generic map(
			N => N
		)
		port map(
			clk_i 	=> clk_i,
			rst_i 	=> rst_i,
			ena_i	=> ena_i,
			d_i		=> serial, --data_i,
			q_o 	=> auxi
		);

		--pulso para evaluar que los datos son correctos luego de las 12
		--cuentas de reloj se pone en enable
	inst_genEna: entity work.genEna
		generic map(
			N => 12
		)
		port map(
			clk_i 	=> clk_i,
			rst_i 	=> rst_i,
			ena_i	=> ena_i,
			q_o 	=> salida_genEna --TEST: --q_o --salida_genEna
		);

		inst_serializar: entity work.serial_sender
		
		port map(
			clk 		=> clk_i,
			reset 		=> rst_i,
			serial_out	=>serial

		);
 		
end;
