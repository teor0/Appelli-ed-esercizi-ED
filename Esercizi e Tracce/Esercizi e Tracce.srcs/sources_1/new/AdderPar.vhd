library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FA is
 Port( A: in STD_LOGIC;
       B: in STD_LOGIC;
       Cin: in STD_LOGIC;
       Cout: out STD_LOGIC;
       S: out STD_LOGIC);
end FA;

architecture behav of FA is
begin
    Cout<=(A and B) or ((A xor B) and Cin);
    S<=A xor B xor Cin;
end behav;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Add_nBit is
    generic(n:integer:=8);
    Port ( A : in STD_LOGIC_VECTOR (n-1 downto 0);
           B : in STD_LOGIC_VECTOR (n-1 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (n downto 0));
end Add_nBit;

architecture Behavioral of Add_nBit is

component FA is
 Port( A: in STD_LOGIC;
       B: in STD_LOGIC;
       Cin: in STD_LOGIC;
       Cout: out STD_LOGIC;
       S: out STD_LOGIC);
end component;
signal carry: STD_LOGIC_VECTOR(n+1 downto 0);
begin
    carry(0)<=Cin;
    myFor: for i in 0 to n generate
        myIfM: if i=n generate
                    FAM: FA port map(A(n-1),B(n-1),carry(n),carry(n+1),S(n));
               end generate; -- end IfM
        myIfL: if i<n generate
                    FAL: FA port map(A(i),B(i),carry(i),carry(i+1),S(i));
               end generate; -- end IfL
           end generate; -- end for
    -- rispetto ad un istanziazione non parametrica, si usano gli per distinguere quando fare l'estensione di segno
end Behavioral;
