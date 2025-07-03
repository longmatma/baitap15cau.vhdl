library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_bai6JK is
end tb_bai6JK;

architecture test of tb_bai6JK is
    signal clk_tb    : STD_LOGIC := '0';
    signal Q_tb      : STD_LOGIC_VECTOR(2 downto 0);
    signal Q_inv_tb  : STD_LOGIC_VECTOR(2 downto 0);
    signal y_tb      : STD_LOGIC;

    constant clk_period : time := 20 ns;
begin
    -- G?i module c?n test
    uut: entity work.bai6JK
        port map (
            clk    => clk_tb,
            Q      => Q_tb,
            Q_inv  => Q_inv_tb,
            y      => y_tb
        );

    -- T?o xung clock
    clk_process : process
    begin
        while now < 1000 ns loop
            clk_tb <= '0';
            wait for clk_period / 2;
            clk_tb <= '1';
            wait for clk_period / 2;
        end loop;
        wait;
    end process;
end test;
