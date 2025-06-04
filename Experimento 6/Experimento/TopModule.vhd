library IEEE;
use IEEE.std_logic_1164.all;

entity TopModule is
end entity;

architecture structural of TopModule is
    component tb_Registrador4Bits is
    end component;
begin
    TB: tb_Registrador4Bits;
end architecture;
