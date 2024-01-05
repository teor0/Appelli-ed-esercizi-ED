library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Reg4 is
    Port ( D : in STD_LOGIC_VECTOR(3 downto 0);
           Clk,Clr : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR(3 downto 0));
end Reg4;

architecture Behavioral of Reg4 is

begin
    process(Clk,Clr)
    begin
        if(Clr='0') then
           Q<=(others=>'0');
        elsif(rising_edge(Clk))then
            Q<=D;
        end if;
    end process;
end Behavioral;
