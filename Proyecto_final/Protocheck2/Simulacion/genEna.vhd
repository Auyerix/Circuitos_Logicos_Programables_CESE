
library IEEE;
use IEEE.std_logic_1164.all;
--use IEEE.numeric_std.all;

entity genEna is
    generic(
		N: natural := 5
	);
    port (
        clk_i, rst_i, ena_i: in std_logic;
        q_o: out std_logic
    );
end genEna;

architecture genEna_arq of genEna is
    -- PArte declarativa
    signal cuenta: integer;

    begin
        --Parte descriptiva
        process(clk_i)
            variable aux: integer;
        begin
            if (rising_edge(clk_i)) then
                if rst_i='1' then
                    aux := 0;
                    q_o <= '0';
                elsif ena_i = '1' then
                    aux := aux + 1;
                    if aux = N then
                        q_o <= '1';
                        aux := 0;
                    else
                        q_o <= '0';
                    end if;
                end if;
            end if;

            cuenta <= aux;
        end process;

end;
