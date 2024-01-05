library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Simulazione is
--  Port ( );
end Simulazione;

architecture Behavioral of Simulazione is

    component SelAdd is
     Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
            Sel : in STD_LOGIC;
            S : out STD_LOGIC_VECTOR (8 downto 0));
    end component;
    signal IA:STD_LOGIC_VECTOR(7 downto 0);
    signal ISel: STD_LOGIC;
    signal OS: STD_LOGIC_VECTOR(8 downto 0);
begin
    myCirc: SelAdd port map(IA,ISel,OS);
    process begin
        IA<=(1=>'1',2=>'1',others=>'0');
        ISel<='0';
        wait for 5ns;
        ISel<='1';
        wait for 5ns;
        IA<=(3=>'1',others=>'0');
        wait for 5ns;
    end process;
end Behavioral;
