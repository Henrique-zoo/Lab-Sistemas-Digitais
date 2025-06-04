library IEEE;
use IEEE.std_logic_1164.all;

entity q2_topModule is
end entity q2_topModule;

architecture structural of q2_topModule is
    component questao2 is
        port (
            A, B, C, D, E, F, G: in std_logic;
            S: out std_logic
        );
    end component questao2;

    component GoldenModel is
        port (
            A, B, C, D, E, F, G: in std_logic;
            S: out std_logic
        );
    end component GoldenModel;

    component tb_questao2 is
        port (
            A, B, C, D, E, F, G: out std_logic
        );
    end component tb_questao2;

    signal X: std_logic_vector(6 downto 0);
    signal q2_output: std_logic;
    signal goldenModel_output: std_logic;
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
            S => q2_output
        );
    
    instancia_goldenModel : component questao2
        port map (
            A => X(6),
            B => X(5),
            C => X(4),
            D => X(3),
            E => X(2),
            F => X(1),
            G => X(0),
            S => goldenModel_output
        );

    comparacao: process(q2_output, goldenModel_output)
    begin
        if q2_output /= goldenModel_output then
            report "Erro!!";
        end if;
    end process comparacao;


end architecture structural;