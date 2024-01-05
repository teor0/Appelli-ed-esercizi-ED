library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity RegReset is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0));
end RegReset;

architecture Behavioral of RegReset is

begin
    process(Clk,Reset) begin
        if(rising_edge(Clk))then
            if(Reset='1')then
                S<=(others=>'0');
            elsif(Reset='0')then
                S<=A;
            end if;
        end if;
    end process;
end Behavioral;
