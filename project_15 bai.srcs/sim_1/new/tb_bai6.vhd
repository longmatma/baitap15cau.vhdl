library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_bai6 is
end tb_bai6;

architecture Behavioral of tb_bai6 is
    signal clk_tb : STD_LOGIC := '0';
    signal Q_tb   : STD_LOGIC_VECTOR(2 downto 0);

    constant clk_period : time := 10 ns;
begin

    uut: entity work.bai_6
        port map (
            CLK => clk_tb,
            Q   => Q_tb
        );

    clk_process : process
    begin
        while now < 300 ns loop
            clk_tb <= '1';
            wait for clk_period / 2;
            clk_tb <= '0';
            wait for clk_period / 2;
        end loop;
        wait;
    end process;

end Behavioral;
