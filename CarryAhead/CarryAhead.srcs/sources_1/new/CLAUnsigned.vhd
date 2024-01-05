library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity FA is
    port(A,B,Cin: in STD_LOGIC;
         S,Cout: out STD_LOGIC);
end FA;

architecture beh of FA is
    signal p,g:std_logic;
begin
    p<=A xor B;
    g<=A and B;
    Cout<=g or (p and Cin);
    S<=p xor Cin;
end beh;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CLAUnsigned is
    generic(n: integer:=3);
    Port ( A : in STD_LOGIC_VECTOR (n downto 0);
           B : in STD_LOGIC_VECTOR (n downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (n downto 0));
end CLAUnsigned;

architecture Behavioral of CLAUnsigned is

    signal IZ,IU,OM: STD_LOGIC_VECTOR(n/2 downto 0);
    signal Carry,CZ,CU: STD_LOGIC_VECTOR((n/2)+1 downto 0);
    signal Sel: STD_LOGIC;

    component FA is
    port(A,B,Cin: in STD_LOGIC;
         S,Cout: out STD_LOGIC);
    end component;
begin
    Carry(0)<=Cin;
    CZ(0)<='0';
    CU(0)<='1';
    ff: for i in 0 to n/2 generate
        myFA: FA port map(A(i),B(i),Carry(i),S(i),Carry(i+1));
        end generate ff;
    Sel<=Carry(n/2);
    sf: for j in 0 to n/2 generate
        ifE: if j=n/2 generate
            FAZ: FA port map(A(j),B(j),CZ(n/2),IZ(n/2),CZ((n/2)+1));
            FAU: FA port map(A(j),B(j),CU(n/2),IU(n/2),CU((n/2)+1));
            end generate ifE;
        ifL: if j<n/2 generate
            FAZ: FA port map(A(j+n/2),B(j+n/2),CZ(j),IZ(j),CZ(j+1));
            FAU: FA port map(A(j+n/2),B(j+n/2),CU(j),IU(j),CU(j+1));
        end generate ifL;
    end generate sf;
    mf: for k in 0 to n/2 generate
        OM(k)<=IZ(k) when Sel='0' else
               IU(k) when Sel='1' else
               'X';
        S(k+n/2)<=OM(k);
        end generate mf;
end Behavioral;
