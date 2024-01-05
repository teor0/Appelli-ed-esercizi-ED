library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Add1119 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           C : in STD_LOGIC;
           Clk : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR(4 downto 0));
end Add1119;

architecture Behavioral of Add1119 is

    signal p,g,EA,nA,RegA,TrueA,Ap,Ag,one,zero,O: std_logic_vector(4 downto 0);
    signal Carry,CA: std_logic_vector(5 downto 0);

begin
    EA<=A(3)&A;
    nA<=not(EA);
    zero<=(others=>'0');
    TrueA<=EA when C='0' else
           nA when C='1' else
           (others=>'X');
    Ap<=TrueA xor zero;
    Ag<=TrueA and zero;
    CA(0)<=C;
    CA(5 downto 1)<=Ag or (Ap and CA(4 downto 0));
    O<=Ap xor CA(4 downto 0);
    process(Clk)begin
        if(falling_edge(Clk))then
            RegA<=O;
        end if;
    end process;
    one<=(0=>'1',others=>'0') when C='0' else
         (0=>'0',others=>'1') when C='1' else
         (others=>'X');
    p<=RegA xor one;
    g<=RegA and one;
    Carry(0)<=C;
    Carry(5 downto 1)<=g or (p and Carry(4 downto 0));
    S<=p xor Carry(4 downto 0);
end Behavioral;
