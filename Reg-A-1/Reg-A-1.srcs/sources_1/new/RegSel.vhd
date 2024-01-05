library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RegSel is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           Sel : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (4 downto 0));
end RegSel;

architecture Behavioral of RegSel is
    signal EA,one,nA,TrueA,Reg,p,g: STD_LOGIC_VECTOR(4 downto 0);
    signal Carry: STD_LOGIC_VECTOR(5 downto 0);
begin
    EA<=A(3)&A;
    nA<=not EA;
    TrueA<= EA when Sel='0' else
            nA when Sel='1' else
            (others=>'X');
    one<= (0=>'1', others=>'0') when Sel='0' else
          (others=>'1') when Sel='1' else
          (others=>'X');
    Carry(0)<= Sel;
    process(Clk)begin
        if(falling_edge(Clk))then
            Reg<=TrueA;
        end if;
    end process;
    p<=Reg xor one;
    g<=Reg and one;
    Carry(9 downto 1)<= g or (p and Carry(8 downto 0));
    S<= p xor Carry(8 downto 0);
end Behavioral;
