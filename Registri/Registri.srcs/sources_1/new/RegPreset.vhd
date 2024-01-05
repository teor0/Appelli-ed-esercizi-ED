library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RegPreset is
    Port ( Q : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Preset : in STD_LOGIC;
           S : out STD_LOGIC);
end RegPreset;

architecture Behavioral of RegPreset is

begin
    process(Clk,Preset)begin
        if(Preset='1')then
            S<='1';
        elsif(rising_edge(Clk))then
             S<=Q;
        end if;
    end process;
end Behavioral;
