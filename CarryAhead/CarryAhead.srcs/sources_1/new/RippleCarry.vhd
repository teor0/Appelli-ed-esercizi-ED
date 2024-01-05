library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity FullAdder is
    Port ( A,B,Cin: in STD_LOGIC;
           S,Cout: out STD_LOGIC);
end FullAdder;
architecture Beh of FullAdder is
    signal p,g: STD_LOGIC;
begin
    p<=A xor B;
    g<=A and B;
    Cout<= g or (p and Cin);
    S<= p xor Cin;
end Beh;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity RippleCarry is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (8 downto 0));
end RippleCarry;
architecture Behavioral of RippleCarry is
    component FullAdder is
        Port(
             A,B,Cin: in STD_LOGIC;
             S,Cout: out STD_LOGIC);
    end component;
    signal EA,EB: STD_LOGIC_VECTOR(8 downto 0);
    signal Carry: STD_LOGIC_VECTOR(9 downto 0);   
begin
    EA<=A(7)&A;
    EB<=B(7)&B;
    Carry(0)<=Cin;
    myFor: for i in 0 to 8 generate
        myFA: FullAdder port map(EA(i),EB(i),Carry(i),S(i),Carry(i+1));
    end generate;
end Behavioral;
