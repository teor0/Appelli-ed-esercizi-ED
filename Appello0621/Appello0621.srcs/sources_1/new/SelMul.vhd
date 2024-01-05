library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- le moltiplicazioni sono shift verso sinistra, in particolare ogni shitf equivale ad un raddoppio
entity SelMul is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           C : in STD_LOGIC;
           O: out STD_LOGIC_VECTOR(9 downto 0));
end SelMul;

architecture Behavioral of SelMul is
    signal Risx2 : STD_LOGIC_VECTOR(8 downto 0);
    signal Risx4 : STD_LOGIC_VECTOR(9 downto 0);
begin
    Risx2(0)<='0';
    Risx2(8 downto 1)<=A;
    Risx4(0)<='0';
    Risx4(1)<='0';
    Risx4(9 downto 2)<=A;

    O<= Risx2 when C='0' else
        Risx4 when C='1' else
        (others=>'X');
end Behavioral;
