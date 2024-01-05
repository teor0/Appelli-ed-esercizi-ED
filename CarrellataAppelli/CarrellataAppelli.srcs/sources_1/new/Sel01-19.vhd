library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sel0119 is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           C : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (8 downto 0));
end Sel0119;

architecture Behavioral of Sel0119 is
    signal EA,EB,nA,TrueA,p,g: STD_LOGIC_VECTOR(8 downto 0);
    signal Carry: STD_LOGIC_VECTOR(9 downto 0);
begin
    EA<=A(7)&A;
    EB<=(0=>'1',others=>'0');
    nA<=not(EA);
    TrueA<=EA when C='0' else
           nA when C='1' else
           (others=>'X');
    p<=TrueA xor EB;
    g<=TrueA and EB;
    Carry(0)<=C;
    Carry(9 downto 1)<=g or(p and Carry(8 downto 0));
    S<=p xor Carry(8 downto 0);
end Behavioral;
