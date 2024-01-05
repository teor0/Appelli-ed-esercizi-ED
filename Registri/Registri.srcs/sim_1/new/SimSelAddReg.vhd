library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity SimSelAddReg is
--  Port ( );
end SimSelAddReg;

architecture Behavioral of SimSelAddReg is

    component SelAddReg is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Clk : in STD_LOGIC;
           C : in STD_LOGIC;
           Reset : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (8 downto 0));
    end component;
    
    signal IA,IB: std_logic_vector(7 downto 0);
    signal IC,IR: std_logic;
    signal IClk: std_logic:='0';
    signal OS: std_logic_vector(8 downto 0);

begin
    circ: SelAddReg port map(IA,IB,IClk,IC,IR,OS);
    process begin
        wait for 2ns;
        IClk<=not(IClk);
    end process;
    process begin
        IA<=(0=>'1',2=>'1',others=>'0');
        IB<=(0=>'1',3=>'1',others=>'0');
        IC<='0';
        IR<='1';
        wait for 7ns;
        IC<='1';
        wait for 7ns;
        IR<='0';
        wait for 7ns;
        IC<='0';
        wait for 7ns;
        IC<='1';
        wait for 7ns;
        IC<='0';
        wait for 7ns;
    end process;
end Behavioral;
