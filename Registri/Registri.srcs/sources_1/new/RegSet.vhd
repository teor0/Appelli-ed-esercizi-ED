library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity RegSet is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           Set : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0));
end RegSet;

architecture Behavioral of RegSet is
begin
    process(Clk) begin
        if(falling_edge(Clk))then
            if(Set='1')then
                S<="0001";
            elsif(Set='0')then
                S<=A;
            end if;
        end if;
    end process;
end Behavioral;
