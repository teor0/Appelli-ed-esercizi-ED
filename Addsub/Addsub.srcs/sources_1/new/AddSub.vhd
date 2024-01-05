library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.Def.all; --importo il package creato
--nel file Definition
entity AddSub is
    Port ( A : in STD_LOGIC_VECTOR (n-1 downto 0);
           B : in STD_LOGIC_VECTOR (n-1 downto 0);
           Sel : in STD_LOGIC;
           Ris : out STD_LOGIC_VECTOR (n+1 downto 0));
end AddSub;

architecture Behavioral of AddSub is
signal EA, EB, NB, TrueB: STD_LOGIC_VECTOR (n downto 0);
signal carry: STD_LOGIC_VECTOR (n+1 downto 0);
signal p,g: STD_LOGIC_VECTOR (n downto 0);
begin
    EA<=A(n-1) &A; EB<=B(n-1) &B; NB<=not EB;
    -- copia n-esimo bit nella posizione n-1
    TrueB<=EB when Sel='0' else
           NB when Sel='1' else (others=>'X');
    carry(0)<=Sel;
    p<=EA xor TrueB;
    g<=EA and TrueB;
    carry(n+1 downto 1)<=g or (p and carry(n downto 0));
    --stessa funzione di somma vista negli altri casi.
    Ris<=p xor carry(n downto 0);       
end Behavioral;
