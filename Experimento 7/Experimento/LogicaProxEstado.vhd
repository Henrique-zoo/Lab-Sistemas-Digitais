library IEEE;
use IEEE.std_logic_1164.all;

entity LogicaProxEstado is
    port (
        estado_atual:   in  std_logic_vector(3 downto 0);
        A:              in  std_logic_vector(1 downto 0);
        load:           out std_logic;
        data:           out std_logic_vector(3 downto 0);
        direction:      out std_logic;
        left:           out std_logic;
        right:          out std_logic
    );
end entity LogicaProxEstado;

architecture behavioral of LogicaProxEstado is
begin
    process(estado_atual, A)
    begin
        case estado_atual is
            when "0000" =>  -- S0
                case A is
                    when "01" =>
                        load <= '0';
                        left <= '1';
                        direction <= '0';   -- S1 (0001)
                    when "10" =>
                        load <= '1';
                        data <= "0010";     -- S2
                    when others =>
                        load <= '1';
                        data <= "0000";     -- S0
                end case;
            when "0001" =>  -- S1
                case A is
                    when "01" =>
                        load <= '0';
                        direction <= '0';
                        left <= '0';        -- S2 (0010)
                    when "10" =>
                        load <= '0';
                        direction <= '0';
                        left <= '1';        -- S3
                    when "11" =>
                        load <= '1';
                        data <= "0100";     -- S6
                    when others =>
                        load <= '1';
                        data <= "0001";     -- S1
                end case;
            when "0010" =>  -- S2
                case A is
                    when "01" =>
                        load <= '1';
                        data <= "0011";      -- S3
                    when "10" =>
                        load <= '1';
                        data <= "0111";      -- S4
                    when "11" =>
                        load <= '0';
                        direction <= '0';
                        left <= '1';        -- S7 (0101)
                    when others =>
                        load <= '1';
                        data <= "0010";    -- S2
                end case;
            when "0011" =>  -- S3
                case A is
                    when "01" =>
                        load <= '0';
                        direction <= '0';
                        left <= '1';    -- S4 (0111)
                    when "10" =>
                        load <= '1';
                        data <= "1000"; -- S5
                    when "11" =>
                        load <= '0';
                        direction <= '0';
                        left <= '0'; -- S8 (0110)
                    when others =>
                        load <= '1';
                        data <= "0011"; -- S3
                end case;
            when others =>  -- S4, S5, S6, S7, S8
                case A is
                    when "01" =>
                        load <= '1';
                        data <= "0001";      -- S1
                    when "10" =>
                        load <= '1';
                        data <= "0010";      -- S2
                    when others =>
                        load <= '1';
                        data <= "0000";      -- S0
                end case;
        end case;
    end process;
end architecture behavioral;
