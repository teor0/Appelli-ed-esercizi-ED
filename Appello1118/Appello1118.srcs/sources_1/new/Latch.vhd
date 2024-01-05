library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Latch is
    Port ( D,Clr: in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC);
end Latch;

architecture Behavioral of Latch is
begin
    process(D,Clk,Clr)
    begin
        if(Clr='1') then
            Q<='0';
        elsif(Clk='1') then 
            Q<=D;
        end if;
     end process;
end Behavioral;
