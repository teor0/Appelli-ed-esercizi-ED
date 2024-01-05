library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--andiamo a descrivere il ripple carry in questo file e non come in passato
--in un altro file. importante e' riutilizzare le librerie
entity FA is
port(A, B,Cin: in STD_LOGIC;
     Cout, S:out STD_LOGIC);
end FA;
architecture behav of FA is
begin
    Cout<=(A and B) or ((A xor B) and Cin);
    S<=A xor B xor Cin;
end behav;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Add_nbit is
    generic (n:integer:=8); 
    --generic permette di definire parametri che devono avere un tipo ed un valore di default
    Port ( A : in STD_LOGIC_VECTOR (n-1 downto 0);
           B : in STD_LOGIC_VECTOR (n-1 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (n downto 0));
end Add_nbit;

architecture Behavioral of Add_nbit is
component FA is
port(A, B, Cin: in STD_LOGIC;
    Cout,S: out STD_LOGIC);
end component;
signal carry: STD_LOGIC_VECTOR (n+1 downto 0);
begin
    myfor: for i in 0 to n generate
                myIfM: if i=n generate --versione concorrente dell'if
                        FA_M: FA port map(A(n-1), B(n-1), carry(n+1), S(n));
                end generate;
                myIfL: if i<n generate
                        FA_L: FA port map( A(i), B(i), carry(i+1), S(i));
                end generate;
    end generate;
    carry(0)<=Cin;
end Behavioral;
