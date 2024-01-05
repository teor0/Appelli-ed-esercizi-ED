library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg1119 is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           Clk : in STD_LOGIC;
           C : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (8 downto 0));
end Reg1119;

architecture Behavioral of Reg1119 is

    signal p,g,pa,ga,EA,one,nA,RegA,TrueA,HA,EB: std_logic_vector(8 downto 0);
    signal Ca,Carry: std_logic_vector(9 downto 0);

begin
    EA<=A(7)&A;
    nA<=not(EA);
    TrueA<= EA when C='0' else
            nA when C='1' else
            (others=>'X');
    EB<=(others=>'0');
    one<=(0=>'1',others=>'0') when C='0' else
         (0=>'0',others=>'1') when C='1' else
         (others=>'X');
    pa<= TrueA xor EB;
    ga<= TrueA and EB;
    Ca(0)<=C;
    Ca(9 downto 1)<=ga or (pa and Ca(8 downto 0));
    HA<=pa xor Ca(8 downto 0);
    process(Clk) begin
        if(falling_edge(Clk)) then
            RegA<=HA;
        end if;
    end process;
    p<=RegA xor one;
    g<=RegA and one;
    Carry(0)<=C;
    Carry(9 downto 1)<=g or (p and Carry(8 downto 0));
    S<= p xor Carry(8 downto 0);
end Behavioral;
