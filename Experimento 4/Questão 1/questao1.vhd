library IEEE;
use IEEE.std_logic_1164.all;

entity questao1 is
    port (
        A, B, C : in std_logic;
        X, Y : out std_logic
    );
end entity questao1;

architecture main of questao1 is
    
    component Mux4x1 is
        port (
            D : in std_logic_vector(0 to 3);
            S : in std_logic_vector(0 to 1);
            Y : out std_logic
        );
    end component Mux4x1;

    signal D_tb : std_logic_vector(0 to 3);
    signal S_tb : std_logic_vector(0 to 1);
    signal Y_tb : std_logic;
    signal D2_tb : std_logic_vector(0 to 3);
    signal S2_tb : std_logic_vector(0 to 1);
    signal Y2_tb : std_logic;

begin
    
    instancia1_Mux4x1 : component Mux4x1
        port map (
            D => D_tb,
            S => S_tb,
            Y => Y_tb
        );
    
    instancia2_Mux4x1 : component Mux4x1
        port map (
            D => D2_tb,
            S => S2_tb,
            Y => Y2_tb
        );
    
    S_tb <= A & B;
    D_tb <= '0' & C & (not C) & '1';
    
    S2_tb <= A & B;
    D2_tb <= '1' & (not C) & '0' & C;
    
    X <= Y_tb;
    Y <= Y2_tb;

end architecture main;