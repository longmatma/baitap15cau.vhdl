----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/02/2025 01:54:43 PM
-- Design Name: 
-- Module Name: bai10_JK_FF - Behavioral
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

entity bai_10 is
Port (
        clk    : in  STD_LOGIC;
        Q      : buffer STD_LOGIC_VECTOR(2 downto 0);
        Q_inv  : buffer STD_LOGIC_VECTOR(2 downto 0);
        y      : out STD_LOGIC
    );
end bai_10;

architecture Behavioral of bai_10 is
component JK_FF
        Port (
            J, K  : in STD_LOGIC;
            CLK   : in STD_LOGIC;
            Q     : buffer STD_LOGIC;
            Q_inv : buffer STD_LOGIC
        );
    end component;
 
    signal J, K: STD_LOGIC_VECTOR(2 downto 0);
begin
     J(0) <= '1';
     K(0) <= Q(2) xor Q(1);
     J(1) <= (Q(2) and Q_inv(1)) or (Q_inv(2) and Q(0));
     K(1) <= '1';
     J(2) <= Q(1);
     K(2) <= Q(0);
     

     FF0: JK_FF port map (
        CLK => clk,
        Q => Q(0),
        J => J(0),
        K => K(0),
        Q_inv => Q_inv(0)
    );
    FF1: JK_FF port map (
        CLK => clk,
        Q => Q(1),
        J => J(1),
        K => K(1),
        Q_inv => Q_inv(1)
    );
    FF2: JK_FF port map (
        CLK => clk,
        Q => Q(2),
        J => J(2),
        K => K(2),
        Q_inv => Q_inv(2)
    );
   y <= '1' when Q = "000" else '0';
end Behavioral;
