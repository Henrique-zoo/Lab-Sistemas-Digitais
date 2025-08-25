library IEEE;
use IEEE.std_logic_1164.all;

entity MaquinaRefrigerante is
    port (
        CLK:    in  std_logic;
        A:      in  std_logic_vector(1 downto 0);
        T:      out std_logic_vector(1 downto 0);
        R:      out std_logic
    );
end entity MaquinaRefrigerante;

architecture structural of MaquinaRefrigerante is
    component Registrador4Bits is
        port (
            clock:      in std_logic;
            reset:      in std_logic;
            load:       in std_logic;
            data:       in std_logic_vector(3 downto 0);
            direction:  in std_logic;
            left:       in std_logic;
            right:      in std_logic;
            Q:          out std_logic_vector(3 downto 0)
        );
    end component;

    component LogicaProxEstado is
        port (
            estado_atual:   in  std_logic_vector(3 downto 0);
            A:              in  std_logic_vector(1 downto 0);
            load:           out std_logic;
            data:           out std_logic_vector(3 downto 0);
            direction:      out std_logic;
            left:           out std_logic;
            right:          out std_logic
        );
    end component LogicaProxEstado;

    component LogicaSaidas is
        port (
            estado: in  std_logic_vector(3 downto 0);
            T:      out std_logic_vector(1 downto 0);
            R:      out std_logic
        );
    end component;

    signal estado_atual: std_logic_vector(3 downto 0) := (others => '0');
    signal data: std_logic_vector(3 downto 0);
    signal reset: std_logic := '1';
    signal load, direction, left, right: std_logic;
begin
    registrador: Registrador4Bits
        port map (
            clock       => CLK,
            reset       => reset,
            load        => load,
            data        => data,
            direction   => direction,
            left        => left,
            right       => right,
            Q           => estado_atual
        );

    proximo_estado: LogicaProxEstado
        port map (
            estado_atual    => estado_atual,
            A               => A,
            load            => load,
            data            => data,
            direction       => direction,
            left            => left,
            right           => right
        );

    logica_saidas: LogicaSaidas
        port map (
            estado      => estado_atual,
            T           => T,
            R           => R
        );

    process
    begin
        wait for 1 ns;
        reset <= '0';
        wait;
    end process;
end architecture structural;