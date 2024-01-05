library IEEE;
use IEEE.std_logic_1164.ALL;

entity SelAdd is
    port(A,B: in std_logic_vector(7 downto 0);
         C: in std_logic_vector(1 downto 0);
         S: out std_logic_vector(8 downto 0));
end SelAdd;

architecture beh of SelAdd is

    signal one,three,EA,EB,nA,nB,TrueA,TrueB,p,g: std_logic_vector(8 downto 0);
    signal Carry: std_logic_vector(9 downto 0);

begin
    EA<=A(7)&A;
    EB<=B(7)&B;
    nA<=not(EA);
    nB<=not(EB);
    one<=(0=>'1',others=>'0');
    three<=(0=>'1',1=>'1',others=>'0');
    TrueA<= EA when C="00" else
            nA when C="01" else
            EB when C="10" else
            nB when C="11" else
            (others=>'X');
    TrueB<= one when C(0)='0' else
            three when C(0)='1' else
            (others=>'X');
    Carry(0)<=C(0);
    p<=TrueA xor TrueB;
    g<=TrueA and TrueB;
    Carry(9 downto 1)<=g or (p and Carry(8 downto 0));
    S<=p xor Carry(8 downto 0);
end beh;