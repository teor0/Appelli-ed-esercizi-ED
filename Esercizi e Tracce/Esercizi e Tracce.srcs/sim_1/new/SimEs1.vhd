library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SimEs1 is
--  Port ( );
end SimEs1;

architecture Behavioral of SimEs1 is

component Esercizio1 is
    Port( A: in STD_LOGIC;
          B: in STD_LOGIC;
          Cin: in STD_LOGIC;
          Cout: out STD_LOGIC;
          S: out STD_LOGIC);
end component;
signal IA,IB,ICin,OCout,OS: STD_LOGIC;
begin
    mycirc: Esercizio1 port map
        (IA,IB,ICin,OCout,OS);
    process
    begin
        IA<='0';
        IB<='0';
        ICin<='0';
        wait for 10ns;
        IA<='1';
        wait for 10ns;
        IB<='1';
        wait for 10ns;
        ICin<='1';
        wait for 20ns;
        IA<='0';
        IB<='0';
        ICin<='0';
    end process;
end Behavioral;
