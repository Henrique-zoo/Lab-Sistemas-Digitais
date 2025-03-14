-- Universidade de Brasília (UnB)
-- Laboratório de Sistemas Digitais - Turma 07
-- Autor: Henrique Morcelles Salum
-- Data: --/04/2024
-- Relatório 2 - Questão 1

-- **********************************************
-- Circuito: Somador Completo de três entradas:
--                  A Entrada 1
--                  B Entrada 2
--                  Cin Entrada 3
--                  S Saída 1
--                  Cout Saída 2
-- **********************************************

library IEEE;
use IEEE.std_logic_1164.all;

-- Criação da entidade, que declara entradas e saídas do sistema
entity somadorCompleto is
    port (
        A, B, Cin : in std_logic; -- Entradas
        S, Cout : out std_logic -- Saídas
    );
end somadorCompleto;

-- Criação da arquitetura, que estabelece a lógica entre as entradas e saídas
architecture main of somadorCompleto is
begin
    S <= A xor B xor Cin; -- Lógica da saída S
    Cout <= (A and B) or (A and Cin) or (B and Cin); -- Lógica da saída Cout
end architecture main;