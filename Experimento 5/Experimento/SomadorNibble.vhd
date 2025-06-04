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

    signal s_carry0, s_carry1, s_carry2: std_logic;
begin
    somador0: component SomadorCompleto
        port map (
            A => A(0),
            B => B(0),
            Cin => '0',
            S => S(0),
            Cout => s_carry0
        );
    somador1: component SomadorCompleto
        port map (
            A => A(1),
            B => B(1),
            Cin => s_carry0,
            S => S(1),
            Cout => s_carry1
        );
    somador2: component SomadorCompleto
        port map (
            A => A(2),
            B => B(2),
            Cin => s_carry1,
            S => S(2),
            Cout => s_carry2
        );
    somador3: component SomadorCompleto
        port map (
            A => A(3),
            B => B(3),
            Cin => s_carry2,
            S => S(3),
            Cout => S(4)
        );
end architecture structural;