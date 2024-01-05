library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity MySim is
--  Port ( );
end MySim;

architecture Behavioral of MySim is
    component FA is 
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Cout : out STD_LOGIC;
           S : out STD_LOGIC);
    end component;
signal IA,IB,Icin,Ocout,Os: STD_LOGIC;
begin
    mycirc: FA port map(IA,IB,Icin,Ocout,Os);
    process
    begin
        IA<='0'; IB<='0'; Icin<='0';
        wait for 10ns;
        IA<='1';
        wait for 10ns;
        IB<='1';
        wait for 10ns;
        Icin<='1';
        wait for 20ns;
        IA<='0'; IB<='0'; Icin<='0';
    end process;
end Behavioral;
