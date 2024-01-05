library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sim0923 is
--  Port ( );
end Sim0923;

architecture Behavioral of Sim0923 is

    component Sel0923 is
    Port(A,B: in std_logic_vector(7 downto 0);
         C: in std_logic_vector(1 downto 0);
         S: out std_logic_vector(8 downto 0));
    end component;
    
    signal IA,IB: std_logic_vector(7 downto 0);
    signal IC: std_logic_vector(1 downto 0);
    signal OS: std_logic_vector(8 downto 0);
    
begin
    circ: Sel0923 port map(IA,IB,IC,OS);
    process begin
        IA<=(7=>'1',3=>'1',0=>'1',others=>'0');
        IB<=(7=>'1',5=>'1',1=>'1',others=>'0');
        IC<="00";
        wait for 2ns;
        IC<="11";
        wait for 2ns;
        IC<="01";
        wait for 1ns;
        IC<="10";
        wait for 1ns;
        IC<="00";
        wait for 2ns;
        IA<=(7=>'1',5=>'1',1=>'1',others=>'0');
        wait for 2ns;
        IC<="11";
        wait for 2ns;
        IB<=(7=>'1',2=>'1',1=>'1',others=>'0');
        wait for 2ns;
        IC<="00";
        wait for 2ns;
        IA<=(1=>'1',2=>'1',others=>'0');
        wait for 2ns;
        IC<="01";
        wait for 2ns;
    end process;
end Behavioral;
