entity not_gate is
  port (
    i : in bit;
    o : out bit
  );
end not_gate;

architecture rtl of not_gate is
begin
  o <= i nand i;
end rtl;

