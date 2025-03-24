-- Universidade de Brasília (UnB)
-- Laboratório de Sistemas Digitais - Turma 07
-- Autor: Henrique Morcelles Salum
-- Data: //2024
-- Relatório 3 - Questão 2

-- **********************************************
-- Circuito: decodificador 4x16:
--             A: vetor de entrada
--             Y: vetor de saída
-- **********************************************

library IEEE;
use IEEE.std_logic_1164.all;

entity Dec4x16 is
    port (
        A: in std_logic_vector(3 downto 0);
        Y: out std_logic_vector(15 downto 0)
    );
end entity Dec4x16;

architecture behavioral of Dec4x16 is
begin
    with A select Y <=
        X"0001" when X"0",
        X"0002" when X"1",
        X"0004" when X"2",
        X"0008" when X"3",
        X"0010" when X"4",
        X"0020" when X"5",
        X"0040" when X"6",
        X"0080" when X"7",
        X"0100" when X"8",
        X"0200" when X"9",
        X"0400" when X"A",
        X"0800" when X"B",
        X"1000" when X"C",
        X"2000" when X"D",
        X"4000" when X"E",
        X"8000" when X"F",
        "----------------" when others;
end architecture behavioral;