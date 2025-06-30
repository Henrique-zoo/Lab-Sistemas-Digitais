entity MaquinaRefrigerante is
    port (
        CLK:    in  std_logic;
        A:      in  std_logic_vector(1 downto 0);
        T:      out std_logic_vector(1 downto 0);
        R:      out std_logic;
    );
end entity MaquinaRefrigerante;

architecture structural of MaquinaRefrigerante is
    component Registrador4Bits
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

    component LogicaProxEstado
        port (
            estado_atual: in  std_logic_vector (3 downto 0);
            A: in  std_logic_vector (1 downto 0);
            proximo_estado: out std_logic_vector (3 downto 0)
        );
    end component;

    component LogicaSaidas is
        port (
            estado: in  std_logic_vector(3 downto 0);
            T:      out std_logic_vector(1 downto 0);
            R:      out std_logic
        );
    end component;

    signal estado_atual, proximo_estado: std_logic_vector(3 downto 0);
    signal reset, load, data, direction, left, right: std_logic;
begin
    
    registrador: Registrador4Bits is
        port map (
            clock       => CLK,
            reset       => reset,
            load        => load,
            data        => data,
            direction   => direction,
            left        => left,
            right       => right,
            Q           => proximo_estado
        );

    proximo_estado: LogicaProxEstado is
        port map (
            estado_atual    => estado_atual,
            A               => A,
            reset           => reset,
            load            => load,
            data            => data,
            direction       => direction,
            left            => left,
            right           => right
        );

    logica_saidas: LogicaSaidas is
        port map (
            estado      => estado_atual,
            T           => T,
            R           => R
        );
end architecture structural;