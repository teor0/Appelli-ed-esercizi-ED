library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--- A complemento a 2 memorizzare il risultato su registro
--- sul fronte di clock. Il valore di A si sceglie in
--- base alla seguente tabella:
---   C  | S
---  000 | A
---  001 | A
---  010 | 2A
---  011 | 2A
---  100 | -A
---  101 | -A
---  110 | -2A
---  111 | -2A

entity SelReg is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           C : in STD_LOGIC_VECTOR (2 downto 0);
           Clk: in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (8 downto 0));
end SelReg;

architecture Behavioral of SelReg is

    signal EA,B,nA,DA,nDA,TrueA,p,g,R: STD_LOGIC_VECTOR(8 downto 0);
    signal Carry: STD_LOGIC_VECTOR(9 downto 0);

begin
    process(Clk) begin
        if(falling_edge(Clk))then
            S<=R;
        end if;
    end process;
    EA<=A(7)&A;
    nA<=not(EA);
    B<=(others=>'0');
    DA<=A&'0'; --EA(8 downto 1)&'0'
    nDA<=nA(7 downto 0)&'1'; --not (DA)
    TrueA<= EA when C="000" else
            EA when C="001" else
            DA when C="010" else
            DA when C="011" else
            nA when C="100" else
            nA when C="101" else
            nDA when C="110" else
            nDA when C="111" else
            (others=>'X');
    Carry(0)<=C(2);
    p<=TrueA xor B;
    g<=TrueA and B;
    Carry(9 downto 1)<=g or (p and Carry(8 downto 0));
    R<=p xor Carry(8 downto 0);    
end Behavioral;
