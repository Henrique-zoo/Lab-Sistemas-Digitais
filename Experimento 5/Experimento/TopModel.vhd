library IEEE;
use IEEE.std_logic_1164.all;

entity TopModel is
end entity TopModel;

architecture structural of TopModel is

    component tb_SomadorNibble is
        port (
            A, B: out std_logic_vector(3 downto 0)
        );
    end component tb_SomadorNibble;

    component SomadorNibble is
        port (
            A, B: in std_logic_vector(3 downto 0);
            S: out std_logic_vector(4 downto 0)
        );
    end component SomadorNibble;

    component SomadorNibbleArith is
        port (
            A, B: in std_logic_vector(3 downto 0);
            S: out std_logic_vector(4 downto 0)
        );
    end component SomadorNibbleArith;

    signal A_tb, B_tb: std_logic_vector(3 downto 0);
    signal S, S_arith: std_logic_vector(4 downto 0);
begin

    testbench: component tb_SomadorNibble
        port map (
            A => A_tb,
            B => B_tb
        );
    
    instancia_somadorNibble: component SomadorNibble
        port map (
            A => A_tb,
            B => B_tb,
            S => S
        );
    
    instancia_somadorNibbleArith: component SomadorNibbleArith
        port map (
            A => A_tb,
            B => B_tb,
            S => S_arith
        );

    comparacao: process
    begin
        if S /= S_arith then
            report "Diferente!";
        end if;
        wait on A_tb, B_tb;
    end process comparacao;

end architecture structural;