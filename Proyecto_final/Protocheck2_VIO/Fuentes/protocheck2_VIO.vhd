library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity protocheck_VIO is
	port(
		clk_i: in std_logic
	);
end;



architecture protocheck_VIO_arq of protocheck_VIO is
	-- Parte declarativa

	component protocheck is
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
	end component;
	
	COMPONENT vio_0
      PORT (
        clk : IN STD_LOGIC;
        probe_in0 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
        probe_in1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        probe_out0 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
        probe_out1 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
        probe_out2 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
      );
    END COMPONENT;

		signal probe_rst, probe_ena, probe_clk: std_logic_vector (0 downto 0);
		signal probe_data: std_logic_vector(11 downto 0);
		signal probe_q: std_logic_vector (0 downto 0);

		--probe_clk <= clk_i;  -- le asigno el clock de salida del VIO a la punta probe_clk
        
	
begin
	--Parte descriptiva
	protocheck_inst: protocheck
		generic map(
				N => 12	-- Cantidad de bits del protocolo simplificado
		)
		Port map(
			clk_i	=> clk_i, --probe_clk(0),
			rst_i	=> probe_rst(0),
			ena_i	=> probe_ena(0),
			data_o  => probe_data,
			q_o 	=> probe_q(0)
		);

    your_instance_name : vio_0
        PORT MAP (
            clk => clk_i,
            probe_in0 => probe_data,
            probe_in1 => probe_q,
            probe_out0 => probe_clk,
            probe_out1 => probe_rst,
            probe_out2 => probe_ena
  );

 		
end;
