library IEEE;
use IEEE.std_logic_1164.all;

entity Registrador4Bits is
    port (
        clock:    in std_logic;
        reset:    in std_logic;
        load:   in std_logic;
        data:      in std_logic_vector(3 downto 0);
        direction:    in std_logic;
        left:      in std_logic;
        right:      in std_logic;
        Q:      out std_logic_vector(3 downto 0)
    );
end entity Registrador4Bits;

architecture structural of Registrador4Bits is
    component FlipFlopJK is
        port (
            preset:     in std_logic;
            clear:      in std_logic;
            clock:      in std_logic;
            J:          in std_logic;
            K:          in std_logic;
            Q:          out std_logic
        );
    end component FlipFlopJK;

    component Mux4x1 is
        port (
            D: in std_logic_vector(3 downto 0);
            S: in std_logic_vector(1 downto 0);
            Y: out std_logic
        );
    end component Mux4x1;

    signal OP: std_logic_vector(1 downto 0) := (others => '0');
    signal FF_output: std_logic_vector(3 downto 0);
    signal mux_input: std_logic_vector(15 downto 0);
    signal mux_output: std_logic_vector(3 downto 0);
    signal J_signals, K_signals: std_logic_vector(3 downto 0);

begin
    OP_ctrl: process(load, direction)
    begin
        if load = '1' then
            OP <= "11"; -- Load
        elsif direction = '1' then
            OP <= "01"; -- Shift Right
        elsif direction = '0' then
            OP <= "10"; -- Shift Left
        else
            OP <= "00";
        end if;
    end process;

    mux_input <=
        data(3) & FF_output(2) & right & FF_output(3) -- Mux4
        & data(2) & FF_output(1) & FF_output(3) & FF_output(2)-- Mux3
        & data(1) & FF_output(0) & FF_output(2) & FF_output(1)-- Mux2
        & data(0) & left & FF_output(1) & FF_output(0); -- Mux1

    Mux1: Mux4x1 port map (D => mux_input(3 downto 0), S => OP, Y => mux_output(0));
    Mux2: Mux4x1 port map (D => mux_input(7 downto 4), S => OP, Y => mux_output(1));
    Mux3: Mux4x1 port map (D => mux_input(11 downto 8), S => OP, Y => mux_output(2));
    Mux4: Mux4x1 port map (D => mux_input(15 downto 12), S => OP, Y => mux_output(3));

    J_signals <= mux_output;
    K_signals <= not mux_output;

    FF_JK_1: component FlipFlopJK
        port map (
            preset => '0',
            clear => reset,
            clock => clock,
            J => J_signals(0),
            K => K_signals(0),
            Q => FF_output(0)
        );

    FF_JK_2: component FlipFlopJK
        port map (
            preset => '0',
            clear => reset,
            clock => clock,
            J => J_signals(1),
            K => K_signals(1),
            Q => FF_output(1)
        );

    FF_JK_3: component FlipFlopJK
        port map (
            preset => '0',
            clear => reset,
            clock => clock,
            J => J_signals(2),
            K => K_signals(2),
            Q => FF_output(2)
        );

    FF_JK_4: component FlipFlopJK
        port map (
            preset => '0',
            clear => reset,
            clock => clock,
            J => J_signals(3),
            K => K_signals(3),
            Q => FF_output(3)
        );

    Q <= FF_output;
end architecture structural;