----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/01/2025 08:41:01 PM
-- Design Name: 
-- Module Name: tb_bai2 - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_bai2 is
--  Port ( );
end tb_bai2;

architecture Behavioral of tb_bai2 is
component bai2 is
Port (     a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : in STD_LOGIC;
           y : out STD_LOGIC);
 end component;
 signal a:std_logic:='0';
 signal b:std_logic:='0';
 signal c:std_logic:='0';
 signal y:std_logic;

begin
Vote5: bai2 port map (a => a, b => b, c => c, y => y);
test:  process
begin
wait for 10ns;
a<='0'; b<='0'; c<='1'; 
wait for 10ns;
a<='0'; b<='1'; c<='0'; 
wait for 10ns;
a<='0'; b<='1'; c<='1';
wait for 10ns;
a<='1'; b<='0'; c<='0';
wait for 10ns;
a<='1'; b<='0'; c<='1';
wait for 10ns;
a<='1'; b<='1'; c<='0';
wait for 10ns;
a<='1'; b<='1'; c<='1'; 
wait ;
end process;
end Behavioral;
