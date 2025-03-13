library IEEE;
use IEEE.std_logic_1164.all;

entity q2_topModule is
end entity q2_topModule;

architecture rtl of q2_topModule is

    component questao2 is
        port (
            A, B, C, D, E, F, G : in std_logic;
            S : out std_logic
        );
    end component questao2;

    component q2_tb_topModule is
        port (
            A, B, C, D, E, F, G : out std_logic
        );
    end component q2_tb_topModule;

    signal A_tb : std_logic := '0';
    signal B_tb : std_logic := '0';
    signal C_tb : std_logic := '0';
    signal D_tb : std_logic := '0';
    signal E_tb : std_logic := '0';
    signal F_tb : std_logic := '0';
    signal G_tb : std_logic := '0';

begin

    instancia_q2_tb_topModule : component q2_tb_topModule

        port map (
            A => A_Tb,
            B => B_tb,
            C => C_tb,
            D => D_Tb,
            E => E_tb,
            F => F_tb,
            G => G_tb
        );
    
    instancia_questao2 : component questao2

        port map (
            A => A_Tb,
            B => B_tb,
            C => C_tb,
            D => D_Tb,
            E => E_tb,
            F => F_tb,
            G => G_tb,
            S => open
        );


end architecture rtl;