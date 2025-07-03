library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bai_3 is
    Port (
        CLK : in  STD_LOGIC;
        Q   : out STD_LOGIC_VECTOR(2 downto 0)
    );
end bai_3;

architecture rtl of bai_3 is

    component JK_FF
        Port (
            J     : in  STD_LOGIC;
            K     : in  STD_LOGIC;
            CLK   : in  STD_LOGIC;
            Q     : out STD_LOGIC;
            Q_inv : out STD_LOGIC
        );
    end component;

    signal q0_sig, q1_sig, q2_sig : STD_LOGIC;
    signal j1_sig, k1_sig         : STD_LOGIC;
    signal j2_sig, k2_sig         : STD_LOGIC;

begin
    
    j1_sig <= not q2_sig and q0_sig;
    k1_sig <= q0_sig;

    j2_sig <= not q2_sig and q1_sig and q0_sig;
    k2_sig <= not q1_sig and q0_sig;

    
    FF0 : JK_FF
        port map (
            J     => '1',
            K     => '1',
            CLK   => CLK,
            Q     => q0_sig,
            Q_inv => open
        );

    FF1 : JK_FF
        port map (
            J     => j1_sig,
            K     => k1_sig,
            CLK   => CLK,
            Q     => q1_sig,
            Q_inv => open
        );

    FF2 : JK_FF
        port map (
            J     => j2_sig,
            K     => k2_sig,
            CLK   => CLK,
            Q     => q2_sig,
            Q_inv => open
        );

    Q <= q2_sig & q1_sig & q0_sig;

end rtl;
