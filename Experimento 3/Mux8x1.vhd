-- Universidade de Brasília (UnB)
-- Laboratório de Sistemas Digitais - Turma 02
-- Autor: Henrique Morcelles Salum
-- Data: 11/11/2024
-- Relatório 3 - Questão 1

-- O multiplexador 8x1 é um dispositivo que, dadas oito entradas de dados D, seleciona uma delas como saída por meio de três entradas de seleção S

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
        D : in std_logic_vector(7 downto 0);
        S : in std_logic_vector(2 downto 0);
        Y : out std_logic
    );
end entity Mux8x1;

architecture main of Mux8x1 is

begin

    Y <= D(7) when (S = "111") else
         D(6) when (S = "110") else
         D(5) when (S = "101") else
         D(4) when (S = "100") else
         D(3) when (S = "011") else
         D(2) when (S = "010") else
         D(1) when (S = "001") else
         D(0) when (S = "000") else
         '-';
        
end architecture main;