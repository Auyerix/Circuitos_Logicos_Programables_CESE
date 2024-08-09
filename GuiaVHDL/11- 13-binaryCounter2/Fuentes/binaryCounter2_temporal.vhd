--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity contador_binario is
    Port ( 
            clk : in STD_LOGIC;
            rst_i : in STD_LOGIC;
            q_o : out STD_LOGIC_VECTOR (3 downto 0)
        );

end contador_binario;

architecture Behavioral of contador_binario is

    signal count : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal count_u: unsigned(3 downto 0);


    begin
        --Parte descriptiva
        process(clk)
        begin
            if rising_edge(clk_i) then
                if rst_i = '1' then
                    count <= (others => '0');
                else 
                    count <= count + 1;
                end if;
            end if;
        end process;
        
    q_o <= count;
end Behavioral;

