library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SimAdd8BS is
--  Port ( );
end SimAdd8BS;

architecture Behavioral of SimAdd8BS is

component Add8BS is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (8 downto 0));
end component;

component Add8BB is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (8 downto 0));
end component;

signal IA : STD_LOGIC_VECTOR (7 downto 0);
signal IB : STD_LOGIC_VECTOR (7 downto 0);
signal ICin : STD_LOGIC;
signal OS, OS2 : STD_LOGIC_VECTOR (8 downto 0);


begin
    myCircB: Add8BB port map(IA,IB,ICin,Os2);
    myCircS: Add8BS port map(IA,IB,ICin,Os);
    process
    begin
        ICin<='0';
        IA<="00000000";
        IB<=(others =>'0'); -- metodo piu veloce
        wait for 10ns;
        IA(7)<='1';
        wait for 10ns;
        IB(7)<='1';
        wait for 10ns;
        IA<=(others =>'1');
        IB<=(others =>'1');
        wait for 10ns;
    end process;

end Behavioral;
