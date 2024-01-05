library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Selector is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Clr : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Sel : in STD_LOGIC_VECTOR(1 downto 0);
           S : out STD_LOGIC_VECTOR (8 downto 0));
end Selector;
architecture Behavioral of Selector is
    signal p,g,zero,M,EA,EB,nA,nB,Reg: STD_LOGIC_VECTOR(8 downto 0);
    signal Carry: STD_LOGIC_VECTOR(9 downto 0);
begin
    EA<=A(7)&A;
    EB<=B(7)&B;
    nA<= not EA;
    nB<= not EB;
    zero<=(others=>'0');
    M<= EA when Sel="00" else
        nA when Sel="01" else
        EB when Sel="10" else
        nB when Sel="11" else
        (others=>'X'); 
    process(Clk,Clr) begin
        if(Clr='1')then
            S<=(others=>'0');
        elsif(rising_edge(Clk))then
                S<=Reg;
        end if;
    end process;
    Carry(0)<=Sel(0);
    p<= M xor zero;
    g<= M and zero;
    Carry(9 downto 1)<= g or (p and Carry(8 downto 0));
    Reg<= p xor Carry(8 downto 0);
end Behavioral;
