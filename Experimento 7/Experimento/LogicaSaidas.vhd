library IEEE;
use IEEE.std_logic_1164.all;

entity LogicaSaidas is
    port (
        estado: in  std_logic_vector(3 downto 0);
        T:      out std_logic_vector(1 downto 0);
        R:      out std_logic
    );
end entity LogicaSaidas;

architecture behavioral of LogicaSaidas is
begin
    R <= '1' when estado = "0111" or estado = "1000" else '0';

    T <= "01" when estado = "0100" or estado = "1000" else
         "10" when estado = "0101" else
         "00";
end architecture behavioral;