library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_questao1 is
    port (
        A, B, C: out std_logic
    );
end tb_questao1;

architecture testbench of tb_questao1 is
    signal X: std_logic_vector(2 downto 0) := (others => '0');
begin
    estimulos: process
    begin
        wait for 7 ns;
        X <= std_logic_vector(unsigned(X) + 1);
    end process estimulos;
    A <= X(2);
    B <= X(1);
    C <= X(0);
end architecture testbench;