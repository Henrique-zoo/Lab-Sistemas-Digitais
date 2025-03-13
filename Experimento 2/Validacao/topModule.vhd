library IEEE;
use IEEE.std_logic_1164.all;

entity topModule is
end entity topModule;

architecture rtl of topModule is

    component somadorCompleto is
        port (
            A, B, Cin : in std_logic;
            S, Cout : out std_logic
        );
    end component somadorCompleto;

    component tb_topModule is
        port (
            A, B, Cin : out std_logic
        );
    end component tb_topModule;
    
    signal A_tb : std_logic := '0';
    signal B_tb : std_logic := '0';
    signal Cin_tb : std_logic := '0';

begin
    
    instancia_somador : component somadorCompleto

        port map (
            A => A_tb,
            B => B_tb,
            Cin => Cin_tb,
            S => open,
            Cout => open
        );

    instancia_topModule : component tb_topModule

        port map (
            A => A_tb,
            B => B_tb,
            Cin => Cin_tb
        );
    
    
end architecture rtl;