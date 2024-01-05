library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sel1119 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           C: in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (4 downto 0));
end Sel1119;

architecture Behavioral of Sel1119 is

    signal EA,nA,TrueA,TrueB,p,g,pa,ga: STD_LOGIC_VECTOR(4 downto 0);
    signal Carry,ca: STD_LOGIC_VECTOR(5 downto 0);
    signal RegA,sa: STD_LOGIC_VECTOR(4 downto 0);

begin
    EA<=A(3)&A;
    nA<=not(EA);
    TrueA<=EA when C='0' else
           nA when C='1' else
           (others=>'X');
    TrueB<=(0=>'1',others=>'0') when C='0' else
           (others=>'1')when C='1' else
           (others=>'X');
     
    pa<=TrueA xor "00000";
    ga<=TrueA and "00000";
    ca(0)<=C;
    ca(5 downto 1)<=ga or (pa and ca(4 downto 0));
    sa<=pa xor ca(4 downto 0);       
                
    process(Clk) begin
        if(falling_edge(Clk))then
            RegA<=sa;
        end if;
    end process;
    p<=RegA xor TrueB;
    g<=RegA and TrueB;
    Carry(0)<='0';
    Carry(5 downto 1)<=g or (p and Carry(4 downto 0));
    S<=p xor Carry(4 downto 0);
end Behavioral;
