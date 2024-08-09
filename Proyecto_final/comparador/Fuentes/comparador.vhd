
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity comparador is
    generic(
		N: natural := 4
	);
    port (
        dataA_i: in std_logic_vector(N-1 downto 0);
        dataB_i: in std_logic_vector(N-1 downto 0);
        result_o: out std_logic
    );
end comparador;

architecture comparador_arq of comparador is

begin
        --Parte descriptiva
        comparador_proc: process(dataA_i, dataB_i)

        begin
                if dataA_i = dataB_i then
                    result_o <= '1';
                else
                    result_o <= '0';
                end if;


        end process comparador_proc;

end;
