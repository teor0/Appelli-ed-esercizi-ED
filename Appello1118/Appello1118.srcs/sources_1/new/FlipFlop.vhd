library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity FlipFlop is
    Port ( D : in STD_LOGIC;
           Clk,Clr : in STD_LOGIC;
           Q : out STD_LOGIC);
end FlipFlop;

architecture Behavioral of FlipFlop is

begin
    process(Clk,Clr)
    begin
        if(Clr='0') then
           Q<='0';
        elsif(rising_edge(Clk))then
            Q<=D;
        end if;
    end process;
end Behavioral;
