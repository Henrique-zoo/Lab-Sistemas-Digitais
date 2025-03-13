-- Universidade de Brasília (UnB)
-- Laboratório de Sistemas Digitais - Turma 02
-- Autor: Henrique Morcelles Salum
-- Data: 11/11/2024
-- Relatório 3 - Questão 1

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_Mux8x1 is
end entity tb_Mux8x1;

architecture main of tb_Mux8x1 is
    
    component Mux8x1 is
        port (
            D : in std_logic_vector(7 downto 0);
            S : in std_logic_vector(2 downto 0);
            Y : out std_logic
        );
    end component Mux8x1;
    -- Declaração dos sinais internos do testbench
    signal D_tb : std_logic_vector(7 downto 0) := (others => '1');
    signal S_tb : std_logic_vector(2 downto 0) := (others => '0');

begin
    
    instancia_Mux8x1 : component Mux8x1

        port map (
            D => D_tb,
            S => S_tb,
            Y => open
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
            if (i mod 8) = 0 then
                S_tb(2) <= not S_tb(2);
            end if;
        end if;

        i := i + 1;
        wait for 6.25 ns;

    end process estimulos;
    -- Processo que gera variações nas entradas de dados selecionadas em cada momento para demonstrar mais claramente o funcionamento da saída
    process
        variable Uns_S : unsigned(2 downto 0);
    begin
        
        wait for 6.25 ns;

        Uns_S := unsigned(S_tb);
        D_tb(to_integer(Uns_S)) <= not D_tb(to_integer(Uns_S));

    end process;
    
end architecture main;