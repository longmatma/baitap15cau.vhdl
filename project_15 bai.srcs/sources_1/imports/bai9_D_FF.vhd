----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/01/2025 11:39:29 PM
-- Design Name: 
-- Module Name: bai9_D_FF - Behavioral
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

entity bai_9 is
Port (
        clk    : in  STD_LOGIC;
        Q      : buffer STD_LOGIC_VECTOR(2 downto 0);
        Q_inv  : buffer STD_LOGIC_VECTOR(2 downto 0);
        y      : out STD_LOGIC
    );
end bai_9;

architecture Behavioral of bai_9 is
component D_FF
        Port (
            D     : in STD_LOGIC;
            CLK   : in STD_LOGIC;
            Q     : buffer STD_LOGIC;
            Q_inv : buffer STD_LOGIC
        );
    end component;
 
    signal D: STD_LOGIC_VECTOR(2 downto 0);
begin
   D(0) <= Q(1);
   D(1) <= Q_inv(1) or (Q_inv(2) and Q_inv(0));
   D(2) <= (Q(1) and Q(0)) or (Q(2) and Q(0));
   FF0: D_FF port map (
        CLK => clk,
        Q => Q(0),
        D => D(0),
        Q_inv => Q_inv(0)
    );
    FF1: D_FF port map (
        CLK => clk,
        Q => Q(1),
        D => D(1),
        Q_inv => Q_inv(1)
    );
    FF2: D_FF port map (
        CLK => clk,
        Q => Q(2),
        D => D(2),
        Q_inv => Q_inv(2)
    );
    
     y <= '1' when Q = "000" else '0';
end Behavioral;
