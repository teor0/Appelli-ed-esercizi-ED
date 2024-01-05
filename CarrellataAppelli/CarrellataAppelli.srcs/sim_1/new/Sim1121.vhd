library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sim1121 is
generic(n: integer:=8);
--  Port ( );
end Sim1121;

architecture Behavioral of Sim1121 is
    component App1121 is
    Port ( A : in STD_LOGIC_VECTOR (n-1 downto 0);
           B : in STD_LOGIC_VECTOR (n-1 downto 0);
           C : in STD_LOGIC_VECTOR (1 downto 0);
           S : out STD_LOGIC_VECTOR (n downto 0));
    end component;
    signal IA,IB: std_logic_vector(n-1 downto 0);
    signal IC: std_logic_vector(1 downto 0);
    signal OS: std_logic_vector(n downto 0);
begin
    circ: App1121 port map(IA,IB,IC,OS);
    process begin
        IA<=(0=>'1',1=>'1',others=>'0'); 
        IB<=(0=>'1',3=>'1',others=>'0'); 
        IC<="00";
        wait for 3ns;
        IC<="10";     
        wait for 3ns;
        IC<="11";     
        wait for 3ns;
        IC<="01";     
        wait for 3ns;
        IC<="10";     
        wait for 3ns;
        IA<=(0=>'1',7=>'1',others=>'0');
        wait for 2ns;
        IC<="01";     
        wait for 3ns;
    end process;
end Behavioral;
