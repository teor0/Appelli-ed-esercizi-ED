library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity MyMux8_1 is
    Port ( Din : in STD_LOGIC_VECTOR (7 downto 0);
           Sel : in STD_LOGIC_VECTOR (2 downto 0);
           Dout : out STD_LOGIC;
           Dout1 : out STD_LOGIC);
end MyMux8_1;

architecture Behavioral of MyMux8_1 is
component MyMux8_1 is
    Port ( Din : in STD_LOGIC_VECTOR (7 downto 0);
           Sel : in STD_LOGIC_VECTOR (2 downto 0);
           Dout : out STD_LOGIC;
           Dout1 : out STD_LOGIC);
end component;
begin
    Dout<=Din(0) when Sel="000" else
          Din(1) when Sel="001" else
          Din(2) when Sel="010" else
          Din(3) when Sel="011" else
          Din(4) when Sel="100" else
          Din(5) when Sel="101" else
          Din(6) when Sel="110" else
          Din(7) when Sel="111" else 'X'; --casi rimanenti li pongo X
    
    with Sel select
    Dout1<=Din(0) when "000",
          Din(1) when "001",
          Din(2) when "010",
          Din(3) when "011",
          Din(4) when "100",
          Din(5) when "101",
          Din(6) when "110",
          Din(7) when "111",
          'X' when others;
    --soluzioni totalmente uguali!
end Behavioral;
