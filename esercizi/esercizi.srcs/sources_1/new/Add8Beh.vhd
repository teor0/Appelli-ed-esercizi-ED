library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Add8Beh is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (8 downto 0));
end Add8Beh;

architecture Behavioral of Add8Beh is
signal p,g: STD_LOGIC_VECTOR (8 downto 0);
signal carry: STD_LOGIC_VECTOR (9 downto 0);
begin
    p<=(A(7) xor B(7)) & (A xor B);
    g<=(A(7) and B(7)) & (A and B);
    carry(0)<=cin;
    carry(9 downto 1)<=g or (p and carry(8 downto 0));
    S<= p xor carry(8 downto 0); 
end Behavioral;
