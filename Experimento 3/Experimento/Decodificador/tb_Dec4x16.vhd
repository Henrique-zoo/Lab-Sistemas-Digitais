-- Universidade de Brasília (UnB)
-- Laboratório de Sistemas Digitais - Turma 07
-- Autor: Henrique Morcelles Salum
-- Data: //2025
-- Relatório 3 - Questão 2

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_Dec4x16 is
end entity tb_Dec4x16;

architecture testbench of tb_Dec4x16 is
    component Dec4x16 is
        port (
            A: in std_logic_vector(3 downto 0);
            Y: out std_logic_vector(15 downto 0)
        );
    end component Dec4x16;
    signal A_tb: std_logic_vector(3 downto 0) := (others => '0'); -- Sinal interno do testbench
begin
    instancia_Dec4x16: component Dec4x16
        port map (
            A => A_tb,
            Y => open
        );

    estimulos: process
        variable Uns_A: unsigned(3 downto 0);
    begin
        wait for 6.25 ns;
        Uns_A := unsigned(A_tb);
        A_tb <= std_logic_vector(Uns_A + 1);
    end process estimulos;
end architecture testbench;