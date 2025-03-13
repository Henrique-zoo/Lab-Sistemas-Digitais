library IEEE;
use IEEE.std_logic_1164.all;

entity tb_topModule is
    port (
        A, B, Cin : out std_logic
    );
end tb_topModule;

architecture main of tb_topModule is

    signal A_tb : std_logic := '0';
    signal B_tb : std_logic := '0';
    signal Cin_tb : std_logic := '0';

begin

    combinacoes : process
        variable i : integer := 1;
    begin
        if (i mod 2) = 0 then
            A_tb <= not A_tb;
        end if;
        if (i mod 4) = 0 then
            B_tb <= not B_tb;
        end if;
        if (i mod 8) = 0 then
            Cin_tb <= not Cin_tb;
        end if;

        i := i + 1;
        wait for 5 ns;
    end process combinacoes;

    A <= A_tb;
    B <= B_tb;
    Cin <= Cin_tb;
    
end architecture main;