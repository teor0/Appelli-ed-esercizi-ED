library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SimCA is
generic(n: integer:= 16);
--  Port ( );
end SimCA;
architecture Behavioral of SimCA is
    component CarrySelGen is
        Port ( A : in STD_LOGIC_VECTOR (n-1 downto 0);
               B : in STD_LOGIC_VECTOR (n-1 downto 0);
               Cin: in STD_LOGIC;
               S : out STD_LOGIC_VECTOR (n downto 0));
    end component;
    signal IA,IB: STD_LOGIC_VECTOR(n-1 downto 0);
    signal ICin: STD_LOGIC;
    signal OS: STD_LOGIC_VECTOR(n downto 0);
begin
    circ: CarrySelGen port map(IA,IB,ICin,OS);
    process begin
        IA<=(0=>'1',2=>'1',others=>'0');
        IB<=(0=>'1',1=>'1',others=>'0');
        ICin<='0';
        wait for 5 ns;
        ICin<='1';
        wait for 5 ns;  
    end process;
end Behavioral;
