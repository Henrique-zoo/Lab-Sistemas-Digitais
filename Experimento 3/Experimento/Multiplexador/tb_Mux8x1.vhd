-- Universidade de Brasília (UnB)
-- Laboratório de Sistemas Digitais - Turma 02
-- Autor: Henrique Morcelles Salum
-- Data: //2025
-- Relatório 3 - Questão 1

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_Mux8x1 is
end entity tb_Mux8x1;

architecture main of tb_Mux8x1 is
    component Mux8x1 is
        port (
            D: in std_logic_vector(7 downto 0);
            S: in std_logic_vector(2 downto 0);
            Y: out std_logic
        );
    end component Mux8x1;
    -- Declaração dos sinais internos do testbench
    signal D_tb: std_logic_vector(7 downto 0) := (others => '1');
    signal S_tb: std_logic_vector(2 downto 0) := (others => '0');
begin
    instancia_Mux8x1: component Mux8x1
        port map (
            D => D_tb,
            S => S_tb,
            Y => open
        );
    -- Processo para variar as entradas de seleção
    estimulos_seletoras: process
        variable s_unsigned: unsigned(2 downto 0); -- Variável para armazenar S_tb como unsigned
    begin
        wait for 12.5 ns;
        s_unsigned := unsigned(S_tb);
        s_unsigned := s_unsigned + 1;
        S_tb <= std_logic_vector(s_unsigned);
    end process estimulos_seletoras;
    -- Processo para variar as entradas selecionadas
    variacao_dados: process
        variable i: integer;
    begin
        wait for 6.25 ns; -- Depois que as entradas de seleção variam, esperamos metade do tempo da variação delas
        i := to_integer(unsigned(S_tb)); -- O índice do elemento do vetor D que é selecionado coincide com o valor do vetor S em inteiro
        D_tb(i) <= not D_tb(i);
        wait on S_tb; -- Espera a próxima mudança nas entradas de seleção
    end process variacao_dados;
end architecture main;