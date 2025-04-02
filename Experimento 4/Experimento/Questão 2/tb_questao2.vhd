library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_questao2 is
    port (
        A, B, C, D, E, F, G: out std_logic
    );
end tb_questao2;

architecture testbench of tb_questao2 is
    signal X: std_logic_vector(6 downto 0) := (others => '0');
begin
    estimulos: process
    begin
        wait for 1 ns;
        X <= std_logic_vector(unsigned(X) + 1);
    end process estimulos;
    A <= X(6);
    B <= X(5);
    C <= X(4);
    D <= X(3);
    E <= X(2);
    F <= X(1);
    G <= X(0);
end architecture testbench;