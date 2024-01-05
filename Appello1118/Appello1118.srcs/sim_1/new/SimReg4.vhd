library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity SimReg4 is
--  Port ( );
end SimReg4;

architecture Behavioral of SimReg4 is
    component Reg4
        port(D: in std_logic_vector(3 downto 0);
             clk,clr: in std_logic;
             Q: out std_logic_vector(3 downto 0));
    end component;
    signal ID,OQ: std_logic_vector(3 downto 0);
    signal IClk: std_logic:='0';
    signal IClr: std_logic:='0';
begin
    circ: Reg4 port map(ID,IClk,IClr,OQ);
    process begin
        wait for 5ns;
        IClk<= not IClk;
    end process;
    process begin
        ID<=(0=>'1',others=>'0');
        wait for 7ns;
        ID<="0011";
        wait for 10ns;
        ID<="1110";
        wait for 3ns;        
    end process;
end Behavioral;
