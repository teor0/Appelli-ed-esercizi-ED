library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SelAdd is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (4 downto 0));
end SelAdd;

architecture Behavioral of SelAdd is
    signal EA,EB,nB,TrueB: STD_LOGIC_VECTOR(4 downto 0);
    signal p,g: STD_LOGIC_VECTOR(4 downto 0);
    signal Carry: STD_LOGIC_VECTOR(5 downto 0);
begin
    EA<=A(3)&A;
    EB<=B(3)&B;
    nB<=not EB;
    TrueB<= EB when C='0' else
            nB when C='1' else
            (others=>'X');
    p<= EA xor TrueB;
    g<= EA and TrueB;
    Carry(0)<= '0' when C='0' else
               '1' when C='1' else
               'X';
    Carry(5 downto 1)<=g or (p and Carry(4 downto 0));
    S<= p xor Carry(4 downto 0);   
end Behavioral;
