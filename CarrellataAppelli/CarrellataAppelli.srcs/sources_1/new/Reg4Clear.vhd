library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Reg4Clear is
    Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           Clr : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0));
end Reg4Clear;

architecture Behavioral of Reg4Clear is

begin
    process(I,Clk,Clr) begin
        if(Clr='1')then
            S<=(others=>'0');
        elsif(Clk='1')then
            S<=I;
        end if;
    end process;
end Behavioral;
