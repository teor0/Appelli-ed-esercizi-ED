library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SimSel is
--  Port ( );
end SimSel;

architecture Behavioral of SimSel is
    component Selector is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           Clk : in STD_LOGIC;
           Sel : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (8 downto 0));
    end component;
    signal IClk: std_logic:='0';
    signal IA: std_logic_vector(7 downto 0);
    signal ISel: std_logic;
    signal OS: std_logic_vector(8 downto 0);
begin
    circ: Selector port map(IA,IClk,ISel,OS);
    process begin
        IClk<= not IClk;
        wait for 3 ns;
    end process;
    process begin
        ISel<='0';
        IA<="00000011";
        wait for 5 ns;
        IA<="00000111";
        wait for 3 ns;
        ISel<='1';
        wait for 3 ns;
        wait for 4 ns;
    end process;
end Behavioral;
