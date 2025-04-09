library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_SomadorNibble is
end entity tb_SomadorNibble;

architecture testbench of tb_SomadorNibble is
    component SomadorNibble is
        port (
            A, B: in std_logic_vector(3 downto 0);
            S: out std_logic_vector(4 downto 0)
        );
    end component SomadorNibble;
    signal A_tb, B_tb: std_logic_vector(3 downto 0) := (others => '0');
begin
    instancia_somadorNibble: component SomadorNibble
        port map (
            A => A_tb,
            B => B_tb,
            S => open
        );

    estimulos: process
        variable I: std_logic_vector(7 downto 0); 
    begin
        wait for 1 ns;
        I := unsigned(A_tb & B_tb) + 1;
        A_tb <= I(3 downto 0);
        B_tb <= I(7 downto 4);
    end process estimulos;
end architecture testbench;