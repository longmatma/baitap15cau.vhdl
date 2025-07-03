library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bai_6 is
    Port (
        clk    : in  STD_LOGIC;
        Q      : buffer STD_LOGIC_VECTOR(2 downto 0);
        Q_inv  : buffer STD_LOGIC_VECTOR(2 downto 0);
        y      : out STD_LOGIC
    );
end  bai_6;

architecture Behavioral of JK_FF is
    component JK_FF
        Port (
            J     : in STD_LOGIC;
            K     : in STD_LOGIC;
            CLK   : in STD_LOGIC;
            Q     : buffer STD_LOGIC;
            Q_inv : buffer STD_LOGIC
        );
    end component;

    signal J, K: STD_LOGIC_VECTOR(2 downto 0);
begin
    
    J(0) <= Q(2) or Q(1);
    K(0) <= '1';

    J(1) <= Q_inv(0);
    K(1) <= Q_inv(0);

    J(2) <= Q_inv(0) and Q_inv(1);
    K(2) <= Q_inv(0) and Q_inv(1);

    FF0: JK_FF port map (
        CLK   => clk,
        Q     => Q(0),
        J     => J(0),
        K     => K(0),
        Q_inv => Q_inv(0)
    );

    FF1: JK_FF port map (
        CLK   => clk,
        Q     => Q(1),
        J     => J(1),
        K     => K(1),
        Q_inv => Q_inv(1)
    );

    FF2: JK_FF port map (
        CLK   => clk,
        Q     => Q(2),
        J     => J(2),
        K     => K(2),
        Q_inv => Q_inv(2)
    );
    y <= '1' when Q = "000" else '0';

end Behavioral;
