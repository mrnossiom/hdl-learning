entity and_gate is
  port (
    a, b : in bit;
    q : out bit
  );
end and_gate;

architecture rtl of and_gate is
begin
  q <= not (a nand b);
end rtl;
