library IEEE;
use IEEE.std_logic_1164.all;

entity topModule is
end entity topModule;

architecture structural of topModule is
    component questao1 is
        port (
            A, B, C: in std_logic;
            X, Y: out std_logic
        );
    end component questao1;

    component tb_questao1 is
        port (
            A, B, C: out std_logic
        );
    end component tb_questao1;

    signal A_tb: std_logic;
    signal B_tb: std_logic;
    signal C_tb: std_logic;
begin
    instancia_testbench: component tb_questao1
        port map (
            A => A_tb,
            B => B_tb,
            C => C_tb
        );

    instancia_questao1: component questao1
        port map (
            A => A_Tb,
            B => B_tb,
            C => C_tb,
            X => open,
            Y => open
        );
end architecture structural;