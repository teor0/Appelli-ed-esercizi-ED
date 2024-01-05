library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg4CC is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           Clr : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end Reg4CC;

architecture Behavioral of Reg4CC is
begin
    process(Clk,Clr)
    begin
        if(Clr='1')then
            Q<=(others=>'0');
        elsif(Clk='1')then
            Q<=D;
        end if;
    end process;
end Behavioral;
