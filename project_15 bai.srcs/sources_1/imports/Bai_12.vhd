----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/01/2025 10:20:34 PM
-- Design Name: 
-- Module Name: Bai_12 - Behavioral
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

entity Bai_12 is
  Port (
         clk : in std_logic;
         y: out std_logic_vector(3 downto 0 );
         Q : buffer std_logic_vector(3 downto 0);
          Q_inv : buffer std_logic_vector(3 downto 0));
end Bai_12;

architecture Behavioral of Bai_12 is
signal D : std_logic_vector(3 downto 0);
component D_FF is
Port (
          D : in std_logic;
          CLK : in std_logic;
          Q : Buffer std_logic;
          Q_inv : Buffer std_logic );
          end component;
begin
D(0)<=Q(0) or ( Q_inv(3) and Q_inv(2) and Q_inv(1));
D(1)<=Q_inv(1) and Q(0);
D(2)<=(Q(2) and Q_inv(1) and Q(0)) or (Q_inv(2) and Q(1) and Q(0));
D(3)<= (Q(3) and Q_inv(1) and Q(0)) or (Q(3) and Q_inv(2) and Q(0)) or (Q_inv(3) and Q(2) and Q(1) and Q(0));
FF0: D_FF port map( D=> D(0), CLK=>clk, Q=>Q(0),Q_inv=>Q_inv(0));
FF1: D_FF port map( D=> D(1), CLK=>clk, Q=>Q(1),Q_inv=>Q_inv(1));
FF2: D_FF port map( D=> D(2), CLK=>clk, Q=>Q(2),Q_inv=>Q_inv(2));
FF3: D_FF port map( D=> D(3), CLK=>clk, Q=>Q(3),Q_inv=>Q_inv(3));
y<=Q;
end Behavioral;
