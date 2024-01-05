library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
entity SimAdd is
generic(n:integer:=8);
-- port();
end SimAdd;

architecture Behavioral of SimAdd is
    component AddSel is
        generic(n:integer:=8);
        Port(
           A: in STD_LOGIC_VECTOR (n-1 downto 0);
           --B: in STD_LOGIC_VECTOR (n-1 downto 0);
           C : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (n downto 0));
    end component;
    signal IA: STD_LOGIC_VECTOR(n-1 downto 0);
   -- signal IB: STD_LOGIC_VECTOR(n-1 downto 0);
    signal IC: STD_LOGIC;
    signal OS: STD_LOGIC_VECTOR(n downto 0);    
begin
    circ: AddSel generic map(n) port map(IA,IC,OS);
    process 
    begin
        IC <= '0';
        for va in -(2**(n-1)) to (2**(n-1)-1) loop
            IA <=CONV_STD_LOGIC_VECTOR(va,n);
            wait for 10ns;
        end loop;
        IC <= '1';
        for va in -(2**(n-1)) to (2**(n-1))-1 loop
            IA <=CONV_STD_LOGIC_VECTOR(va,n);
            wait for 10ns;
        end loop;
    end process;

end Behavioral;
