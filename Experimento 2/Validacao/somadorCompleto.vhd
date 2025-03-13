library IEEE;
use IEEE.std_logic_1164.all;

entity somadorCompleto is
    port (
        A, B, Cin : in std_logic;
        S, Cout : out std_logic
    );
end somadorCompleto;

architecture main of somadorCompleto is
begin

    S <= A xor B xor Cin;
    Cout <= (A and B) or (A and Cin) or (B and Cin);

end architecture main;