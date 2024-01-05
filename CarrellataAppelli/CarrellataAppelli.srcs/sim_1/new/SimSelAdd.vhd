library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SimSelAdd is
--  Port ( );
end SimSelAdd;

architecture Behavioral of SimSelAdd is

    component SelAdd is
    port(A,B: in std_logic_vector(7 downto 0);
         C: in std_logic_vector(1 downto 0);
         S: out std_logic_vector(8 downto 0));
    end component;

    signal IA,IB: std_logic_vector(7 downto 0);
    signal IC: std_logic_vector(1 downto 0);
    signal OS: std_logic_vector(8 downto 0);

begin
    circ: SelAdd port map(IA,IB,IC,OS);
    process begin
        IA<=(2=>'1',others=>'0');
        IB<=(3=>'1',4=>'1',others=>'0');
        IC<="00";
        wait for 2ns;
        IC<="10";
        wait for 2ns;
        IC<="01";
        wait for 2ns;
        IC<="11";
        wait for 2ns;
        IA<=(0=>'1',7=>'1',others=>'0');
        IC<="00";
        wait for 2ns;
        IC<="10";
        wait for 2ns;
        IB<=(1=>'1',7=>'1',others=>'0');
        IC<="01";
        wait for 2ns;
        IC<="11";
        wait for 2ns;
    end process;
end Behavioral;
