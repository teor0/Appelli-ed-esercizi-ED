library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AddSel is
    generic(n: integer:=8);
    Port ( A : in STD_LOGIC_VECTOR (n-1 downto 0); 
           C : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (n downto 0));
end AddSel;

architecture Behavioral of AddSel is
signal EA,EB: std_logic_vector(n downto 0);
signal carry: std_logic_vector(n+1 downto 0);
signal p,g: std_logic_vector(n downto 0);
begin
    EA<= A(n-1)&A;
    EB<= (0 =>'1', others =>'0') when C='0' else
         (1 =>'1', others =>'0') when C='1' else
         (others =>'X');
    carry(0)<= '0';
    p <= EA xor EB;
    g <= EA and EB;
    carry(n+1 downto 1)<= g or (p and carry(n downto 0));
    S <= p xor carry(n downto 0);
end Behavioral;
