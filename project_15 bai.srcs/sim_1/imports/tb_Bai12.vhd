----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/01/2025 10:29:55 PM
-- Design Name: 
-- Module Name: tb_Bai_12 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_Bai_12 is
--  Port ( );
end tb_Bai_12;

architecture Behavioral of tb_Bai_12 is
component Bai_12 is
Port(clk : in std_logic;
         y: out std_logic_vector(3 downto 0 );
         Q : buffer std_logic_vector(3 downto 0);
          Q_inv : buffer std_logic_vector(3 downto 0));
          end component;
 signal clk : std_logic := '0';
  signal y : std_logic_vector(3 downto 0);
begin
uut : Bai_12 port map( clk => clk,y => y);
clk_process:process
begin
while now < 640 ns loop
      clk <= '0';
      wait for 10 ns;
      clk <= '1';
      wait for 10 ns;
    end loop;
    wait;
  end process;

end Behavioral;
