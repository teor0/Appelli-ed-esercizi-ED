library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Add8BB is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (8 downto 0));
end Add8BB;

architecture Behavioral of Add8BB is
signal p,g: std_logic_vector(8 downto 0);
signal carry: std_logic_vector(9 downto 0);
begin
    -- definisco p e g e li estendo di segno
    p<=(A(7) xor B(7)) & (A xor B);
    g<=(A(7) and B(7)) & (A and B);
    carry(0)<=Cin;
    carry(9 downto 1)<=g or (p and carry(8 downto 0));
    S<=p xor carry(8 downto 0);
end Behavioral;
