library IEEE;
use IEEE.std_logic_1164.all;

entity tb_topModule is
    port (
        A, B, C : out std_logic
    );
end tb_topModule;

architecture main of tb_topModule is

    signal A_tb : std_logic := '0';
    signal B_tb : std_logic := '0';
    signal C_tb : std_logic := '0';

begin

    combinacoes : process
        variable i : integer := 1;
    begin
        if i /= 0 then
            if (i mod 2) = 0 then
                C_tb <= not C_tb;
            end if;
            if (i mod 4) = 0 then
                B_tb <= not B_tb;
            end if;
            if (i mod 8) = 0 then
                A_tb <= not A_tb;
            end if;
        end if;

        i := i + 1;
        wait for 7 ns;
    end process combinacoes;

    C <= C_tb;
    B <= B_tb;
    A <= A_tb;
    
end architecture main;