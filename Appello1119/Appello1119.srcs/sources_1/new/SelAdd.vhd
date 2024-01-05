library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity SelAdd is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           C : in STD_LOGIC;
           Clk : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (4 downto 0));
end SelAdd;

architecture Behavioral of SelAdd is
    signal EA,nA,TrueA,RA: STD_LOGIC_VECTOR(4 downto 0);
    signal one: STD_LOGIC_VECTOR(4 downto 0);
    signal p,g: STD_LOGIC_VECTOR(4 downto 0);
    signal Carry: STD_LOGIC_VECTOR(5 downto 0);
begin
    EA<=A(3)&A;
    nA<= not EA;
    TrueA <= EA when C='0' else
             nA when C='1' else
             (others=>'X');
    one <= "00001" when C='0' else
           "11111" when C='1' else
           (others=>'X'); 
    Carry(0)<='0';
    
    process(Clk) begin
        if(falling_edge(Clk))then
            RA<=TrueA;
        end if;
    end process;
    
    p<= RA xor one;
    g<= RA and one;
    Carry(5 downto 1)<=g or (p and Carry(4 downto 0));
    S<=p xor Carry(4 downto 0);
    
end Behavioral;
