library IEEE;
use IEEE.std_logic_1164.ALL;
entity FA is
    port(A,B,Cin: in std_logic;
         S,Cout: out std_logic);
end FA;
architecture beh of FA is
    signal p,g: std_logic;
begin
    p<=A xor B;
    g<=A and B;
    Cout<=g or (p and Cin);
    S<=p xor Cin;
end beh;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity CarryLookAhead is
    generic(n: integer:=8);
    port (A,B:in std_logic_vector(n-1 downto 0);
          Cin: in std_logic;
          S: out std_logic_vector(n downto 0));

end CarryLookAhead;

architecture Behavioral of CarryLookAhead is
    
    signal IZ,IU,OM: std_logic_vector(n/2 downto 0);
    signal Carry,CZ,CU: std_logic_vector((n/2)+1 downto 0);
    signal Sel: std_logic;
    
    component FA is
    port(A,B,Cin: in std_logic;
         S,Cout: out std_logic);
    end component;

begin
    Carry(0)<=Cin;
    IZ(0)<='0';
    IU(0)<='1';
    fF: for i in 0 to n/2 generate
        myFa: FA port map(A(i),B(i),Carry(i),S(i),Carry(i+1));
        end generate fF;
    Sel<=Carry((n/2)+1);
    sF: for j in 0 to n/2 generate
        ifE: if j=n/2 generate
            FAZ: FA port map(A(n-1),B(n-1),CZ(n/2),IZ(n/2),CZ((n/2)+1));
            FAU: FA port map(A(n-1),B(n-1),CU(n/2),IU(n/2),CU((n/2)+1));
            end generate ifE;
        ifL: if j<n/2 generate
            FAZ: FA port map(A(j+n/2),B(j+n/2),CZ(j),IZ(j),CZ(j+1));
            FAU: FA port map(A(j+n/2),B(j+n/2),CU(j),IU(j),CU(j+1));
            end generate ifL;
        end generate sF;
     tF: for k in 0 to n/2 generate
        OM(k)<= IZ(k) when Sel='0' else
                IU(k) when Sel='1' else
                'X';
        S(k+n/2)<=OM(k);
     end generate;
end Behavioral;
