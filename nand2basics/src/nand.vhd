entity nand_gate is
  port (
    a, b : in bit;
    q : out bit
  );
end entity;

architecture rtl of nand_gate is
begin
  q <= a nand b;
end architecture;
