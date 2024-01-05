library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity FF4F is
    Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0));
end FF4F;

architecture Behavioral of FF4F is

begin
    process(Clk) begin
        if(falling_edge(Clk))then
            S<=I;
        end if;
    end process;
end Behavioral;
