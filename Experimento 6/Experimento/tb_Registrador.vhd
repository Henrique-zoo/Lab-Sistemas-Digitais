library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_Registrador4Bits is
end entity;

architecture test of tb_Registrador4Bits is
    -- Sinais de teste
    signal clock:       std_logic := '0';
    signal reset:       std_logic := '0';
    signal load:        std_logic := '0';
    signal data:        std_logic_vector(3 downto 0) := (others => '1');
    signal direction:   std_logic := '0';
    signal left:        std_logic := '0';
    signal right:       std_logic := '0';
    signal Q:           std_logic_vector(3 downto 0);
    
    -- Clock de 20 ns
    constant clock_period : time := 2 ns;

    component Registrador4Bits is
        port (
            clock: in std_logic;
            reset: in std_logic;
            load: in std_logic;
            data: in std_logic_vector(3 downto 0);
            direction: in std_logic;
            left: in std_logic;
            right: in std_logic;
            Q: out std_logic_vector(3 downto 0)
        );
    end component;
begin
    -- Instancia o registrador
    DUT: Registrador4Bits
        port map (
            clock => clock,
            reset => reset,
            load => load,
            data => data,
            direction => direction,
            left => left,
            right => right,
            Q => Q
        );

    -- Clock
    clock_process: process
    begin
        while true loop
            clock <= '0';
            wait for clock_period / 2;
            clock <= '1';
            wait for clock_period / 2;
        end loop;
    end process;

    -- Estímulos
    stim_proc: process
    begin
        -- Reset
        reset <= '1';
        wait for 3 ns;
        reset <= '0';

        -- Carrega D
        load <= '1';
        data <= "1010";
        wait for clock_period*2;
        load <= '0';

        -- Shift Right
        direction <= '1';
        left <= '1'; -- bit entrando à esquerda
        wait for clock_period;

        -- Shift Left
        direction <= '0';
        right <= '0'; -- bit entrando à directioneita
        wait for clock_period;

        wait for 4 ns;
        wait;
    end process;
end architecture;
