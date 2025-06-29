library IEEE;
use IEEE.std_logic_1164.all;

entity TopModule is
end entity;

architecture structural of TopModule is
    component Registrador4Bits is
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
    end component;

    component tb_Registrador4Bits is
        port (
            clock:       in std_logic;
            reset:       out std_logic;
            load:        out std_logic;
            data:        out std_logic_vector(3 downto 0);
            direction:   out std_logic;
            left:        out std_logic;
            right:       out std_logic
        );
    end component;

    signal clock_top:     std_logic := '0';
    signal reset_top:     std_logic;
    signal load_top:      std_logic;
    signal data_top:      std_logic_vector(3 downto 0);
    signal direction_top: std_logic;
    signal left_top:      std_logic;
    signal right_top:     std_logic;
    -- Clock de 20 ns
    constant clock_period: time := 20 ns;
begin
    -- Instancia o registrador
    DUT: Registrador4Bits
        port map (
            clock => clock_top,
            reset => reset_top,
            load => load_top,
            data => data_top,
            direction => direction_top,
            left => left_top,
            right => right_top,
            Q => open
        );
    TB: tb_Registrador4Bits
        port map (
            clock => clock_top,
            reset => reset_top,
            load => load_top,
            data => data_top,
            direction => direction_top,
            left => left_top,
            right => right_top
        );

    clock_process: process
    begin
        wait for 0.1 ns;
        while true loop
            clock_top <= not clock_top;
            wait for clock_period / 2;
        end loop;
    end process;
end architecture;
