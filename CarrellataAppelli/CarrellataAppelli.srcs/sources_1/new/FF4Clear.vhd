library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity FF4Clear is
    Port ( I : in STD_LOGIC_VECTOR (0 downto 0);
           Clr : in STD_LOGIC;
           Clk : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0));
end FF4Clear;

architecture Behavioral of FF4Clear is

begin
    process(Clk,Clr) begin
        if(Clr='0')then --attivo basso
           S<=(others=>'0');
        elsif(rising_edge(Clk))then
            S<=I;
        end if;
    end process;
end Behavioral;
