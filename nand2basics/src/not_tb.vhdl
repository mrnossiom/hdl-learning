entity not_gate_tb is end;

architecture behavior of not_gate_tb is
  signal i, o : bit;
begin
  not_0: entity work.not_gate(rtl) port map (i => i, o => o);

  process
  begin
    i <= '0';
    wait for 1 ns;

    i <= '1';
    wait for 1 ns;

    wait;
  end process;
end behavior;
