library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bai_4 is
  port (
    CLK : in  std_logic;
    RST : in  std_logic;
    Q   : out std_logic_vector(2 downto 0)
  );
end bai_4;

architecture rtl of bai_4 is
  component T_FF
    port (
      T     : in  std_logic;
      CLK   : in  std_logic;
      RST   : in  std_logic;
      Q     : out std_logic;
      Q_inv : out std_logic
    );
  end component;

  signal q0, q1, q2 : std_logic;
  signal t0, t1, t2     : std_logic;
begin
t0 <= not q2 or not q1 or q0;
  t1 <= q0 or ( q1 and q2);
  t2 <= (q1 and q0)or (q2 and q1);

  ff0 : T_FF port map (T => t0, CLK => CLK, RST => RST, Q => q0, Q_inv => open);
  ff1 : T_FF port map (T => t1,  CLK => CLK, RST => RST, Q => q1, Q_inv => open);
  ff2 : T_FF port map (T => t2,  CLK => CLK, RST => RST, Q => q2, Q_inv => open);

  Q <= q2 & q1 & q0;
end rtl;
