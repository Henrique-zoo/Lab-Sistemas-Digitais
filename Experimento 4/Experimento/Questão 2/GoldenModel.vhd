library IEEE;
use IEEE.std_logic_1164.all;

entity GoldenModel is
    port (
        A, B, C, D, E, F, G: in std_logic;
        S: out std_logic
    );
end entity GoldenModel;

architecture behavioral of GoldenModel is
begin
    process(A, B, C, D, E, F, G)
        variable I: std_logic_vector(6 downto 0);
    begin
        I := std_logic_vector'(A & B & C & D & E & F & G);
        case I is 
            when "0000001" | "0000011" | "0000111" | "0001011" |
            "0001111" | "0010011" | "0010111" | "0011011" |
            "0011111" | "0100011" | "0100111" | "0101011" |
            "0101111" | "0110011" | "0110111" | "0111010" |
            "0111011" | "0111111" | "1000011" | "1000111" |
            "1001011" | "1001100" | "1001111" | "1010011" |
            "1010111" | "1011011" | "1011111" | "1100011" |
            "1100111" | "1101011" | "1101111" | "1110011" |
            "1110111" | "1111001" | "1111011" | "1111100" |
            "1111111" => 
                S <= '1';
            when others => 
                S <= '0';
        end case;
    end process;
end architecture behavioral;