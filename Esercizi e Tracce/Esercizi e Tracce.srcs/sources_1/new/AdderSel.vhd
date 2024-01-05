library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.myDef.ALL;

entity AdderSel is
    Port ( A : in STD_LOGIC_VECTOR (n-1 downto 0);
           B : in STD_LOGIC_VECTOR (n-1 downto 0);
           Sel : in STD_LOGIC;
           Ris : out STD_LOGIC_VECTOR (n downto 0));
end AdderSel;

architecture Behavioral of AdderSel is
signal EA,EB,nB,TrueB: STD_LOGIC_VECTOR(n downto 0);
signal carry: STD_LOGIC_VECTOR(n+1 downto 0);
signal p,g: STD_LOGIC_VECTOR(n downto 0);

begin
    EA<=A(n-1)&A;
    EB<=B(n-1)&B;
    nB<=not EB;
    TrueB<=EB when Sel='0' else
           nB when Sel='1' else 
           (others=>'X');
    carry(0)<=Sel;
    p<=EA xor TrueB;
    g<=EA and TrueB;
    carry(n+1 downto 1)<=g or (p and carry(n downto 0));
    Ris<=p xor carry(n downto 0);
end Behavioral;
