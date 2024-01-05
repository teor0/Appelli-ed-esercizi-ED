library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SimAdd_nBit is
    generic(n:integer:=8);
end SimAdd_nBit;

architecture Behavioral of SimAdd_nBit is

    component Add_nBit is
        generic(n:integer:=8);
        Port ( A : in STD_LOGIC_VECTOR (n-1 downto 0);
               B : in STD_LOGIC_VECTOR (n-1 downto 0);
               Cin : in STD_LOGIC;
               S : out STD_LOGIC_VECTOR (n downto 0));
    end component;

    signal IA: STD_LOGIC_VECTOR(n-1 downto 0);
    signal IB: STD_LOGIC_VECTOR(n-1 downto 0);
    signal ICin: STD_LOGIC;
    signal OS: STD_LOGIC_VECTOR(n downto 0);

    begin 
        circ: Add_nBit generic map(n) port map(IA,IB,ICin,OS);
        process
        begin
            IA<=(others =>'0');
            IB<=(others =>'0');
            wait for 20ns;
            IA<=(others =>'1');
            IB<=(others =>'1');
            wait for 10ns;
        end process;

end Behavioral;
