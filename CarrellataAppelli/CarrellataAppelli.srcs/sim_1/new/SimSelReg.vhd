library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
---  000 | A
---  001 | A
---  010 | 2A
---  011 | 2A
---  100 | -A
---  101 | -A
---  110 | -2A
---  111 | -2A

entity SimSelReg is
--  Port ( );
end SimSelReg;

architecture Behavioral of SimSelReg is

    component SelReg is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           C : in STD_LOGIC_VECTOR (2 downto 0);
           Clk: in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (8 downto 0));
    end component;

    signal IA: STD_LOGIC_VECTOR(7 downto 0);
    signal IC: STD_LOGIC_VECTOR(2 downto 0);
    signal IClk: STD_LOGIC:='0';
    signal OS: STD_LOGIC_VECTOR(8 downto 0);    
begin
    circ: SelReg port map(IA,IC,IClk,OS);
    process begin
        wait for 2ns;
        IClk<=not(IClk);
    end process;
        
    process begin
        IA<=(0=>'1',2=>'1',others=>'0');
        IC<="000";
        wait for 4ns;
        IC<="100";
        wait for 4ns;
        IC<="010";
        wait for 4ns;
        IC<="111";
        wait for 4ns;
        IC<="000";
        wait for 4ns;
    end process;
end Behavioral;
