library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity SimSel is
--  Port ( );
end SimSel;

architecture Behavioral of SimSel is
    component Selector is
        Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
               B : in STD_LOGIC_VECTOR (7 downto 0);
               Clr : in STD_LOGIC;
               Clk : in STD_LOGIC;
               Sel : in STD_LOGIC_VECTOR(1 downto 0);
               S : out STD_LOGIC_VECTOR (8 downto 0));
    end component;
    signal IA,IB: STD_LOGIC_VECTOR(7 downto 0);
    signal IClr: STD_LOGIC;
    signal IClk: STD_LOGIC:='0';
    signal ISel: STD_LOGIC_VECTOR(1 downto 0);    
    signal OS: STD_LOGIC_VECTOR(8 downto 0);
begin
    circ: Selector port map(IA,IB,IClr,IClk,ISel,OS);
    IA<=(2=>'1',others=>'0');
    IB<=(5=>'1',others=>'0');
    process begin
        IClk<= not IClk;
        wait for 5ns;
    end process;
    process begin
        wait for 2ns;
        IClr<='1';
        ISel<="00";
        wait for 4ns;
        IClr<='0';
        wait for 4ns;
        ISel<="01";
        wait for 4ns;
        ISel<="11";
        wait for 4ns;
        ISel<="10";
        wait for 7ns;
    end process;
end Behavioral;
