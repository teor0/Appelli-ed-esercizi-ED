library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
library work;
use work.Def.all;
entity SimAddSub is
--  Port ( );
end SimAddSub;
architecture Behavioral of SimAddSub is
component AddSub is
    Port ( A : in STD_LOGIC_VECTOR (n-1 downto 0);
           B : in STD_LOGIC_VECTOR (n-1 downto 0);
           Sel : in STD_LOGIC;
           Ris : out STD_LOGIC_VECTOR (n+1 downto 0));
end component;
signal IA:STD_LOGIC_VECTOR (n-1 downto 0);
signal IB:STD_LOGIC_VECTOR (n-1 downto 0);
signal ISel:STD_LOGIC;
signal ORis:STD_LOGIC_VECTOR (n+1 downto 0);
begin
    circ: AddSub port map(IA,IB,ISel, ORis);
    process
    begin
        ISel<='0'; --somma
        for va in -(2**(n-1)) to (2**(n-1))-1 loop
            IA<=conv_std_logic_vector(va,n);
            for vb in -(2**(n-1)) to (2**(n-1))-1 loop
                IB<=conv_std_logic_vector(vb,n);
                wait for 10ns;
            end loop;
        end loop;
        ISel<='1'; --sottrazione
        for va in -(2**(n-1)) to (2**(n-1))-1 loop
        IA<=conv_std_logic_vector(va,n);
        for vb in -(2**(n-1)) to (2**(n-1))-1 loop
            IB<=conv_std_logic_vector(vb,n);
            wait for 10ns;
        end loop;
    end loop;
    end process;
end Behavioral;
