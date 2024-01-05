library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Add8Struct is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (8 downto 0));
end Add8Struct;

architecture Behavioral of Add8Struct is
component FA is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Cout : out STD_LOGIC;
           S : out STD_LOGIC);
end component;
signal EA,EB: STD_LOGIC_VECTOR (8 downto 0);
signal carry: STD_LOGIC_VECTOR (9 downto 0);
begin
    EA<=(A(7)) &A; EB<=(B(7))&B;
    myfor: for i in 0 to 8 generate
            FAp: FA port map (EA(i), EB(i), carry(i), carry(i+1), S(i));
    end generate;
    carry(0)<=cin;
end Behavioral;
