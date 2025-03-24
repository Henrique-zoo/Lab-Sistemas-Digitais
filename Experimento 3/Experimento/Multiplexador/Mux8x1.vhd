-- Universidade de Brasília (UnB)
-- Laboratório de Sistemas Digitais - Turma 07
-- Autor: Henrique Morcelles Salum
-- Data: //2025
-- Relatório 3 - Questão 1

-- **********************************************
-- Circuito: Multiplexador 8x1:
--             D: vetor de entradas dados
--             S: vetor entradas de seleção
--             Y: saída
-- **********************************************

library IEEE;
use IEEE.std_logic_1164.all;

entity Mux8x1 is
    port (
        D: in std_logic_vector(7 downto 0);
        S: in std_logic_vector(2 downto 0);
        Y: out std_logic
    );
end entity Mux8x1;

architecture behavioral of Mux8x1 is
begin
    Y <= D(7) when S = "111" else
         D(6) when S = "110" else
         D(5) when S = "101" else
         D(4) when S = "100" else
         D(3) when S = "011" else
         D(2) when S = "010" else
         D(1) when S = "001" else
         D(0) when S = "000" else
         '-';    
end architecture behavioral;