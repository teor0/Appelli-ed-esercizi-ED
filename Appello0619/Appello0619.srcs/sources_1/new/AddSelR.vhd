library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AddSelR is
    generic(n:integer:=4);
    Port ( A : in STD_LOGIC_VECTOR (n-1 downto 0);
           B : in STD_LOGIC_VECTOR (n-1 downto 0);
           C : in STD_LOGIC_VECTOR (1 downto 0);
           Clk : in STD_LOGIC;
           Clr : in STD_LOGIC;
           Ris : out STD_LOGIC_VECTOR (n downto 0));
end AddSelR;

architecture Behavioral of AddSelR is
    signal EA,EB,nA,nB,OPar,ORis: STD_LOGIC_VECTOR(n downto 0);
    -- OPar è il risultato parziale che va sommato con 1 se è negativo
    signal Carry: STD_LOGIC_VECTOR(n+1 downto 0);
    -- uso il carry per aggiungere 1 o meno in base a cosa bisogna ritornare
    signal p,g,z: STD_LOGIC_VECTOR(n downto 0);
    -- uso il segnale z come 0 da sommare con OPar
begin
    EA<=A(n-1)&A;
    EB<=B(n-1)&B;
    nA<= not(EA);
    nB<= not(EB);
    z<=(others=>'0');
    
   process(Clk,Clr)
   begin
    if(Clr='0')then
        Ris<=(others=>'0');
    elsif(rising_edge(Clk))then
        Ris<=ORis;
    end if;
   end process;
   
   OPar<= EA when C="00" else
          nA when C="01" else
          EB when C="10" else
          nB when C="11" else
          (others=>'X');
          
   Carry(0)<= '0' when C="00" else
              '1' when C="01" else
              '0' when C="10" else
              '1' when C="11" else
              'X';
   p<= OPar xor z;
   g<= OPar and z;
   Carry(n+1 downto 1)<=g or (p and Carry(n downto 0));
   ORis<= p xor Carry(n downto 0);
   
end Behavioral;
