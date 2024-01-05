library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Sim1119 is
--  Port ( );
end Sim1119;

architecture Behavioral of Sim1119 is
    
    component Sel1119 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           C: in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (4 downto 0));
    end component;
    
    signal IA: STD_LOGIC_VECTOR(3 downto 0);
    signal IClk: STD_LOGIC:='0';
    signal IC: STD_LOGIC;
    signal OS: STD_LOGIC_VECTOR(4 downto 0);
    
begin
    circ: Sel1119 port map(IA,IClk,IC,OS);
    process begin
        wait for 2ns;
        IClk<=not(IClk);
    end process;
    
    process begin
        IA<="0110";
        IC<='0';
        wait for 3ns;
        IA<="0010";
        IC<='1';
        wait for 3ns;
        IA<="0101";
        IC<='0';
        wait for 3ns;
        IC<='1';
        wait for 3ns;
        IC<='1';
        wait for 3ns;
        IA<="0010";
        IC<='0';
        wait for 6ns;
    end process;
end Behavioral;
