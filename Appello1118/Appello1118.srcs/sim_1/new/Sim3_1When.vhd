library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sim3_1When is
--  Port ( );
end Sim3_1When;

architecture Behavioral of Sim3_1When is

    component Mux3_1 is
        Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           Sel1 : in STD_LOGIC_VECTOR(1 downto 0);
           O: out STD_LOGIC);
    end component;
    signal IA,IB,IC,OS:STD_LOGIC;
    signal ISe: STD_LOGIC_VECTOR(1 downto 0);
begin
    circ: Mux3_1 port map(IA,IB,IC,ISe,OS);
    process begin
        IA<='1';
        wait for 3ns;
        ISe<="00";
        wait for 1ns;
        IA<='0';
        IB<='1';
        wait for 2ns;
        ISe<="01";
        wait for 1ns;
        IB<='0';
        IC<='1';
        wait for 2ns;
        ISe<="10";
        wait for 3ns;
        Ise<="11";
    end process;
end Behavioral;
