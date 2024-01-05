library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Sim0119 is
--  Port ( );
end Sim0119;

architecture Behavioral of Sim0119 is

    component Sel0119 Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           C : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (8 downto 0));
    end component;

    signal IA: STD_LOGIC_VECTOR(7 downto 0);
    signal IC: STD_LOGIC;
    signal OS: STD_LOGIC_VECTOR(8 downto 0);
    
begin
    mycirc: Sel0119 port map(IA,IC,OS);
    process begin
        IA<=(0=>'1',2=>'1',others=>'0');
        IC<='0';
        wait for 3ns;
        IC<='1';
        wait for 3ns;
        IA<=(others=>'0');
        wait for 3ns;
        IC<='0';
        wait for 3ns;
        IC<='1';
        wait for 3ns;
    end process;
end Behavioral;
