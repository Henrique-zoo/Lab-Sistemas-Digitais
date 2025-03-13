-- Universidade de Brasília (UnB)
-- Laboratório de Sistemas Digitais
-- Autor: Henrique Morcelles Salum
-- Data: 21/10/2024
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

entity tb_somadorCompleto is
end tb_somadorCompleto;

architecture main of tb_somadorCompleto is
    -- Declaração do componente "somadorCompleto"
    component somadorCompleto is
        port (
            A, B, Cin : in std_logic;
            S, Cout : out std_logic
        );
    end component somadorCompleto;

    -- Declaração dos sinais internos do testbench
    signal A_tb : std_logic := '0';
    signal B_tb : std_logic := '0';
    signal Cin_tb : std_logic := '0';

begin
    -- Instância do componente somadorCompleto
    instancia_somador : component somadorCompleto
        -- No port map, associamos os sinais internos do testbench com as portas do componente testado
        port map (
            A => A_tb,
            B => B_tb,
            Cin => Cin_tb,
            S => open,
            Cout => open
        );


    combinacoes : process
        variable i : integer := 1;
    begin
        if (i mod 2) = 0 then
            A_tb <= not A_tb;
        end if;
        if (i mod 4) = 0 then
            B_tb <= not B_tb;
        end if;
        if (i mod 8) = 0 then
            Cin_tb <= not Cin_tb;
        end if;

        i := i + 1;
        wait for 5 ns;
    end process combinacoes;
    
end architecture main;