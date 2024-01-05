library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Sim is
--  Port ( );
end Sim;

architecture Behavioral of Sim is
    component SelAdd is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Clk : in STD_LOGIC;
           Sel: in STD_LOGIC;
           Set : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (8 downto 0));
    end component;
    signal IA,IB: STD_LOGIC_VECTOR(7 downto 0);
    signal IClk: STD_LOGIC:='0';
    signal ISel: STD_LOGIC;
    signal ISet: STD_LOGIC:='1';
    signal OS: STD_LOGIC_VECTOR(8 downto 0);
begin
    circ: SelAdd port map(IA,IB,IClk,ISel,ISet,OS);
    process begin
        IClk<= not IClk;
        wait for 5 ns;
    end process;
    process begin
        ISel<='0';
        wait for 6ns;
        ISet<='0';
        IA<=(1=>'1',0=>'1',others=>'0');
        IB<=(1=>'1',2=>'1',others=>'0');
        wait for 2ns;
        ISel<='1';
        wait for 4ns;
    end process;
end Behavioral;
