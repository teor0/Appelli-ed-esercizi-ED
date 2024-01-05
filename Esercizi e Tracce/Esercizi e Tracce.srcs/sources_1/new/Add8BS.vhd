library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Add8BS is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (8 downto 0));
end Add8BS;

architecture struct of Add8BS is

component FA is
    port( A: in STD_LOGIC;
          B: in STD_LOGIC;
          Cin: in STD_LOGIC;
          Cout: out STD_LOGIC;
          S: out STD_LOGIC);
end component;
-- segnale per estensione segno
signal EA,EB: STD_LOGIC_VECTOR(8 downto 0);
-- segnal per il riporto
signal carry: STD_LOGIC_VECTOR(9 downto 0);
begin
    -- estendo con segno A
    EA<=A(7)&A;
    -- estendo con segno B
    EB<=B(7)&B;
    carry(0)<=Cin;
    myFor: for i in 0 to 8 generate
        FAi: FA port map(EA(i),EB(i),carry(i),carry(i+1),S(i));
    end generate;
end struct;
