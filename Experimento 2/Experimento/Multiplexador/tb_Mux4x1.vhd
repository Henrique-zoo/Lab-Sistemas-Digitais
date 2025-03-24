-- Universidade de Brasília (UnB)
-- Laboratório de Sistemas Digitais - Turma 02
-- Autor: Henrique Morcelles Salum
-- Data: 21/10/2024
-- Relatório 2 - Questão 2

-- ********
-- Testbench para simulação funcional do
-- Circuito: Experimento 2 - Multiplexador 4 para 1
-- ********

-- Importação das bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- A entidade é vazia pois o testbench não será instanciado
entity tb_Mux4x1 is
end entity tb_Mux4x1;

-- Arquitetura do Testbench
architecture testbench of tb_Mux4x1 is
    -- Definimos o componente Mux4x1, pense nele como uma classe (da POO)
    component Mux4x1 is
        port (
            D: in std_logic_vector(3 downto 0);
            S: in std_logic_vector(1 downto 0);
            Y: out std_logic
        );
    end component Mux4x1;
    -- Criação dos sinais internos do testbench
    signal D_tb: std_logic_vector(3 downto 0) := (others => '1');
    signal S_tb: std_logic_vector(1 downto 0) := (others => '0');
begin
    -- Pense na instância do componente como um objeto 
    instancia_Mux4x1: component Mux4x1
        port map (
            D => D_tb, -- Associamos os sinais do
            S => S_tb, -- Testbench às entradas do sistema
            Y => open -- A saída é deixada open, isto é, não está ligada a nada
        );

    -- Processo para variar as entradas de seleção
    estimulos_seletoras: process
        variable s_unsigned: unsigned(1 downto 0); -- Variável para armazenar S_tb como unsigned
    begin
        wait for 25 ns;
        s_unsigned := unsigned(S_tb);
        s_unsigned := s_unsigned + 1;
        S_tb <= std_logic_vector(s_unsigned);
    end process estimulos_seletoras;
    
    -- Processo para variar as entradas selecionadas
    variacao_dados: process
        variable i: integer;
    begin
        wait for 12.5 ns;
        i := to_integer(unsigned(S_tb)); -- O índice do elemento do vetor D que é selecionado coincide com o valor do vetor S em inteiro
        D_tb(i) <= not D_tb(i);
        wait on S_tb;
    end process variacao_dados;
end architecture testbench;