library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SimA2A is
--  Port ( );
end SimA2A;

architecture Behavioral of SimA2A is

    component A2A is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           C : in STD_LOGIC_VECTOR (1 downto 0);
           S : out STD_LOGIC_VECTOR (8 downto 0));
    end component;
    signal IA: std_logic_vector(7 downto 0);
    signal IC: std_logic_vector(1 downto 0);
    signal OS: std_logic_vector(8 downto 0);

begin
    circ: A2A port map(IA,IC,OS);
    process begin
        IA<=(0=>'1',3=>'1',others=>'0');
        IC<="11";
        wait for 3ns;
        IC<="01";
        wait for 3ns;
        IC<="10";
        wait for 3ns;
        IC<="00";
        wait for 3ns;
    end process;
end Behavioral;
