library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sim0919 is
--  Port ( );
end Sim0919;

architecture Behavioral of Sim0919 is

    component Sel0919 is
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               C : in STD_LOGIC;
               S : out STD_LOGIC_VECTOR (4 downto 0));
    end component;
    
    signal IA,IB: STD_LOGIC_VECTOR(3 downto 0);
    signal IC: STD_LOGIC;
    signal OS: STD_LOGIC_VECTOR(4 downto 0);
    
begin
    circ: Sel0919 port map(IA,IB,IC,OS);
    process begin
        IA<=(0=>'1',others=>'0');
        IB<=(0=>'1',1=>'1',others=>'0');
        IC<='0';
        wait for 3ns;
        IC<='1';
        wait for 3ns;
        IA<=(3=>'1',others=>'0');
        IC<='0';
        wait for 3ns;
        IC<='1';
        wait for 3ns;
    end process;
end Behavioral;
