library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FullAdder is
    Port( A,B,Cin: in STD_LOGIC;
          S,Cout: out STD_LOGIC);
end FullAdder;

architecture beh of FullAdder is
    signal p,g: STD_LOGIC;
    begin
        p<=A xor B;
        g<=A and B;
        Cout<=g or (p and Cin);
        S<=p xor Cin;
end beh;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CLA is
    generic(n: integer:=4);
    Port ( A : in STD_LOGIC_VECTOR (n-1 downto 0);
           B : in STD_LOGIC_VECTOR (n-1 downto 0);
           Cin: in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (n downto 0));
end CLA;

architecture str of CLA is
    signal IngZ,IngU,OM: STD_LOGIC_VECTOR(n/2 downto 0);
    signal CZ,CU,Carry: STD_LOGIC_VECTOR((n/2)+1 downto 0);
    signal Sel: std_logic;
    
    component FullAdder is
        Port(A,B,Cin: in STD_LOGIC;
             S,Cout: out STD_LOGIC);
    end component;
begin
    Carry(0)<=Cin;
    CZ(0)<='0';
    CU(0)<='1';
    firstFor: for i in 0 to n/2 generate
        myFa:   FullAdder port map(A(i),B(i),Carry(i),S(i),Carry(i+1));
    end generate firstFor;
    Sel<=Carry((n/2)+1);
    sFor: for j in 0 to n/2 generate
        ifE: if j=n/2 generate
            FAU: FullAdder port map(A(n-1),B(n-1),CU(n/2),IngU(n/2),CU((n/2)+1));
            FAZ: FullAdder port map(A(n-1),B(n-1),CZ(n/2),IngZ(n/2),CZ((n/2)+1));
            end generate;
        ifL: if j<n/2 generate
            FAU: FullAdder port map(A(j+n/2),B(j+n/2),CU(j),IngU(j),CU(j+1));
            FAZ: FullAdder port map(A(j+n/2),B(j+n/2),CZ(j),IngZ(j),CZ(j+1));
            end generate;
    end generate sFor;
    mFor: for k in 0 to n/2 generate
        OM(k)<= IngZ(k) when Sel='0' else
                IngU(k) when Sel='1' else
                'X';
        S(k+n/2)<=OM(k);
    end generate mFor;
end str;
