library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_SomadorNibble is
    port (
        A, B: out std_logic_vector(3 downto 0)
    );
end entity tb_SomadorNibble;

architecture testbench of tb_SomadorNibble is
begin
    estimulos: process
        variable I: std_logic_vector(7 downto 0) := (others => '0'); 
    begin
        A <= I(3 downto 0);
        B <= I(7 downto 4);
        I := std_logic_vector(unsigned(I) + 1);
        wait for 500 ns;
    end process estimulos;
end architecture testbench;