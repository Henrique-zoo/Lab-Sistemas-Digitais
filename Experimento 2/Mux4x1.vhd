-- Universidade de Brasília (UnB)
-- Laboratório de Sistemas Digitais - Turma 02
-- Autor: Henrique Morcelles Salum
-- Data: 21/10/2024
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

entity Mux4x1 is
    port (
        D : in std_logic_vector(0 to 3);
        S : in std_logic_vector(0 to 1);
        Y : out std_logic
    );
end entity Mux4x1;

architecture main of Mux4x1 is

begin

    Y <= D(3) when (S = "00") else
         D(2) when (S = "10") else
         D(1) when (S = "01") else
         D(0) when (S = "11") else
         '-';
        
end architecture main;