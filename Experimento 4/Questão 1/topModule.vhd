library IEEE;
use IEEE.std_logic_1164.all;

entity topModule is
end entity topModule;

architecture rtl of topModule is

    component questao1 is
        port (
            A, B, C : in std_logic;
            X, Y : out std_logic
        );
    end component questao1;

    component tb_topModule is
        port (
            A, B, C : out std_logic
        );
    end component tb_topModule;

    signal A_tb : std_logic := '0';
    signal B_tb : std_logic := '0';
    signal C_tb : std_logic := '0';

begin
    
    instancia_questao1 : component questao1

        port map (
            A => A_Tb,
            B => B_tb,
            C => C_tb,
            X => open,
            Y => open
        );

    instancia_tb_topModule : component tb_topModule

        port map (
            A => A_tb,
            B => B_tb,
            C => C_tb
        );


end architecture rtl;