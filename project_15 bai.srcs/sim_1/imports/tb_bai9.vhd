library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_bai_9 is
end tb_bai_9;

architecture Behavioral of tb_bai_9 is

    
    component bai_9
        Port (
            CLK : in  STD_LOGIC;
            Q   :  buffer STD_LOGIC_VECTOR(2 downto 0)
        );
    end component;

    signal clk_tb: STD_LOGIC := '0';
    signal Q_tb  : STD_LOGIC_VECTOR(2 downto 0);

    constant clk_period: time := 10 ns;

begin

    
    uut: bai_9
        port map (
            CLK => clk_tb,
            Q   => Q_tb
        );

   
    clk_process: process
    begin 
        while true loop 
            clk_tb <= '0';
            wait for clk_period / 2;
            clk_tb <= '1';
            wait for clk_period / 2;
        end loop;
    end process;

    
    stim_proc: process
    begin 
        wait for clk_period;
        for i in 0 to 9 loop
            wait for clk_period;
        end loop;
        wait;
    end process;

end Behavioral;
