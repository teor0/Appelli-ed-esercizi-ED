library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity AppMio is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           C : in STD_LOGIC_VECTOR (1 downto 0);
           S : out STD_LOGIC_VECTOR (8 downto 0));
end AppMio;

architecture Behavioral of AppMio is

    signal EA,EB,NA,NB,p,g,zero,O1: STD_LOGIC_VECTOR(8 downto 0);
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
    zero<=(others=>'0');
    p<=O1 xor zero;
    g<=O1 and zero;
    Carry(0)<=C(0);
    Carry(9 downto 1)<=g or (p and Carry(8 downto 0));
    S<=p xor Carry(8 downto 0);
end Behavioral;
