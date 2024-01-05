library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sim is
--  Port ( );
end Sim;

architecture Behavioral of Sim is

    component SelAdd is
    Port ( A: in STD_LOGIC_VECTOR (7 downto 0);
           B: in STD_LOGIC_VECTOR (7 downto 0);
           C: in STD_LOGIC_VECTOR (1 downto 0);
           S: out STD_LOGIC_VECTOR (8 downto 0));
    end component;
    signal IA,IB: STD_LOGIC_VECTOR(7 downto 0);
    signal IC: STD_LOGIC_VECTOR(1 downto 0);
    signal OS: STD_LOGIC_VECTOR(8 downto 0);

begin
    circ: SelAdd port map(IA,IB,IC,OS);
    process begin
        IA<=(0 =>'1', 2=>'1', others=>'0');
        IB<=(0 =>'1', 2=>'1', others=>'0');
        IC<="00";
        wait for 3ns;
        IC<="01";
        wait for 3ns;
        IC<="10";
        wait for 3ns;
        IC<="11";
        wait for 3ns;
    end process;
end Behavioral;
