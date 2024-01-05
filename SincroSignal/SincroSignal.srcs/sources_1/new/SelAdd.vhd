library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SelAdd is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Clk : in STD_LOGIC;
           Sel: in STD_LOGIC;
           Set : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (8 downto 0));
end SelAdd;
architecture Behavioral of SelAdd is
    signal EA,EB,nB,TrueB,RA,RB,p,g: STD_LOGIC_VECTOR(8 downto 0);
    signal Carry: STD_LOGIC_VECTOR(9 downto 0);
begin
    EA<=A(7)&A;
    EB<=B(7)&B;
    nB<= not EB;
    TrueB<= EB when Sel='0' else
            nB when Sel='1' else
            (others=>'X');
    process(Clk)
        begin
            if(rising_edge(Clk))then
                if(Set='1')then
                    RA<=(others=>'0');
                    RB<=(others=>'0');
                elsif(Set='0')then
                    RA<=EA;
                    RB<=TrueB;
                end if;
            end if;
    end process;
    Carry(0)<=Sel;
    p<=RA xor RB;
    g<=RA and RB;     
    Carry(9 downto 1)<= g or (p and Carry(8 downto 0));
    S<= p xor Carry(8 downto 0);
end Behavioral;
