library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
library work;
use work.myDef.ALL;

entity Test_AddSel is
--  Port ( );
end Test_AddSel;

architecture Behavioral of Test_AddSel is
    component AdderSel is
    Port ( A : in STD_LOGIC_VECTOR (n-1 downto 0);
           B : in STD_LOGIC_VECTOR (n-1 downto 0);
           Sel : in STD_LOGIC;
           Ris : out STD_LOGIC_VECTOR (n downto 0));
    end component;
    signal IA: STD_LOGIC_VECTOR(n-1 downto 0);
    signal IB: STD_LOGIC_VECTOR(n-1 downto 0);
    signal ISel: STD_LOGIC;
    signal ORis: STD_LOGIC_VECTOR(n downto 0);

begin
    circ: AdderSel port map(IA,IB,ISel,ORis);
    process
    begin
        ISel<='0'; --somma
        for va in -(2**(n-1)) to (2**(n-1))-1 loop
            IA<=CONV_STD_LOGIC_VECTOR(va,n);
            for vb in -(2**(n-1)) to (2**(n-1))-1 loop
                IB<=CONV_STD_LOGIC_VECTOR(vb,n);
                wait for 10ns;
            end loop;
        end loop;
        
        ISel<='1'; --sottrazione
        for va in -(2**(n-1)) to (2**(n-1))-1 loop
            IA<=CONV_STD_LOGIC_VECTOR(va,n);
            for vb in -(2**(n-1)) to (2**(n-1))-1 loop
                IB<=CONV_STD_LOGIC_VECTOR(vb,n);
                wait for 10ns;
            end loop;
        end loop;
        


end Behavioral;
