
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
-- li pata que indica carga de valor inicial

entity contador is
    generic(
		N: natural := 4
	);
    port (
        clk, rst, ld: in std_logic;
        initial_value: in std_logic_vector(N-1 downto 0);
        count: out std_logic_vector(N-1 downto 0)
    );
end contador;

architecture contador_arq of contador is

    begin
        --Parte descriptiva
        count_proc: process(clk)
            variable count_i: unsigned(N-1 downto 0);
        begin
            if (rising_edge(clk)) then
                if rst='1' then
                    count_i := (others => '0');
                elsif (ld = '1') then
                    count_i := unsigned(initial_value);
                else
                    count_i := count_i + 1;
                end if;
            end if;

            count <= std_logic_vector(count_i);
        end process count_proc;

end;
