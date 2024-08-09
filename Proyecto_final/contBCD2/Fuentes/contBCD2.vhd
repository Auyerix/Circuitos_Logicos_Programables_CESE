
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
-- li pata que indica carga de valor inicial

entity contadorBCD is
    generic(
		N: natural := 4
	);
    port (
        clk, rst, ld: in std_logic;
        initial_value: in std_logic_vector(N-1 downto 0);
        count: out std_logic_vector(N-1 downto 0)
    );
end contadorBCD;

architecture contadorBCD_arq of contadorBCD is

    begin
        --Parte descriptiva
        countBCD_proc: process(clk)
            variable count_i: integer range 0 to 16;
        begin
            if (rising_edge(clk)) then
                if rst='1' then
                    count_i := 0;
                elsif (ld = '1') then
                    count_i := to_integer(unsigned(initial_value));
                else
                    count_i := count_i + 1;
                    if count_i = 10 then
                        count_i := 0;
                    end if;
                end if;
            end if;

            count <= std_logic_vector(to_unsigned(count_i,N));
        end process countBCD_proc;

end;
