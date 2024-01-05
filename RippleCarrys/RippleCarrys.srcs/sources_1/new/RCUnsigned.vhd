library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity FA is
    port( A,B,Cin: in std_logic;
          S,Cout: out std_logic);
end FA;
architecture beh of FA is
    signal p,g:STD_LOGIC;
    begin
        p<=A xor B;
        g<=A and B;
        Cout<=g or (p and Cin);
        S<=p xor Cin;
end beh;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity RCUnsigned is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Cin : in STD_LOGIC;
           Cout : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (7 downto 0));
end RCUnsigned;

architecture struct of RCUnsigned is
    component FA is
    port( A,B,Cin: in std_logic;
          S,Cout: out std_logic);
    end component;
    signal C: std_logic_vector(8 downto 0);
begin
    c(0)<=Cin;
    myFor: for i in 0 to 7 generate
        circ:FA port map(A(i),B(i),c(i),S(i),c(i+1));
        end generate;
    Cout<=c(8);
end struct;

architecture beh of RCUnsigned is
    signal p,g: std_logic_vector(7 downto 0);
    signal carry: std_logic_vector(8 downto 0);
begin
    carry(0)<=Cin;
    p<=A xor B;
    g<=A and B;
    carry(8 downto 1)<=g or (p and carry(7 downto 0));
    Cout<=carry(8);
    S<=p xor carry(7 downto 0);
end beh;
