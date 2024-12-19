entity and_gate_tb is end;

architecture behavior of and_gate_tb is
  signal a, b, q : bit;
begin
  and_0: entity work.and_gate(rtl)
    port map(
        a => a,
        b => b,
        q => q
    );

  process
  begin
    a <= '0', '1' after 2 ns;
    b <= '0', '1' after 1 ns, '0' after 2 ns, '1' after 3 ns;
    wait for 4 ns;

    wait;
  end process;
end behavior;
