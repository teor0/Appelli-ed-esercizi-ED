library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity A2A is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           C : in STD_LOGIC_VECTOR (1 downto 0);
           S : out STD_LOGIC_VECTOR (8 downto 0));
end A2A;

architecture Behavioral of A2A is

    signal EA,NA,p,g,TrueA,zero: std_logic_vector(8 downto 0);
    signal Carry: std_logic_vector(9 downto 0);
begin
    EA<=A(7)&A;
    NA<=not(EA);
    TrueA<=EA when C="00" else
           A&'0' when C="01" else
           NA when C="10" else
           not(A)&'1' when C="11" else
           (others=>'X');
    zero<=(others=>'0');
    p<=TrueA xor zero;
    g<=TrueA and zero;
    Carry(0)<=C(1);
    Carry(9 downto 1)<=g or (p and Carry(8 downto 0));
    S<=p xor Carry(8 downto 0);
end Behavioral;
