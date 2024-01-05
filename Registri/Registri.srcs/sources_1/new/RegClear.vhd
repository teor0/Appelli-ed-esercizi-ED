library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity RegClear is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           Clr : in STD_LOGIC;
           Clk : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0));
end RegClear;

architecture Behavioral of RegClear is
begin
    process(Clk,Clr) begin
        if(Clr='1')then
            S<=(others=>'0');
        elsif(falling_edge(Clk))then
            S<=A;
        end if;
   end process;
end Behavioral;
