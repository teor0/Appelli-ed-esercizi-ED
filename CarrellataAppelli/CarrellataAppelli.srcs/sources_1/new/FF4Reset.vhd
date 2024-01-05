library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity FF4Reset is
    Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
           Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0));
end FF4Reset;

architecture Behavioral of FF4Reset is

begin
    process(Clk) begin
        if(falling_edge(Clk))then
            if(Reset='1')then
                S<=(others=>'1');
            elsif(Reset='0')then
                S<=I;
            end if;
        end if;
    end process;
end Behavioral;
