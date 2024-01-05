library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SelAdd is
    Port ( A: in STD_LOGIC_VECTOR (7 downto 0);
           B: in STD_LOGIC_VECTOR (7 downto 0);
           C: in STD_LOGIC_VECTOR (1 downto 0);
           S: out STD_LOGIC_VECTOR (8 downto 0));
end SelAdd;

architecture Behavioral of SelAdd is

    signal EA,EB,nA,nB,TrueA,TrueB: STD_LOGIC_VECTOR(8 downto 0);
    signal Carry: STD_LOGIC_VECTOR(9 downto 0);
    signal CarryA: STD_LOGIC_VECTOR(9 downto 0);
    signal CarryB: STD_LOGIC_VECTOR(9 downto 0);
    signal HRA,HRB: STD_LOGIC_VECTOR(8 downto 0);
    signal p,g: STD_LOGIC_VECTOR(8 downto 0);
    signal pa,ga: STD_LOGIC_VECTOR(8 downto 0);
    signal zero: STD_LOGIC_VECTOR(8 downto 0);
    signal pb,gb: STD_LOGIC_VECTOR(8 downto 0);
begin
    EA<=A(7)&A;
    EB<=B(7)&B;
    nA<=not(EA);
    nB<=not(EB);
    zero<=(others=>'0');
    Carry(0)<='0';
    TrueA <= EA when C(1)='0' else
             nA when C(1)='1' else
             (others=>'X');
    TrueB <= EB when C(0)='0' else
             nB when C(0)='1' else
             (others=>'X');
    
    CarryA(0)<=C(1);
    pa<= TrueA xor zero;
    ga<= TrueA and zero;
    CarryA(9 downto 1)<=ga or (pa and CarryA(8 downto 0));
    HRA<=pa xor CarryA(8 downto 0);
    
    CarryB(0)<=C(0);
    pb<= TrueB xor zero;
    gb<= TrueB and zero;
    CarryB(9 downto 1)<=gb or (pb and CarryB(8 downto 0));
    HRB<=pb xor CarryB(8 downto 0);         
             
    p<= HRA xor HRB;
    g<= HRA and HRB;
    Carry(9 downto 1)<=g or (p and Carry(8 downto 0));
    S<=p xor Carry(8 downto 0);
end Behavioral;
