library IEEE;
use IEEE.std_logic_1164.all;

entity SomadorNibble is
    port (
        A, B: in std_logic_vector(3 downto 0);
        S: out std_logic_vector(4 downto 0)
    );
end entity SomadorNibble;

architecture structural of SomadorNibble is
    component SomadorCompleto is
        port (
            A, B, Cin: in std_logic;
            S, Cout: out std_logic
        );
    end component SomadorCompleto;

    signal Cout_0, Cout_1, Cout_2: std_logic;
begin
    somador_1: component SomadorCompleto
        port map (
            A => A(0),
            B => B(0),
            Cin => '0',
            S => S(0),
            Cout => Cout_0
        );
    somador_2: component SomadorCompleto
        port map (
            A => A(1),
            B => B(1),
            Cin => Cout_0,
            S => S(1),
            Cout => Cout_1
        );
    somador_3: component SomadorCompleto
        port map (
            A => A(2),
            B => B(2),
            Cin => Cout_1,
            S => S(2),
            Cout => Cout_2
        );
    somador_4: component SomadorCompleto
        port map (
            A => A(3),
            B => B(3),
            Cin => Cout_2,
            S => S(3),
            Cout => S(4)
        );
end architecture structural;