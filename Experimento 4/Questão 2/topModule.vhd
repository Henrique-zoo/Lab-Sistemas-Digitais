library IEEE;
use IEEE.std_logic_1164.all;

entity topModule is
end entity topModule;

architecture structural of topModule is
    component questao2 is
        port (
            A, B, C, D, E, F, G: in std_logic;
            S: out std_logic
        );
    end component questao2;

    component tb_questao2 is
        port (
            A, B, C, D, E, F, G: out std_logic
        );
    end component tb_questao2;

    signal X: std_logic_vector(6 downto 0);
begin
    instancia_tb_questao2 : component tb_questao2
        port map (
            A => X(6),
            B => X(5),
            C => X(4),
            D => X(3),
            E => X(2),
            F => X(1),
            G => X(0)
        );
    
    instancia_questao2 : component questao2
        port map (
            A => X(6),
            B => X(5),
            C => X(4),
            D => X(3),
            E => X(2),
            F => X(1),
            G => X(0),
            S => open
        );
end architecture structural;