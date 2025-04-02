library IEEE;
use IEEE.std_logic_1164.all;

entity Mux4x1 is
    port (
        D: in std_logic_vector(3 downto 0);
        S: in std_logic_vector(1 downto 0);
        Y: out std_logic
    );
end entity Mux4x1;

architecture behavioral of Mux4x1 is
begin
    Y <= D(3) when (S = "11") else
         D(2) when (S = "10") else
         D(1) when (S = "01") else
         D(0) when (S = "00") else
         '-';
end architecture behavioral;
