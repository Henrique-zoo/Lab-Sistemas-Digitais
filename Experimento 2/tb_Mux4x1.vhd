-- Universidade de Brasília (UnB)
-- Laboratório de Sistemas Digitais - Turma 02
-- Autor: Henrique Morcelles Salum
-- Data: 21/10/2024
-- Relatório 2 - Questão 2

library IEEE;
use IEEE.std_logic_1164.all;

entity tb_Mux4x1 is
end entity tb_Mux4x1;

architecture main of tb_Mux4x1 is
    
    component Mux4x1 is
        port (
            D : in std_logic_vector(0 to 3);
            S : in std_logic_vector(0 to 1);
            Y : out std_logic
        );
    end component Mux4x1;
    -- Declaração dos sinais internos do testbench
    signal D_tb : std_logic_vector(0 to 3) := (others => '1');
    signal S_tb : std_logic_vector(0 to 1) := (others => '0');
    signal Y_tb : std_logic;

begin
    
    instancia_Mux4x1 : component Mux4x1

        port map (
            D => D_tb,
            S => S_tb,
            Y => Y_tb
        );
    -- Processo que gera todas as combinalções das entradas de seleção
    estimulos : process
        variable i : integer := 0;
    begin
        
        if i /= 0 then
            if (i mod 2) = 0 then
                S_tb(0) <= not S_tb(0);
            end if;
            if (i mod 4) = 0 then
                S_tb(1) <= not S_tb(1);
            end if;
        end if;

        i := i + 1;
        wait for 12.5 ns;
    end process estimulos;
    -- Processo que gera variações nas entradas de dados selecionadas em cada momento para demonstrar mais claramente o funcionamento da saída
    process
    begin
        wait for 12.5 ns;
        case S_tb is
            when "00" =>
                D_tb(3) <= not D_tb(3);
            when "10" =>
                D_tb(2) <= not D_tb(2);
            when "01" =>
                D_tb(1) <= not D_tb(1);
            when "11" =>
                D_tb(0) <= not D_tb(0);
            when others =>
                D_tb <= D_tb;
        end case;
    end process;
    
end architecture main;