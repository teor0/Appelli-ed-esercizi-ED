library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity FA is
    Port(
         A,B,Cin: in STD_LOGIC;
         S,Cout: out STD_LOGIC);
end FA;

architecture Beh of FA is
    signal p,g: STD_LOGIC;
    begin
        p<= A xor B;
        g<= A and B;
        Cout<= g or (p and Cin);
        S<= p xor Cin;
end Beh;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RCAUnsignedFA is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Cin : in STD_LOGIC;
           Carry : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (7 downto 0));
end RCAUnsignedFA;

architecture struct of RCAUnsignedFA is
    component FA is
        Port(A,B,Cin: in STD_LOGIC;
         S,Cout: out STD_LOGIC);
    end component;
    signal c: STD_LOGIC_VECTOR(8 downto 0);
begin
    c(0)<=Cin;
    myFor: for i in 0 to 7 generate
        myFA: FA port map(A(i),B(i),c(i),S(i),c(i+1));
    end generate;
    Carry<=c(8);
end struct;
