library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Reg4Reset is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end Reg4Reset;

architecture Behavioral of Reg4Reset is

begin
    process(Clk)
    begin
    if(falling_edge(Clk))then
        if(reset='1')then
            Q<=(others=>'0');
        elsif(reset='0')then
            Q<=D;
        end if;
    end if;
    end process;
end Behavioral;
