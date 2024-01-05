-- A+B se C=0, A-B se C=1. Inoltre ho registro su uscita con reset
-- a fronte di discesa

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SelAddReg is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Clk : in STD_LOGIC;
           C : in STD_LOGIC;
           Reset : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (8 downto 0));
end SelAddReg;

architecture Behavioral of SelAddReg is

    signal EA,EB,nB,TrueB,p,g,RegS,Aux: std_logic_vector(8 downto 0);
    signal Carry: std_logic_vector(9 downto 0);

begin
    EA<=A(7)&A;
    EB<=B(7)&B;
    nB<=not(EB);
    TrueB<=EB when C='0' else
           nB when C='1' else
           (others=>'X');
    p<=EA xor TrueB;
    g<=EA and TrueB;
    Carry(0)<=C;
    Carry(9 downto 1)<=g or (p and Carry(8 downto 0));
    Aux<=p xor Carry(8 downto 0);
    process(Clk,Reset)begin
        if(falling_edge(Clk))then
            if(Reset='1')then
                RegS<=(others=>'0');
            elsif(Reset='0')then
                RegS<=Aux;
            end if;
        end if;
    end process;
    S<=RegS;
end Behavioral;
