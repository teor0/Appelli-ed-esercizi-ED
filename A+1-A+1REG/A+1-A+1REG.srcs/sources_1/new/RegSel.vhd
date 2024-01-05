library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity RegSel is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           Clr : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Sel: in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (4 downto 0));
end RegSel;

architecture Behavioral of RegSel is
    signal EA,nA,TA,RA: STD_LOGIC_VECTOR(4 downto 0);
    signal Carry: STD_LOGIC_VECTOR(5 downto 0);
    signal one,p,g: STD_LOGIC_VECTOR(4 downto 0);
    
begin
    EA<= A(3)&A;
    one<= "00001";
    process(Clk,Clr) begin
        if(Clr='1')then
            RA<= (others=>'0');
        elsif(rising_edge(Clk))then
            RA<= EA;
        end if;
   end process;
   nA<= not(RA);
   TA<= RA when Sel='0' else
        nA when Sel='1' else
        (others=>'X');
   Carry(0)<=Sel;
   p<= TA xor one;
   g<= TA and one;
   Carry(5 downto 1)<= g or (p and Carry(4 downto 0));
   S<=p xor Carry(4 downto 0);
end Behavioral;
