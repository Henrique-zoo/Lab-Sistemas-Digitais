library IEEE;
use IEEE.std_logic_1164.all;

entity q2_tb_topModule is
    port (
        A, B, C, D, E, F, G : out std_logic
    );
end q2_tb_topModule;

architecture main of q2_tb_topModule is
    signal A_tb, B_tb, C_tb, D_tb, E_tb, F_tb, G_tb : std_logic := '0';
begin

    combinacoes : process
        variable i : integer := 1;
    begin
        if i /= 0 then
            if (i mod 2) = 0 then
                G_tb <= not G_tb;
            end if;
            if (i mod 4) = 0 then
                F_tb <= not F_tb;
            end if;
            if (i mod 8) = 0 then
                E_tb <= not E_tb;
            end if;
            if (i mod 16) = 0 then
                D_tb <= not D_tb;
            end if;
            if (i mod 32) = 0 then
                C_tb <= not C_tb;
            end if;
            if (i mod 64) = 0 then
                B_tb <= not B_tb;
            end if;
            if (i mod 128) = 0 then
                A_tb <= not A_tb;
            end if;
        end if;

        i := i + 1;
        wait for 1 ns;
    end process combinacoes;

    A <= A_tb;
    B <= B_tb;
    C <= C_tb;
    D <= D_tb;
    E <= E_tb;
    F <= F_tb;
    G <= G_tb;
    
end architecture main;