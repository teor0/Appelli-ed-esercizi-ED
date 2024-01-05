library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity SimSel0219 is
--  Port ( );
end SimSel0219;

architecture Behavioral of SimSel0219 is

    component Sel0219 is
        Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           C : in STD_LOGIC;
           Clk: in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (8 downto 0));
    end component;
    
    signal IA: std_logic_vector(7 downto 0);
    signal IC: std_logic;
    signal IClk: std_logic:='0';
    signal OS: std_logic_vector(8 downto 0);
      
begin
    circ: Sel0219 port map(IA,IC,IClk,OS);
    process begin
        wait for 2ns;
        IClk<=not(IClk);
    end process;
    process begin
        IA<=(0=>'1',1=>'1',others=>'0');
        IC<='0';
        wait for 3ns;
        IC<='1';
        wait for 3ns;
        IC<='0';
        wait for 3ns;
        IA<=(1=>'1',others=>'0');
        wait for 3ns;
    end process;
end Behavioral;
