library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity FA is
    Port( A,B,Cin: in STD_LOGIC;
          S,Cout: out STD_LOGIC);
end FA;
architecture beh of FA is
    signal p,g: STD_LOGIC;
begin
    p<= A xor B;
    g<= A and B;
    Cout<= g or (p and Cin);
    S<= p xor Cin;
end beh;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Mux is
    Port( A,B,Sel: in STD_LOGIC;
          S: out STD_LOGIC);
end Mux;
architecture beh of Mux is
begin
    S<=(A and (not Sel)) or (B and Sel);    
end beh;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity CarrySelGen is
    generic(n : integer:=16);
    Port ( A : in STD_LOGIC_VECTOR (n-1 downto 0);
           B : in STD_LOGIC_VECTOR (n-1 downto 0);
           Cin: in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (n downto 0));
end CarrySelGen;
architecture Struct of CarrySelGen is
    signal IngZ,IngU,OM: STD_LOGIC_VECTOR(n/2 downto 0);
    signal Carry,CZ,CU: STD_LOGIC_VECTOR((n/2)+1 downto 0);
    signal Sel: STD_LOGIC;
    component FA is
        Port( A,B,Cin: in STD_LOGIC;
              S,Cout: out STD_LOGIC);
    end component;
    component Mux is
        Port( A,B,Sel: in STD_LOGIC;
              S: out STD_LOGIC); 
    end component;
begin
    Carry(0)<=Cin;
    CZ(0)<='0';
    CU(0)<='1';
    ff: for i in 0 to n/2 generate
        myFa: FA port map(A(i),B(i),Carry(i),S(i),Carry(i+1));
    end generate ff;
    Sel<=Carry((n/2)+1);
    sf: for j in 0 to n/2 generate
        ifE: if j=n/2 generate
                FAZ: FA port map(A(n-1),B(n-1),CZ(n/2),IngZ(n/2),CZ((n/2)+1));
                FAU: FA port map(A(n-1),B(n-1),CU(n/2),IngU(n/2),CU((n/2)+1));
            end generate;
        ifL: if j<n/2 generate
            FAZ: FA port map(A(j+n/2),B(j+n/2),CZ(j),IngZ(j),CZ(j+1));
            FAU: FA port map(A(j+n/2),B(j+n/2),CU(j),IngU(j),CU(j+1));
            end generate;
    end generate sf;
    mf: for k in 0 to n/2 generate
        OM(k)<= IngZ(k) when Sel='0' else
                IngU(k) when Sel='1' else
                'X';
        S(k+n/2)<=OM(k);
        end generate mf;
end Struct;
