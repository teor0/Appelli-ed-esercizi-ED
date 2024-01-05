library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Selector is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (1 downto 0);
           S : out STD_LOGIC_VECTOR (8 downto 0));
end Selector;

architecture Behavioral of Selector is
    signal Carry: std_logic_vector(9 downto 0);
    signal EA,p,g,nA,Ris: std_logic_vector(8 downto 0);
begin
    EA<= A(7)&A;
    nA<= not(EA);
    Ris<= EA when B="00" else
          A & '0' when B="01" else
          nA when B="10" else
          nA(7 downto 0)&'1' when B="11" else
          (others=>'X');
    Carry(0)<= B(1);
    p<= Ris xor "000000000";
    g<= Ris and "000000000";
    Carry(9 downto 1)<= g or (p and Carry(8 downto 0));
    S<= p xor Carry(8 downto 0);
end Behavioral;
