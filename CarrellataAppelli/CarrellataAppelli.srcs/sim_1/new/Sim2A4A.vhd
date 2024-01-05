library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sim2A4A is
--  Port ( );
end Sim2A4A;

architecture Behavioral of Sim2A4A is

    component Sel2A4A is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           C : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (9 downto 0));
    end component;
    
    signal IA:STD_LOGIC_VECTOR(7 downto 0);
    signal IC:STD_LOGIC;
    signal OS:STD_LOGIC_VECTOR(9 downto 0);
    
begin
    circ: Sel2A4A port map(IA,IC,OS);
    process begin
        IA<=(0=>'1',3=>'1',others=>'0');
        IC<='0';
        wait for 3ns;
        IC<='1';
        wait for 3ns;
        IA<=(2=>'1',6=>'1',others=>'0');
        wait for 3ns;
        IC<='0';
        wait for 3ns;
        IC<='1';
        wait for 3ns;
        IA<=(0=>'1',7=>'1',others=>'0');
        wait for 3ns;
        IC<='0';
        wait for 3ns;
    end process;
end Behavioral;
