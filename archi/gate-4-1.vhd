entity rs_flip_flop is
  port (
    clk : in bit;
    reset, set : in bit;
    q, qbar : out bit
  );  
end entity;

architecture rtl of rs_flip_flop is
  signal s1, s2 : bit;
begin
  q <= (reset and clk) nor qbar;
  qbar <= (set and clk) nor q;
end architecture;

-- -------

entity gate_4_1 is
  port (
    clk : in bit;
    q, qbar : in bit
  );  
end entity;

architecture rtl of gate_4_1 is
  signal q0, q0bar : bit;
  signal q1, q1bar : bit;
begin
  rsff_1: entity work.rs_flip_flop(rtl)
    port map(clk => clk, reset => q0, set => q0bar, q => q0, qbar => q0bar);
  rsff_2: entity work.rs_flip_flop(rtl)
    port map(clk => clk, reset => (q0bar and q1), set => (q0bar and q1bar), q => q1, qbar => q1bar);
end architecture;

entity gate_4_1_tb is
end entity;

architecture behavior of gate_4_1_tb is
  signal clk : bit;
  signal q, qbar : bit;
begin
  rsff_1: entity work.gate_4_1(rtl)
      port map(clk => clk, q => q, qbar => qbar);

  clk <= '0', not clk after 1 ns;

  process is
  begin
    wait for 8 ns;

    wait;
  end process;
end architecture;
