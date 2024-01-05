library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SimSelR is
--  Port ( );
generic(n:integer:=4);
end SimSelR;

architecture Behavioral of SimSelR is
    component AddSelR is
        generic(n:integer:=4);
        Port ( A : in STD_LOGIC_VECTOR (n-1 downto 0);
           B : in STD_LOGIC_VECTOR (n-1 downto 0);
           C : in STD_LOGIC_VECTOR (1 downto 0);
           Clk : in STD_LOGIC;
           Clr : in STD_LOGIC;
           Ris : out STD_LOGIC_VECTOR (n downto 0));
    end component;
    signal IA,IB: STD_LOGIC_VECTOR(n-1 downto 0);
    signal IC: STD_LOGIC_VECTOR(1 downto 0);
    signal IClk: STD_LOGIC:='0';
    signal IClr: STD_LOGIC:='0';
    signal ORi: STD_LOGIC_VECTOR(n downto 0);
begin
    circ: AddSelR generic map(n) port map(IA,IB,IC,IClk,IClr,ORi);
    process begin
        wait for 5ns;
        IClk <= not IClk;
    end process;
    process begin
    IA<=(1=>'1', others=>'0');
    IB<=(0=>'1', 2=>'1', others=>'0');
    IC<="01";
    wait for 5ns;
    IClr<='1';
    wait for 7ns;
    IC<="10";
    wait for 7ns;
    IC<="00";
    wait for 7ns;
    IC<="11";
    wait for 9ns;
    end process;
    
    
    
    
end Behavioral;
