library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_Registrador4Bits is
    port (
        clock:       in std_logic;
        reset:       out std_logic := '0';
        load:        out std_logic := '1';
        data:        out std_logic_vector(3 downto 0) := "1011";
        direction:   out std_logic := '0';
        left:        out std_logic := '-';
        right:       out std_logic := '-'
    );
end entity tb_Registrador4Bits;

architecture test of tb_Registrador4Bits is
begin
    load_and_reset: process
    begin
        wait for 4 ns;
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        wait for 25 ns;
        load <= '0';
        left <= '0';
        wait for  30 ns;
        direction <= '1';
        right <= '0';
        wait;
    end process;
end architecture;
