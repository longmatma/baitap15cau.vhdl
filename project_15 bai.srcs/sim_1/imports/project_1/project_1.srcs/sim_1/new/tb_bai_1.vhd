library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_Bai_1 is
end tb_Bai_1;

architecture Behavioral of tb_Bai_1 is

    component Bai_1
        Port (
            A : in std_logic;
            B : in std_logic;
            C : in std_logic;
            F : out std_logic
        );
    end component;

   
    signal A_tb, B_tb, C_tb : std_logic := '0';
    signal F_tb : std_logic;

begin

   
    uut: Bai_1 port map (
        A => A_tb,
        B => B_tb,
        C => C_tb,
        F => F_tb
    );

    
    stim_proc: process
    begin
       
        A_tb <= '0'; B_tb <= '0'; C_tb <= '0'; wait for 10 ns;
        A_tb <= '0'; B_tb <= '0'; C_tb <= '1'; wait for 10 ns;
        A_tb <= '0'; B_tb <= '1'; C_tb <= '0'; wait for 10 ns;
        A_tb <= '0'; B_tb <= '1'; C_tb <= '1'; wait for 10 ns;
        A_tb <= '1'; B_tb <= '0'; C_tb <= '0'; wait for 10 ns;
        A_tb <= '1'; B_tb <= '0'; C_tb <= '1'; wait for 10 ns;
        A_tb <= '1'; B_tb <= '1'; C_tb <= '0'; wait for 10 ns;
        A_tb <= '1'; B_tb <= '1'; C_tb <= '1'; wait for 10 ns;

        wait;
    end process;

end Behavioral;
