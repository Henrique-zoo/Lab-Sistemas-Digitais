library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity SomadorNibbleArith is
    port (
        A, B: in std_logic_vector(3 downto 0);
        S: out std_logic_vector(4 downto 0)
    );
end entity SomadorNibbleArith;

architecture behavioral of SomadorNibbleArith is
begin
    S <= ('0' & unsigned(A)) + ('0' & unsigned(B));
end architecture behavioral;