entity topModule is
end entity topModule;

architecture rtl of topModule is
    
    component Mux4x1 is
        port (
            D : in std_logic_vector(0 to 3);
            S : in std_logic_vector(0 to 1);
            Y : out std_logic
        );
    end component Mux4x1;

    signal D_tb : std_logic_vector(0 to 7) := (others => '1');
    signal S_tb : std_logic_vector(0 to 2) := (others => '0');
    signal Y1_tb : std_logic;
    signal Y2_tb : std_logic;

begin
    
    Mux4x1_1 : component Mux4x1
        port map (
            D => D_tb(0 to 3),
            S => S_tb(0 to 1),
            Y => Y1_tb
        );

    Mux4x1_2 : component Mux4x1
        port map (
            D => D_tb(4 to 7),
            S => S_tb(0 to 1),
            Y => Y2_tb
        );

    Mux4x1_3 : component Mux4x1
        port map (
            D(0) => Y1_tb,
            D(1) => Y2_tb,
            S => S_tb_1,
            Y => open
        );
    
    
end architecture rtl;