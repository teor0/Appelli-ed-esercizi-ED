library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Mux3_1 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           Sel1 : in STD_LOGIC_VECTOR(1 downto 0);
           --Sel2 : in STD_LOGIC;
           O: out STD_LOGIC);
end Mux3_1;
architecture Behavioral of Mux3_1 is
--signal O1: STD_LOGIC;
begin
    O<= A when Sel1="00" else
        B when Sel1="01" else
        C when Sel1="10" else
        'X' when Sel1="11" else
        'X';
   -- O1<=(A and (not Sel1)) or (B and Sel1);
    --O<=(O1 and (not Sel2)) or (C and Sel2);
end Behavioral;
