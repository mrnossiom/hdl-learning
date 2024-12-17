entity fulladder is
  port (
    i0, i1 : in bit; -- terms
    ci : in bit; -- carry-in

    s : out bit; -- sum
    co : out bit -- carry-out
  );
end fulladder;

architecture rtl of fulladder is
begin
  s <= i0 xor i1 xor ci;
  co <= (i0 and i1) or (i0 and ci) or (i1 and ci);
end rtl;
