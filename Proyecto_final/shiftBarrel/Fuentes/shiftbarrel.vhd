-- basado en un ejemplo de IA con modificaciones N entrada M desplazamiento fijo en 2 bits
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
--use IEEE.STD_LOGIC_ARITH.ALL;

entity BarrelShifter is
	generic(
		N: natural := 4
        --M: natural := 4
	);

	Port (
        data_in :	in  STD_LOGIC_VECTOR(N-1 downto 0);  	-- Entrada de datos de N bits
        shift_amt : in  STD_LOGIC_VECTOR(1 downto 0); 	-- Cantidad de desplazamiento
        data_out : 	out  STD_LOGIC_VECTOR(N-1 downto 0)  	-- Salida de datos desplazados
    );
end;

architecture Behavioral of BarrelShifter is
--Parte declarativa

begin
	--Parte descriptiva

    process(data_in, shift_amt)
    begin
        case shift_amt is
            when "00" =>
                data_out <= data_in;
            when "01" =>
                data_out <= data_in(2 downto 0) & '0';
            when "10" =>
                data_out <= data_in(1 downto 0) & "00";
            when "11" =>
                data_out <= data_in(0) & "000";
            when others =>
                data_out <= (others => '0');
        end case;

    end process;

end;
