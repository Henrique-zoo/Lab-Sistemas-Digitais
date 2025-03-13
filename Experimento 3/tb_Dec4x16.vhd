library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_Dec4x16 is
end entity tb_Dec4x16;

architecture rtl of tb_Dec4x16 is
    
    component Dec4x16 is
        port (
            A : in std_logic_vector(3 downto 0);
            Y : out std_logic_vector(15 downto 0)
        );
    end component Dec4x16;

    signal A_tb : std_logic_vector(3 downto 0);

begin

    instancia_Dec4x16 : component Dec4x16
        port map (
            A => A_tb,
            Y => open
        );

    estimulos : process is
        variable Uns_A : unsigned(3 downto 0);
    begin

        if (A_tb(0) = 'U') then
            A_tb <= (others => '0');
        else
            Uns_A := unsigned(A_tb);
            A_tb <= std_logic_vector(Uns_A + 1);
        end if;

        wait for 6.25 ns;

    end process;
    
end architecture rtl;