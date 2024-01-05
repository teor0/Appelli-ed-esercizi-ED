library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Mux is
    Port( A,B,Sel: in STD_LOGIC;
          O: out STD_LOGIC);
end Mux;
architecture Beh of Mux is

begin
    O<= (A and (not Sel)) or (B and Sel);
end Beh;
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
entity CarrySelect is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Cin: in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (8 downto 0));
end CarrySelect;


architecture Struct of CarrySelect is
    
    component FullAdder is
        Port(A,B,Cin: in STD_LOGIC;
             S,Cout: out STD_LOGIC);
    end component;
    component Mux is
        Port(A,B,Sel: STD_LOGIC;
             OS: STD_LOGIC);
    end component;
    signal Carry_iniziale,CinZ,CinU,OMux: STD_LOGIC_VECTOR(3 downto 0);
    signal Carry_zero,Carry_uno: STD_LOGIC_VECTOR(8 downto 4);
    signal Sel: STD_LOGIC;
begin
    Carry_iniziale(0)<=Cin;
    firstFor: for i in 0 to 3 generate
        myFA: FullAdder port map(A(i),B(i),Carry_iniziale(i),S(i),Carry_iniziale(i+1));
    end generate firstFor;
    Carry_zero(0)<='0';
    Carry_uno(0)<='1';
    Sel<=Carry_iniziale(3);
    -- nota bene che sensa generic esce una porcata, quindi vedi/fai una versione con generic
    secondFor: for j in 4  to 7 generate
        ifE: if j=7 generate
            FAZ: FullAdder port map(A(j),B(j),Carry_zero(j),CinZ(j),Carry_zero(j+1));
            FAU: FullAdder port map(A(j),B(j),Carry_uno(j),CinU(j),Carry_uno(j+1));
        end generate ifE;
        ifL: if j<7 generate
            FAZ: FullAdder port map(A(j),B(j),Carry_zero(j),CinZ(j),Carry_zero(j+1));
            FAU: FullAdder port map(A(j),B(j),Carry_uno(j),CinU(j),Carry_uno(j+1));
        end generate ifL;
    end generate secondFor;
    forMux: for k in 0 to 3 generate
        OMux(k)<= CinZ(k) when Sel='0' else
                  CinU(k) when Sel='1' else
                  'X';
        S(k+4)<=OMux(k);
    end generate forMux;
end Struct;
