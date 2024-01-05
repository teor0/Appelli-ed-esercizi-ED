library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Sel2A4A is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           C : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (9 downto 0));
end Sel2A4A;

architecture Behavioral of Sel2A4A is
    signal EA: STD_LOGIC_VECTOR(8 downto 0);
begin
    EA<=A(7)&A;
    S<=EA&'0' when C='0' else
       EA(7 downto 0)&"00" when C='1' else 
       (others=>'X');

end Behavioral;
