library IEEE;
use IEEE.std_logic_1164.all;

entity questao2 is
    port (
        A, B, C, D, E, F, G : in std_logic;
        S : out std_logic
    );
end entity questao2;

architecture rtl of questao2 is
    
    component Dec4x16 is
        port (
            A : in std_logic_vector(3 downto 0);
            Y : out std_logic_vector(15 downto 0)
        );
    end component Dec4x16;

    component Mux8x1 is
        port (
            D : in std_logic_vector(7 downto 0);
            S : in std_logic_vector(2 downto 0);
            Y : out std_logic
        );
    end component Mux8x1;

    signal A_tb : std_logic_vector(3 downto 0);
    signal Y_tb : std_logic_vector(15 downto 0);
    signal D_tb : std_logic_vector(7 downto 0);
    signal S_tb : std_logic_vector(2 downto 0);
    signal Y2_tb : std_logic;

begin

    instancia_Dec4x16 : component Dec4x16
        port map (
            A => A_tb,
            Y => Y_tb
        );

    instancia_Mux8x1 : component Mux8x1
        port map (
            D => D_tb,
            S => S_tb,
            Y => Y2_tb
        );
    -- As variáveis booleanas A, B, C e D são as entradas do decodificador
    A_Tb <= A & B & C & D;
    -- Os mintermos de A, B, C e D, formados pelo decodificador, são as entradas de dados do multiplexador
    D_tb <= '1' & (Y_tb(10) or Y_tb(11)) & '0' & (Y_tb(9) or Y_tb(15)) & '1' & Y_tb(7) & (Y_tb(0) or Y_tb(15)) & '0';
    -- As entradas seletoras do multiplexador são as variáveis booleanas E, F e G
    S_tb <= E & F & G;

    S <= Y2_tb;

end architecture rtl;