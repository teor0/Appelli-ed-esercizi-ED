library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Sim is
--  Port ( );
end Sim;

architecture Behavioral of Sim is
    component RegSel is
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               Clr : in STD_LOGIC;
               Clk : in STD_LOGIC;
               Sel: in STD_LOGIC;
               S : out STD_LOGIC_VECTOR (4 downto 0));
    end component;  
    signal IA: STD_LOGIC_VECTOR(3 downto 0);
    signal ICl,ISel: STD_LOGIC;
    signal ICk: STD_LOGIC:='0';
    signal OS: STD_LOGIC_VECTOR(4 downto 0);
begin
    mycirc: RegSel port map(IA,ICl,ICk,ISel,OS);
    process begin
        wait for 5ns;
        ICk <= not ICk;
    end process;
    
    process begin
        IA<= "0010";
        ICl<='0';
        ISel<='0';
        wait for 2ns;
        IA<= "0110";
        wait for 4ns;
        ICl<='1';
        wait for 2ns;
        IA<= "0010";
        ICl<='0';
        ISel<='1';
        wait for 7ns;
    end process;
end Behavioral;
