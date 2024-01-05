library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity RCAUnsigned is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Cin: in STD_LOGIC;
           Carry : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (7 downto 0));
end RCAUnsigned;

architecture Behavioral of RCAUnsigned is
    signal p,g: STD_LOGIC_VECTOR(7 downto 0);
    signal c: STD_LOGIC_VECTOR(8 downto 0);
begin
    p<= A xor B;
    g<= A and B;
    c(0)<=Cin;
    c(8 downto 1)<= g or (p and c(7 downto 0));
    S<=p xor c(7 downto 0);
    Carry<=c(8);
end Behavioral;
