----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/02/2025 01:23:42 PM
-- Design Name: 
-- Module Name: bai14_T_FF - Behavioral
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

entity bai_14 is
Port (
        clk    : in  STD_LOGIC;
        Q      : buffer STD_LOGIC_VECTOR(2 downto 0);
        Q_inv  : buffer STD_LOGIC_VECTOR(2 downto 0);
        y      : out STD_LOGIC
    );
end  bai_14;

architecture Behavioral of  bai_14 is
component T_FF
        Port (
            T     : in STD_LOGIC;
            CLK   : in STD_LOGIC;
            Q     : buffer STD_LOGIC;
            Q_inv : buffer STD_LOGIC
        );
    end component;
 
    signal T: STD_LOGIC_VECTOR(2 downto 0);
begin
    T(0) <= Q_inv(0);
    T(1) <= Q(2) or Q(0);
    T(2) <= Q(1);
    FF0: T_FF port map (
        CLK => clk,
        Q => Q(0),
        T => T(0),
        Q_inv => Q_inv(0)
    );
    FF1: T_FF port map (
        CLK => clk,
        Q => Q(1),
        T => T(1),
        Q_inv => Q_inv(1)
    );
    FF2: T_FF port map (
        CLK => clk,
        Q => Q(2),
        T => T(2),
        Q_inv => Q_inv(2)
    );
    y <= '1' when Q = "000" else '0';
end Behavioral;
