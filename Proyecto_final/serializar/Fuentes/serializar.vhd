library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;



entity serial_sender is
    Port (
        clk       : in  std_logic;
        reset     : in  std_logic;
        serial_out: out std_logic
    );
end serial_sender;

architecture Behavioral of serial_sender is
    -- Definir la trama de bits predefinida
    constant BITSTREAM : std_logic_vector(11 downto 0) := "110011001111";
    signal bit_index   : integer range 0 to 11 := 0;
    signal current_bit : std_logic;
begin

    process(clk, reset)
    begin
        if reset = '1' then
            bit_index <= 0;
            current_bit <= '0';
        elsif rising_edge(clk) then
            current_bit <= BITSTREAM(bit_index);
            if bit_index = 11 then
                bit_index <= 0;
            else
                bit_index <= bit_index + 1;
            end if;
        end if;
    end process;

    serial_out <= current_bit;

end Behavioral;
