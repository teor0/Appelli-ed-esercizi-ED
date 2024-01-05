library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Esercizio1 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Cout : out STD_LOGIC;
           S : out STD_LOGIC);
end Esercizio1;

architecture Behavioral of Esercizio1 is

begin
    Cout<=(A and B) or ((A xor B) and Cin);
    S<=(A xor B) xor Cin;
end Behavioral;
