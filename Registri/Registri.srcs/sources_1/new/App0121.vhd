-- 2A se C=0, 4A se C=1, inoltre ho registro sull'uscita
-- con Clear, Set sensibile a fronti di discesa


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity App0121 is
    Port ( A : in STD_LOGIC_VECTOR(7 downto 0);
           C : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Clr : in STD_LOGIC;
           Set : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR(9 downto 0));
end App0121;

architecture Behavioral of App0121 is

    signal Aux: std_logic_vector(9 downto 0);
    signal RegS: std_logic_vector(9 downto 0);

begin
    Aux<=A(7)&A&'0' when C='0' else
         A&"00" when C='1' else
         (others=>'X');
    process(Clk,Clr)begin
        if(Clr='1')then
            RegS<=(others=>'0');
        elsif(falling_edge(Clk))then
            if(Set='1')then
                RegS<=(others=>'1');
            elsif(Set='0')then
                RegS<=Aux;
            end if;
        end if;
    end process;
    S<=RegS;
end Behavioral;
