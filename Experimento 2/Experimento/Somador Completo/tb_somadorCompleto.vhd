-- Universidade de Brasília (UnB)
-- Laboratório de Sistemas Digitais - Turma 07
-- Autor: Henrique Morcelles Salum
-- Data: --/04/2025
-- Relatório 2 - questão 1

-- *************************************************
-- Testbench para a simulação funcional do circuito:
-- Somador completo com três entradas
--                 A Entrada 1
--                 B Entrada 2
--                 Cin Entrada 3
--                 S saída 1
--                 Cout saída 2
-- *************************************************

library IEEE;
use IEEE.std_logic_1164.all;

-- A entidade do testbench é vazia pois ele nunca será instanciado
entity tb_somadorCompleto is
end tb_somadorCompleto;

architecture testbench of tb_somadorCompleto is
    -- Declaração do componente "somadorCompleto". Pense num componente como uma classe
    component somadorCompleto is
        port (
            A, B, Cin: in std_logic;
            S, Cout: out std_logic
        );
    end component somadorCompleto;
    
    signal A_tb: std_logic := '0'; -- Sinais internos do testbench
    signal B_tb: std_logic := '0';
    signal Cin_tb: std_logic := '0';
begin
    -- Inicialização da instância do componente - como se fosse um objeto
    instancia_somador: component somadorCompleto 
        port map (
            A => A_tb,
            B => B_tb,
            Cin => Cin_tb,
            S => open,
            Cout => open
        );
    -- Processo para variar as entradas
    estimulos: process
        variable i: integer := 0;
    begin
        if i /= 0 then
            if i mod 2 = 0 then Cin_tb <= not Cin_tb;
            end if;
            if i mod 4 = 0 then B_tb <= not B_tb;
            end if;
            if i mod 8 = 0 then A_tb <= not A_tb;
            end if;
        end if;

        i := i + 1;
        wait for 6.25 ns;
    end process estimulos;
end architecture testbench;