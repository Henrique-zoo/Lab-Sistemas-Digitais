library IEEE;
use IEEE.std_logic_1164.all;

entity FlipFlopJK is
    port (
        preset:     in std_logic;
        clear:      in std_logic;
        clock:      in std_logic;
        J:          in std_logic;
        K:          in std_logic;
        Q:          out std_logic
    );
end entity FlipFlopJK;

architecture behavioral of FlipFlopJK is
    signal Q_in: std_logic;
begin
    process(preset, clear, clock)
    begin
        if preset = '1' then
            Q_in <= '1';
        elsif clear = '1' then
            Q_in <= '0';
        elsif rising_edge(clock) then
            Q_in <= (not J and not K and Q_in) or (J and not K) or (J and K and not Q_in);
        end if;
    end process;

    Q <= Q_in;
end architecture behavioral;