-- Testbench para MaquinaRefrigerante (Máquina de Refrigerante)
-- Cobre os cenários:
-- 1) Inserção de moedas até atingir R$1,00
-- 2) Inserção de moedas ultrapassando para R$1,25
-- 3) Cancelamento (A="11") em cada valor armazenado
-- 4) Inserção de moedas após liberação ou cancelamento

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_MaquinaRefrigerante is
end entity tb_MaquinaRefrigerante;

architecture testbench of tb_MaquinaRefrigerante is
    -- Component under test
    component MaquinaRefrigerante is
        port(
            CLK : in  std_logic;
            A   : in  std_logic_vector(1 downto 0);
            T   : out std_logic_vector(1 downto 0);
            R   : out std_logic
        );
    end component;

    -- Sinais de estímulo
    signal CLK : std_logic := '0';
    signal A   : std_logic_vector(1 downto 0) := "00";
    signal T   : std_logic_vector(1 downto 0);
    signal R   : std_logic;

    constant CLK_PERIOD : time := 20 ns;
begin
    -- Geração de clock
    clk_proc: process
    begin
        CLK <= '0'; wait for CLK_PERIOD/2;
        CLK <= '1'; wait for CLK_PERIOD/2;
    end process clk_proc;

    -- Instancia DUT
    DUT: MaquinaRefrigerante
        port map(
            CLK => CLK,
            A   => A,
            T   => T,
            R   => R
        );

    -- Processo de estímulo
    stim_proc: process
    begin
        wait for CLK_PERIOD;
        report "01) Inserção até R$1,00";
        -- 0.25 + 0.25 + 0.50 = 1.00
        A <= "01"; wait for CLK_PERIOD;
        A <= "01"; wait for CLK_PERIOD;
        A <= "10"; wait for CLK_PERIOD;
        A <= "00"; wait for CLK_PERIOD * 2;

        report "02) Inserção ultrapassando para R$1,25";
        -- 0.50 + 0.50 = libera, depois +0.25 gera troco
        A <= "10"; wait for CLK_PERIOD;
        A <= "10"; wait for CLK_PERIOD;
        A <= "01"; wait for CLK_PERIOD;
        A <= "00"; wait for CLK_PERIOD * 2;

        report "03) Cancelamento em cada valor armazenado";
        -- Cancelar em S1 (0.25)
        A <= "01"; wait for CLK_PERIOD;
        A <= "11"; wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        -- Cancelar em S2 (0.50)
        A <= "10"; wait for CLK_PERIOD;
        A <= "11"; wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        -- Cancelar em S3 (0.75): 25+50
        A <= "01"; wait for CLK_PERIOD;
        A <= "10"; wait for CLK_PERIOD;
        A <= "11"; wait for CLK_PERIOD;
        wait for CLK_PERIOD;

        report "04) Inserção após liberação ou cancelamento";
        -- Após troco (exemplo: máquina idle volta S0)
        A <= "01"; wait for CLK_PERIOD;
        A <= "01"; wait for CLK_PERIOD;
        A <= "10"; wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        -- Novo ciclo completo até liberação
        A <= "10"; wait for CLK_PERIOD;
        A <= "10"; wait for CLK_PERIOD;
        A <= "10"; wait for CLK_PERIOD;
        wait for CLK_PERIOD * 2;

        report "Fim da simulação";
        wait;
    end process stim_proc;
end architecture testbench;
