library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bai_3 is
end bai_3;

architecture test of bai_3 is

    -- Khai báo component c?n test
    component bai_3
        Port (
            CLK : in  STD_LOGIC;
            Q   : out STD_LOGIC_VECTOR(2 downto 0)
        );
    end component;

    -- Tín hi?u mô ph?ng
    signal CLK_tb : STD_LOGIC := '0';
    signal Q_tb   : STD_LOGIC_VECTOR(2 downto 0);
    constant clk_period : time := 20 ns;

begin

    -- Gán component vào testbench
    uut: bai_3
        port map (
            CLK => CLK_tb,
            Q   => Q_tb
        );

    -- T?o xung clock 20ns
    clk_process : process
    begin
        while now < 1000 ns loop
            CLK_tb <= '0';
            wait for clk_period / 2;
            CLK_tb <= '1';
            wait for clk_period / 2;
        end loop;
        wait;
    end process;

end test;
