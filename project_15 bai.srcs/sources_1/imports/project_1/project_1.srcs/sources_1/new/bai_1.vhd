library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Bai_1 is
    Port ( A : in std_logic;
           B : in std_logic;
           C : in std_logic;
           F : out std_logic);
end Bai_1;

architecture Behavioral of Bai_1 is
begin
    F <= (not( not A and not(not B and not C)) and not (B and C));
end Behavioral;
