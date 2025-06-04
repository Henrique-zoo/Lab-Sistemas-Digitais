library IEEE;
use IEEE.std_logic_1164.all;

entity questao2 is
    port (
        A, B, C, D, E, F, G: in std_logic;
        S: out std_logic
    );
end entity questao2;

architecture structural of questao2 is
    component Dec4x16 is
        port (
            A: in std_logic_vector(3 downto 0);
            Y: out std_logic_vector(15 downto 0)
        );
    end component Dec4x16;

    component Mux8x1 is
        port (
            D: in std_logic_vector(7 downto 0);
            S: in std_logic_vector(2 downto 0);
            Y: out std_logic
        );
    end component Mux8x1;

    signal decoder_input   : std_logic_vector(3 downto 0);
    signal decoder_output  : std_logic_vector(15 downto 0);
    signal mux_data_input  : std_logic_vector(7 downto 0);
    signal mux_select      : std_logic_vector(2 downto 0);
    signal mux_output      : std_logic;
    
begin
    instancia_Dec4x16: component Dec4x16
        port map (
            A => decoder_input,
            Y => decoder_output
        );
        
    instancia_Mux8x1: component Mux8x1
        port map (
            D => mux_data_input,
            S => mux_select,
            Y => mux_output
        );
    
    decoder_input <= A & B & C & D;

    mux_data_input <= 
    '1' & (decoder_output(10) or
    decoder_output(11)) & '0' & (decoder_output(9) or
    decoder_output(15)) & '1' & decoder_output(7) & (decoder_output(0) or
    decoder_output(15)) & '0';

    mux_select <= E & F & G;
    S <= mux_output;
end architecture structural;