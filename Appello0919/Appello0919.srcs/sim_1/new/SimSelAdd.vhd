library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SimSelAdd is
--  Port ( );
end SimSelAdd;

architecture Behavioral of SimSelAdd is
    component SelAdd is
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (4 downto 0));
    end component;
    signal IA,IB: STD_LOGIC_VECTOR(3 downto 0);
    signal IC: STD_LOGIC;
    signal OS: STD_LOGIC_VECTOR(4 downto 0);
begin
    circ: SelAdd port map(IA,IB,IC,OS);
    process begin
        IA<="0011";
        IB<="0001";
        IC<='0';
        wait for 5ns;
        IA<="0100";
        IB<="0011";
        IC<='1';
        wait for 3ns;
        IA<="1111";
        IB<="1111";
        IC<='0';
        wait for 3ns;
        IA<="1111";
        IB<="1111";
        IC<='1';
        wait for 2ns;
         IA<="0111";
        IB<="0111";
        IC<='0';
        wait for 3ns;
    end process;
end Behavioral;
