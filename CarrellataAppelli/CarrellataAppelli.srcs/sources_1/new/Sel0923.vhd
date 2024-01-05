library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sel0923 is
    Port(A,B: in std_logic_vector(7 downto 0);
         C: in std_logic_vector(1 downto 0);
         S: out std_logic_vector(8 downto 0));
end Sel0923;

architecture beh of Sel0923 is

    signal p,g,EA,EB,nA,nB,O1,O2: std_logic_vector(8 downto 0);
    signal Carry: std_logic_vector(9 downto 0);
    
begin
    EA<=A(7)&A;
    EB<=B(7)&B;
    nA<=not (EA);
    nB<=not (EB);
    O1<= EA when C="00" else
         nA when C="01" else
         EB when C="10" else
         nB when C="11" else
         (others=>'X');
    O2<=(others=>'0');
    p<=O1 xor O2;
    g<=O1 and O2;
    Carry(0)<=C(0);
    Carry(9 downto 1)<=g or (p and Carry(8 downto 0));
    S<=p xor Carry(8 downto 0);
end beh;