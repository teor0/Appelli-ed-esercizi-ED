library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SimSel is
end SimSel;

architecture Behavioral of SimSel is
    component Selector is
        Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (1 downto 0);
           S : out STD_LOGIC_VECTOR (8 downto 0));
    end component;
    signal IA: STD_LOGIC_VECTOR(7 downto 0);
    signal IB: STD_LOGIC_VECTOR(1 downto 0);
    signal OS: STD_LOGIC_VECTOR(8 downto 0);
begin
    circ: Selector port map(IA,IB,OS);
    process begin
        IA<="00000010";
        IB<="00";
        wait for 5ns;
        IB<="01";
        wait for 5ns;
        IB<="10";
        wait for 5ns;
        IB<="11";
        wait for 5ns;
    end process;
end Behavioral;
