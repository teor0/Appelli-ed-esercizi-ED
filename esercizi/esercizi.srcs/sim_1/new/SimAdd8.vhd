library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SimAdd8 is
--  Port ( );
end SimAdd8;

architecture Behavioral of SimAdd8 is
component Add8Struct is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (8 downto 0));
end component;
signal IA : STD_LOGIC_VECTOR (7 downto 0);
signal IB :  STD_LOGIC_VECTOR (7 downto 0);
signal Icin :  STD_LOGIC;
signal Os : STD_LOGIC_VECTOR (8 downto 0);
begin
    circ1: Add8Struct port map(IA,IB,Icin,Os);
    process
    begin
        Icin<='0';
        IA<="00000000";
        IB<=(others=>'0'); --poni tutti i bit di B uguali a 0
        wait for 10ns;
        IA(7)<='1'; --IA="10000000" pari a -128
        wait for 10ns;
        IB(7)<='1';
        wait for 10ns;
        IA<=(others=>'1'); -- pone tutti i restanti bit ad 1 quindi ho "11111111"
        IB<=(others=>'1');
        wait for 10ns;
    end process;


end Behavioral;
