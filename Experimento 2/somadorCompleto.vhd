-- Universidade de Brasília (UnB)
-- Laboratório de Sistemas Digitais - Turma 02
-- Autor: Henrique Morcelles Salum
-- Data: 21/10/2024
-- Relatório 2 - Questão 1

-- O somador completo é um dispositivo que, dadas três entradas A, B e Carry-in, em que A e B representam os bits de uma posição dos dois números somados e Carry-in o "vai-um" da soma em uma posição anterior, realiza a soma binária dessas três entradas, sendo a saída S o valor da soma na posição e Cout o "vai um" dessa soma

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

entity somadorCompleto is
    port (
        A, B, Cin : in std_logic;
        S, Cout : out std_logic
    );
end somadorCompleto;

architecture main of somadorCompleto is
begin

    S <= A xor B xor Cin;
    Cout <= (A and B) or (A and Cin) or (B and Cin);

end architecture main;