library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Simulazione is
--  Port ( );
end Simulazione;

architecture Behavioral of Simulazione is
    component SelAdd is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           C : in STD_LOGIC;
           Clk : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (4 downto 0));
    end component;
    signal IA: STD_LOGIC_VECTOR(3 downto 0);
    signal IC: STD_LOGIC;
    signal IClk: STD_LOGIC:='0';
    signal OS: STD_LOGIC_VECTOR(4 downto 0);
begin
    circ: SelAdd port map(IA,IC,IClk,OS);
    process begin
        wait for 5 ns;
        IClk<= not IClk;      
    end process;
    
    process begin
        IA<="0001";
        IC<='0';
        wait for 2ns;
        IA<="0101";
        wait for 4ns;
        IC<='1';
        wait for 3ns;
    end process;

end Behavioral;
