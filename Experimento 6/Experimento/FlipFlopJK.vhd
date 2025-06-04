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
    signal Q_internal: std_logic;
begin
    process(preset, clear, clock)
    begin
        if preset = '1' then
            Q_internal <= '1';
        elsif clear = '1' then
            Q_internal <= '0';
        elsif rising_edge(clock) then
            Q_internal <= (not J and not K and Q_internal) or (J and not K) or (J and K and not Q_internal);
        end if;
    end process;

    Q <= Q_internal;
end architecture behavioral;