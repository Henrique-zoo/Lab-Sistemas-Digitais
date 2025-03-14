-- Universidade de Brasília (UnB)
-- Laboratório de Sistemas Digitais - Turma 07
-- Autor: Henrique Morcelles Salum
-- Data: --/04/2025
-- Relatório 2 - Questão 2

-- O multiplexador 4x1 é um dispositivo que, dadas quatro entradas de dados D, seleciona uma delas como saída por meio das entradas de seleção S

-- **********************************************
-- Circuito: Multiplexador 4x1:
--             D: vetor de entradas dados
--             S: vetor entradas de seleção
--             Y: saída
-- **********************************************

library IEEE;
use IEEE.std_logic_1164.all;

-- Criação da Entidade
entity Mux4x1 is
    port (
        D : in std_logic_vector(3 downto 0); -- Entradas de dados
        S : in std_logic_vector(1 downto 0); -- Entradas de seleção
        Y : out std_logic -- Saída
    );
end entity Mux4x1;

-- Criação da Arquitetura
architecture main of Mux4x1 is
begin
    -- Lógica da saída definida em função das entradas de seleção
    Y <= D(3) when (S = "11") else
         D(2) when (S = "10") else
         D(1) when (S = "01") else
         D(0) when (S = "00") else
         '-';
end architecture main;