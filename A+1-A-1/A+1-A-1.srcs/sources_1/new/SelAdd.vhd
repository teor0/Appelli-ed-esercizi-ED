library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SelAdd is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           Sel : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (8 downto 0));
end SelAdd;
architecture Behavioral of SelAdd is
    signal EA,TrueA,nA,p,g,one: STD_LOGIC_VECTOR(8 downto 0);
    signal carry: STD_LOGIC_VECTOR(9 downto 0);
begin
    EA<=A(7)&A;
    nA<= not EA;
    TrueA<= EA when Sel='0' else
            nA when Sel='1' else
            (others=>'X');
    carry(0)<= Sel;
    -- uso not 1 sommato ad 1 quindi tutti bit 1
    -- al posto di not 1 posso usare 0 e lasciare il carry iniziale sempre 0
    one<= (0=>'1',others=>'0') when Sel='0' else
          (others=>'1') when Sel='1' else
           --(others=>'0') when Sel='1' else
          (others=>'X');
    p<=TrueA xor one;
    g<=TrueA and one;
    carry(9 downto 1)<= g or (p and carry(8 downto 0));
    S<=p xor carry(8 downto 0);
end Behavioral;
