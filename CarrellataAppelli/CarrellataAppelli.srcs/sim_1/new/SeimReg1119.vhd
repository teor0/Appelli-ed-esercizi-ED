library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SeimReg1119 is
--  Port ( );
end SeimReg1119;

architecture Behavioral of SeimReg1119 is

    component Reg1119 is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);           
           Clk : in STD_LOGIC;
           C : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (8 downto 0));
end component;

    signal IA: std_logic_vector(7 downto 0);
    signal IC: std_logic;
    signal IClk: std_logic:='0';
    signal OS: std_logic_vector(8 downto 0);

begin
    cir: Reg1119 port map(IA,IClk,IC,OS);
    process begin
        wait for 2ns;
        IClk<=not(IClk);
    end process;
    process begin
        IA<=(0=>'1',1=>'1',others=>'0');
        IC<='0';
        wait for 3ns;
        IC<='1';
        wait for 4ns;
        IA<=(0=>'1',7=>'1',others=>'0');
        IC<='0';
        wait for 4ns;
        IC<='1';
        wait for 4ns;
    end process;
end Behavioral;
