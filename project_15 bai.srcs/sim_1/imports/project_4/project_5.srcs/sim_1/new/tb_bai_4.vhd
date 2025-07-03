library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_bai4 is
end tb_bai4;

architecture tb of tb_bai4 is
  component bai_4
    port (
      CLK : in  std_logic;
      RST : in  std_logic;
      Q   : out std_logic_vector(2 downto 0)
    );
  end component;

  signal CLK_tb : std_logic := '0';
  signal RST_tb : std_logic := '0';  
  signal Q_tb   : std_logic_vector(2 downto 0);

  constant clk_period : time := 20 ns;
begin

  uut : bai_4
    port map (
      CLK => CLK_tb,
      RST => RST_tb,
      Q   => Q_tb
    );

  
  clk_gen : process
  begin
    wait for 5 ns;
    loop
      CLK_tb <= '1';
      wait for clk_period / 2;
      CLK_tb <= '0';
      wait for clk_period / 2;
    end loop;
  end process;

end tb;
