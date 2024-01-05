library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity SimMux3_1 is
--  Port ( );
end SimMux3_1;

architecture Behavioral of SimMux3_1 is
    component Mux3_1 is
        Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           Sel1 : in STD_LOGIC;
           Sel2 : in STD_LOGIC;
           O: out STD_LOGIC);
     end component;
     signal IA,IB,IC,IS1,IS2,OS: STD_LOGIC;
begin
    circ: mux3_1 port map(IA,IB,IC,IS1,IS2,OS);
    process begin   
        IA<='1';
        IB<='0';
        wait for 2ns;
        IS1<='0';
        wait for 5ns;
        IC<='0';
        wait for 2ns;
        IS2<='1';
    end process;
end Behavioral;
