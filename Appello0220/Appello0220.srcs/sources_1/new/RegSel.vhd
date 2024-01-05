library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity RegSel is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           Clr : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (4 downto 0));
end RegSel;

architecture Behavioral of RegSel is
    signal p,g,EA,EB,nB,RA,RB: STD_LOGIC_VECTOR(4 downto 0);
    signal Carry: STD_LOGIC_VECTOR(5 downto 0);
    signal ORis: STD_LOGIC_VECTOR(4 downto 0);
begin
    EA<=A(3)&A;
    EB<=B(3)&B;
    nB<=not EB;
    process(Clk,Clr) 
    begin
        if(Clr='1')then
            RA<=(others=>'0');
            RB<=(others=>'0');
        elsif(rising_edge(Clk))then
            RA<=EA;
            RB<=nB;
            S<=ORis;
        end if;
    end process;
    p<=RA xor RB;
    g<=RA and RB;
    Carry(5 downto 1)<=g or (p and Carry(4 downto 0));
    ORis<=p xor Carry(4 downto 0);
end Behavioral;
