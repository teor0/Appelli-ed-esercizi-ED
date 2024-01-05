library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Selector is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           Clk : in STD_LOGIC;
           Sel : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (8 downto 0));
end Selector;

architecture Behavioral of Selector is
    signal B,EA,one,two,p,g,RegS: STD_LOGIC_VECTOR(8 downto 0);
    signal carry: STD_LOGIC_VECTOR(9 downto 0);
begin
    process(Clk) begin
        if(falling_edge(Clk))then
            RegS<= p xor carry(8 downto 0);
        end if;
    end process;
    EA<=A(7)&A;
    one<=(0=>'1', others=>'0');
    two<=(1=>'1', others=>'0');
    B<= one when Sel='0' else
        two when Sel='1' else
        (others=>'X');
    p<=EA xor B;
    g<=EA and B;
    carry(0)<='0';
    carry(9 downto 1)<= g or (p and carry(8 downto 0));
    S<=RegS;
end Behavioral;
