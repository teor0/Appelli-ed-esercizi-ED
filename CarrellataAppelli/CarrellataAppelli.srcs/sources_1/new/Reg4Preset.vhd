library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg4Preset is
    Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           Pr : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0));
end Reg4Preset;

architecture Behavioral of Reg4Preset is

begin
    process(I,Clk,Pr) begin
        if(Pr='1')then
            S<=(others=>'1');
        elsif(Clk='1')then
            S<=I;
        end if;
    end process;
end Behavioral;
