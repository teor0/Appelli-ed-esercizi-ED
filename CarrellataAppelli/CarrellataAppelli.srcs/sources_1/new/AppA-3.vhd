-- se C="00" A+1, se C="01" -A+3, se C="10" B+1, se C="11" -B+3
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity AppA3 is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           C : in STD_LOGIC_VECTOR(1 downto 0);
           S : out STD_LOGIC_VECTOR (8 downto 0));
end AppA3;
architecture Behavioral of AppA3 is
    signal EA,EB,NA,NB,p,g,O1,O2: STD_LOGIC_VECTOR(8 downto 0);
    signal Carry: STD_LOGIC_VECTOR(9 downto 0);
begin
    EA<=A(7)&A;
    EB<=B(7)&B;
    NA<=not(EA);
    NB<=not(EB);
    O1<=EA when C="00" else
        NA when C="01" else
        EB when C="10" else
        NB when C="11" else
        (others=>'X');
    O2<=(0=>'1',others=>'0') when C(0)='0' else
        (0=>'1',1=>'1',others=>'0') when C(0)='1' else
        (others=>'X');    
    p<=O1 xor O2;
    g<=O1 and O2;
    Carry(0)<=C(0);
    Carry(9 downto 1)<=g or (p and Carry(8 downto 0));
    S<=p xor Carry(8 downto 0);
end Behavioral;
